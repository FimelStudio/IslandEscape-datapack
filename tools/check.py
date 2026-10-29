"""Run all repository checks from any working directory."""
from pathlib import Path
import subprocess, sys
ROOT = Path(__file__).resolve().parents[1]
for args in (['tools/generate_state.py', '--check'], ['tools/validate_datapack.py'], ['-m', 'unittest', 'discover', '-s', 'tests', '-v']):
    result = subprocess.run([sys.executable, *args], cwd=ROOT)
    if result.returncode: raise SystemExit(result.returncode)
print('All offline checks passed. Minecraft world and multiplayer acceptance remain separate.')
