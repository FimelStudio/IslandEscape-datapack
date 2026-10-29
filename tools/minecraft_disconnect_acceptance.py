"""Check infected death and respawn while the mother disconnects temporarily."""
import argparse

from minecraft_acceptance import Acceptance

NAMES = [f'IE_Test{chr(65 + i)}' for i in range(12)]


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--sandbox', required=True)
    args = parser.parse_args()
    test = Acceptance(args.sandbox)
    try:
        test.cmd('tick freeze')
        test.check('twelve test clients connected', all(name in test.cmd('list') for name in NAMES))
        test.prepare()
        test.sprint(2401)
        mother = next(name for name in NAMES if test.count(f'@a[name={name},tag=infected.mother]'))
        infected = next(name for name in NAMES if name != mother)
        test.cmd(f'execute as {infected} at @s run function escape_island:infection/turn')
        test.connection(mother, False)
        test.cmd(f'effect clear {infected} minecraft:resistance')
        test.cmd(f'damage {infected} 10000 minecraft:generic_kill')
        test.sprint(40)
        test.check('infected waits when living mother is offline', test.score('$game', 'mother_dead') == 0 and test.count(f'@a[name={infected},tag=state.dead,tag=!state.spectator]') == 1)
        # Retained priest adds ten seconds; cover the longest configured delay.
        test.sprint(900)
        test.check('offline mother does not cause permanent death', test.count(f'@a[name={infected},tag=state.dead,tag=!state.spectator]') == 1)
        test.connection(mother, True)
        test.sprint(80)
        test.check('infected respawns after mother reconnects', test.count(f'@a[name={infected},tag=infected.common,tag=!state.dead]') == 1)
        humans = [name for name in NAMES if name not in (mother, infected)]
        for name in humans:
            test.connection(name, False)
        test.sprint(40)
        test.check('offline survivors are not counted as converted', test.score('$game', 'in_game') == 1 and test.score('$game', 'ending_triggered') == 0)
        for name in humans:
            test.connection(name, True)
        test.connection(infected, False)
        test.cmd(f'effect clear {mother} minecraft:resistance')
        test.cmd(f'damage {mother} 10000 minecraft:generic_kill')
        test.sprint(40)
        test.check('purge waits for offline infected', test.score('$game', 'mother_dead') == 1 and test.score('$game', 'in_game') == 1)
        test.connection(infected, True)
        test.sprint(2)
        test.cmd(f'effect clear {infected} minecraft:resistance')
        test.cmd(f'damage {infected} 10000 minecraft:generic_kill')
        test.sprint(40)
        test.check('purge completes after returning infected dies', test.score('$game', 'in_game') == 0 and test.score('$game', 'escape_result') == 4)
    finally:
        online = test.cmd('list')
        for name in NAMES:
            if name not in online:
                test.connection(name, True)
        test.close('disconnect-results.json')


if __name__ == '__main__':
    main()
