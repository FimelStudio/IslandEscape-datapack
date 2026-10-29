"""Resolve installed sibling packs for Spyglass without hard-coded machine paths."""
from pathlib import Path
import json
ROOT = Path(__file__).resolve().parents[1]
p = ROOT / 'spyglass.json'
cfg = json.loads(p.read_text(encoding='utf-8'))
cfg['env']['dependencies'] = ['@vanilla-datapack', '@vanilla-resourcepack', '@vanilla-mcdoc']
for name in ('dc_v2.1.0', 'FastMotion'):
    dependency = ROOT.parent / name
    if dependency.is_dir(): cfg['env']['dependencies'].append(dependency.as_uri() + '/')
p.write_text(json.dumps(cfg, ensure_ascii=False, indent=2) + '\n', encoding='utf-8', newline='\n')
print('Spyglass dependencies resolved for', ROOT)
