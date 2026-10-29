"""Dependency-aware structural validation; this is not a Minecraft command compiler."""
from pathlib import Path
import json, re, sys
from generate_state import outputs
ROOT = Path(__file__).resolve().parents[1]
RID = r'[a-z0-9_.-]+:[a-z0-9_./-]+'

def functions(root):
    return {p.relative_to(root).parts[1] + ':' + p.relative_to(root).as_posix().split('/function/', 1)[1][:-11]: p for p in root.glob('data/*/function/**/*.mcfunction')}

def validate():
    errors = []; local = functions(ROOT); known = dict(local)
    for name in ('FastMotion', 'dc_v2.1.0'):
        dependency = ROOT.parent / name
        if dependency.exists(): known.update(functions(dependency))
    definitions = set(); schedules = set(); cancels = set(); count = 0
    for path in [*ROOT.glob('data/**/*.json'), ROOT/'pack.mcmeta', ROOT/'spyglass.json', ROOT/'tools/state_contract.json']:
        count += 1
        try: data = json.loads(path.read_text(encoding='utf-8-sig'))
        except (ValueError, OSError) as e: errors.append(f'{path.relative_to(ROOT)}: {e}'); continue
        if '/tags/function/' in path.as_posix():
            for entry in data.get('values', []):
                value = entry if isinstance(entry, str) else entry.get('id', '')
                if value and not value.startswith('#') and value not in known and (isinstance(entry, str) or entry.get('required', True)):
                    errors.append(f'{path.relative_to(ROOT)}: missing function {value}')
        value = data.get('rewards', {}).get('function') if isinstance(data, dict) else None
        if value and value not in known: errors.append(f'{path.relative_to(ROOT)}: missing reward {value}')
    for fid, path in local.items():
        if not re.fullmatch(RID, fid): errors.append("Invalid function resource id: " + fid)
        for number, line in enumerate(path.read_text(encoding='utf-8-sig').splitlines(), 1):
            command = line.strip()
            if not command or command.startswith('#'): continue
            if command.startswith('/'): errors.append(f'{path.relative_to(ROOT)}:{number}: leading slash')
            if command.startswith('$'): continue  # Dynamic generator macros aren't literal resource ids.
            for ref in re.findall(r'\bfunction\s+('+RID+r')', command):
                if ref not in known: errors.append(f'{path.relative_to(ROOT)}:{number}: missing function {ref}')
            definitions.update(re.findall(r'^scoreboard objectives add ([\w.]+)', command))
            schedules.update(re.findall(r'\bschedule function ('+RID+r')', command))
            if fid == 'escape_island:game/cancel_schedules': cancels.update(re.findall(r'^schedule clear ('+RID+r')', command))
    for ref in schedules - cancels:
        if not ref.startswith('animated_java:'): errors.append('Unowned scheduled callback: ' + ref)
    schema = json.loads((ROOT/'tools/state_contract.json').read_text(encoding='utf-8'))
    advancements = schema.get('advancements', [])
    if len(advancements) != len(set(advancements)): errors.append('Duplicate temporary advancement in state contract')
    for name in advancements:
        if not re.fullmatch(RID, name):
            errors.append('Invalid temporary advancement: ' + name)
            continue
        namespace, relative = name.split(':', 1)
        if not (ROOT / 'data' / namespace / 'advancement' / (relative + '.json')).is_file():
            errors.append('Missing temporary advancement: ' + name)
    for group, fields in schema['groups'].items():
        if len(fields['tags']) != len(set(fields['tags'])): errors.append('Duplicate tags in ' + group)
        for objective in fields['scores']:
            if objective not in definitions: errors.append('Unregistered cleanup objective: ' + objective)
            if objective.startswith(('career_', 'mastery_', 'match_')): errors.append('Persistent/contribution score in temporary reset: ' + objective)
    for path, expected in outputs():
        if not path.exists() or path.read_text(encoding='utf-8') != expected: errors.append('Stale state output: ' + str(path.relative_to(ROOT)))
    pack = json.loads((ROOT/'pack.mcmeta').read_text(encoding='utf-8'))['pack']
    if pack.get('min_format') != [94, 1] or pack.get('max_format') != [94, 1]: errors.append('Unexpected 1.21.11 pack compatibility')
    if errors:
        print('\n'.join(errors)); return 1
    print(f'OK: {len(local)} functions, {count} JSON/metadata files, {len(schedules)} scheduled targets; dependency references and state generation verified.')
    return 0

if __name__ == '__main__': sys.exit(validate())
