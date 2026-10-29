"""Six- and twelve-player engine checks; requires a 12-client local sandbox."""
import argparse

from minecraft_acceptance import Acceptance

NAMES = [f'IE_Test{chr(65 + i)}' for i in range(12)]


def check_match(test, count):
    test.prepare()
    roles = [test.score(name, 'role') for name in NAMES[:count]]
    test.check(f'{count} players start with roles', test.score('$game', 'player_count') == count and all(1 <= role <= 10 for role in roles), str(roles))
    test.check(f'{count} players use all available unique roles first', len(set(roles)) == min(count, 10))
    test.sprint(2401)
    test.check(f'{count} players reach awakening', test.score('$game', 'cur_phase') == 2 and test.count('@a[tag=infected.mother]') == 1)
    test.sprint(1200)
    test.check(f'{count} players reach repair phase', test.score('$game', 'cur_phase') == 3 and test.score('$game', 'in_game') == 1)
    test.cmd('function escape_island:game/abort')
    test.check(f'{count} players leave cleanly', test.score('$game', 'in_game') == 0 and test.count('@a[tag=ie.active]') == 0)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--sandbox', required=True)
    args = parser.parse_args()
    test = Acceptance(args.sandbox)
    try:
        test.cmd('tick freeze')
        test.check('twelve test clients connected', all(name in test.cmd('list') for name in NAMES))
        test.cmd('function escape_island:game/cleanup')
        for name in NAMES[6:]:
            test.connection(name, False)
        check_match(test, 6)
        test.prepare()
        test.cmd('function escape_island:game/phase_2_awakening')
        test.check('six-player mother conversion updates human ledger', test.score('$game', 'ie.humans') == 5)
        test.cmd('execute as @a[tag=ie.participant,tag=team.human] at @s run function escape_island:infection/turn')
        test.sprint(20)
        test.check('all converted players trigger infection result', test.score('$game', 'ie.humans') == 0 and test.score('$game', 'ie.mode') == 4)
        settlements = test.score('$game', 'ie.settle_count')
        test.sprint(61)
        test.check('infection result settles once', test.score('$game', 'ie.settle_count') == settlements + 1 and test.count('@a[tag=ie.active]') == 0)
        for name in NAMES[6:]:
            test.connection(name, True)
        check_match(test, 12)
    finally:
        test.close('scaling-results.json')


if __name__ == '__main__':
    main()
