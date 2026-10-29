"""Sample a 12-client sandbox match at the normal tick rate and save a profile."""
import argparse
import json
import time
import zipfile

from minecraft_acceptance import Acceptance

NAMES = [f'IE_Test{chr(65 + i)}' for i in range(12)]


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--sandbox', required=True)
    args = parser.parse_args()
    test = Acceptance(args.sandbox)
    profile = {'clients': 12, 'seconds': 15, 'conditions': 'Vanilla 1.21.11, isolated fixture, 3 repairers, headless clients', 'samples': []}
    try:
        test.cmd('tick freeze')
        if not all(name in test.cmd('list') for name in NAMES):
            raise RuntimeError('This profile requires twelve connected test clients')
        test.prepare()
        # Accelerated setup only; the profile itself runs at the normal 20 TPS target.
        test.cmd('scoreboard players set $game phase_timer 2399')
        test.sprint(2)
        test.cmd('scoreboard players set $game phase_timer 3599')
        test.sprint(2)
        if test.score('$game', 'cur_phase') != 3:
            raise AssertionError('Fixture did not reach repair phase')
        mother = next(name for name in NAMES if test.count(f'@a[name={name},tag=infected.mother]'))
        repairers = [name for name in NAMES if name != mother][:3]
        test.cmd(f'tp {mother} 0 251 40')
        for name, x in zip(repairers, (-24, -12, 12)):
            test.cmd(f'clear {name}')
            test.cmd(f'execute as {name} run function escape_island:task/give_cable')
            test.client_request('/action', {'name': name, 'action': 'slot', 'slot': 0})
            test.cmd(f'tp {name} {x} 251 0')
        report_dir = test.root / 'debug/profiling'
        existing = set(report_dir.glob('*.zip')) if report_dir.exists() else set()
        profile['start'] = test.cmd('perf start')
        if 'started' not in profile['start'].lower():
            raise RuntimeError('Server did not start profiling: ' + profile['start'])
        test.cmd('tick unfreeze')
        for _ in range(3):
            time.sleep(5)
            profile['samples'].append(test.cmd('tick query'))
        # Vanilla's /perf run ends automatically after ten seconds.
        test.cmd('tick freeze')
        reports = set(report_dir.glob('*.zip')) - existing
        if not reports:
            raise RuntimeError('No completed server profile archive found')
        report = max(reports, key=lambda path: path.stat().st_mtime)
        with zipfile.ZipFile(report) as archive:
            profile['summary'] = archive.read('server/profiling.txt').decode('utf-8', errors='replace').split('--- BEGIN PROFILE DUMP ---', 1)[0].strip()
        profile['report'] = str(report)
        print(json.dumps(profile, ensure_ascii=False, indent=2), flush=True)
        (test.root / 'profile-results.json').write_text(json.dumps(profile, ensure_ascii=False, indent=2), encoding='utf-8')
    finally:
        test.rcon.close()


if __name__ == '__main__':
    main()
