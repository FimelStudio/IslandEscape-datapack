"""Generate owned player cleanup functions from the reviewed state contract."""
from pathlib import Path
import argparse, json
ROOT = Path(__file__).resolve().parents[1]
def outputs():
    schema = json.loads((ROOT / 'tools/state_contract.json').read_text(encoding='utf-8'))
    for group, fields in schema['groups'].items():
        lines = ['# 自动生成：tools/state_contract.json；请通过 python tools/generate_state.py 更新。', '# 执行者 @s 是待重置玩家；只清理本模块拥有的临时状态。']
        lines += [f'tag @s remove {tag}' for tag in fields['tags']]
        lines += [f'scoreboard players set @s {score} 0' for score in fields['scores'] if score not in ('ie.dialog', 'ie.eat_health', 'used_firework_last')]
        if 'used_firework_last' in fields['scores']:
            lines += ['execute unless score @s used_firework matches 0.. run scoreboard players set @s used_firework 0', 'scoreboard players operation @s used_firework_last = @s used_firework']
        lines += [f'scoreboard players reset @s {score}' for score in fields['scores'] if score in ('ie.dialog', 'ie.eat_health')]
        yield ROOT / f'data/escape_island/function/player/reset/{group}.mcfunction', '\n'.join(lines) + '\n'
    lines = ['# 自动生成：恢复本包修改过的玩家基础属性。']
    lines += [f'attribute @s minecraft:{name} base set {value}' for name, value in schema['attributes'].items()]
    yield ROOT / 'data/escape_island/function/player/reset/attributes.mcfunction', '\n'.join(lines) + '\n'
    lines = ['# 自动生成：清除本包临时交互进度；只针对正在退出的玩家。']
    lines += [f'advancement revoke @s only {name}' for name in schema.get('advancements', [])]
    yield ROOT / 'data/escape_island/function/player/reset/advancements.mcfunction', '\n'.join(lines) + '\n'
def main():
    parser = argparse.ArgumentParser(); parser.add_argument('--check', action='store_true'); args = parser.parse_args()
    stale = []
    for path, expected in outputs():
        if args.check:
            if not path.exists() or path.read_text(encoding='utf-8') != expected: stale.append(str(path.relative_to(ROOT)))
        else:
            path.parent.mkdir(parents=True, exist_ok=True); path.write_text(expected, encoding='utf-8', newline='\n')
    if stale: raise SystemExit('Stale cleanup functions: ' + ', '.join(stale))
    print('Player state contract: OK')
if __name__ == '__main__': main()
