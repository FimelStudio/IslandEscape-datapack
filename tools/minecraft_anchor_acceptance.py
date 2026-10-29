"""Check that nearby downed players never remove each other's anchors."""
import argparse

from minecraft_acceptance import Acceptance


def anchored(test, kind, x):
    return test.count(f'@e[type=minecraft:marker,tag=entity.{kind}_anchor,x={x},y=251,z=0,distance=..0.3]')


def owned(test, kind, player):
    test.cmd('scoreboard players set $owned_count ie.accept 0')
    test.cmd(f'execute as @e[type=minecraft:marker,tag=entity.{kind}_anchor] if score @s ie.owner = {player} ie.actor run scoreboard players add $owned_count ie.accept 1')
    return test.score('$owned_count', 'ie.accept')


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--sandbox', required=True)
    args = parser.parse_args()
    test = Acceptance(args.sandbox)
    try:
        test.cmd('tick freeze')
        test.prepare()
        test.cmd('tp IE_TestA 0.0 251.0 0.0')
        test.cmd('tp IE_TestB 2.0 251.0 0.0')
        test.cmd('execute as IE_TestA at @s run function escape_island:infection/_sporify_start')
        test.cmd('execute as IE_TestB at @s run function escape_island:infection/_sporify_start')
        test.cmd('tp IE_TestA 1.9 251.0 0.0')
        test.cmd('execute as IE_TestA at @s run function escape_island:infection/anchor/follow {kind:"downed"}')
        test.check('downed player follows own anchor', test.count('@a[name=IE_TestA,x=0,y=251,z=0,distance=..0.3]') == 1)
        test.cmd('tp IE_TestA 1.9 251.0 0.0')
        test.cmd('execute as IE_TestA at @s run function escape_island:infection/_sporify_complete')
        test.check('sporification removes only the owner anchor', anchored(test, 'downed', 0) == 0 and anchored(test, 'downed', 2) == 1)
        test.cmd('execute as IE_TestB at @s run function escape_island:player/reset')
        test.check('player reset removes owned downed anchor', anchored(test, 'downed', 2) == 0)

        test.prepare()
        test.cmd('function escape_island:game/phase_2_awakening')
        humans = [name for name in ('IE_TestA', 'IE_TestB', 'IE_TestC', 'IE_TestD') if not test.count(f'@a[name={name},tag=infected.mother]')]
        first, second = humans[:2]
        for name, x in ((first, 0), (second, 2)):
            test.cmd(f'execute as {name} at @s run function escape_island:infection/turn')
            test.cmd(f'tp {name} {x}.0 251.0 0.0')
            test.cmd(f'execute as {name} at @s run function escape_island:infection/infected_death')
        test.cmd(f'tp {first} 1.9 251.0 0.0')
        test.cmd(f'execute as {first} at @s run function escape_island:infection/anchor/follow {{kind:"dead"}}')
        test.check('dead infected follows own anchor', test.count(f'@a[name={first},x=0,y=251,z=0,distance=..0.3]') == 1)
        test.cmd(f'tp {first} 1.9 251.0 0.0')
        test.cmd(f'execute as {first} at @s run function escape_island:infection/infected_respawn')
        test.check('respawn removes only the owner anchor', anchored(test, 'dead', 0) == 0 and anchored(test, 'dead', 2) == 1)
        test.cmd(f'execute as {second} at @s run function escape_island:player/reset')
        test.check('player reset removes owned dead anchor', anchored(test, 'dead', 2) == 0)

        test.prepare()
        test.cmd('function escape_island:game/phase_2_awakening')
        humans = [name for name in ('IE_TestA', 'IE_TestB', 'IE_TestC', 'IE_TestD') if not test.count(f'@a[name={name},tag=infected.mother]')]
        first, second = humans[:2]
        for name, x in ((first, 0), (second, 2)):
            test.cmd(f'tp {name} {x}.0 251.0 0.0')
            test.cmd(f'spawnpoint {name} {x} 251 0')
            test.cmd(f'damage {name} 10000 minecraft:generic_kill')
        test.sprint(40)
        test.check('two real deaths create separate owned anchors', test.count(f'@a[name={first},tag=state.sporifying]') == 1 and test.count(f'@a[name={second},tag=state.sporifying]') == 1 and owned(test, 'downed', first) == 1 and owned(test, 'downed', second) == 1)
        test.cmd(f'execute as {first} at @s run function escape_island:infection/_sporify_complete')
        test.check('one real death conversion preserves the other anchor', owned(test, 'downed', first) == 0 and owned(test, 'downed', second) == 1)
    finally:
        test.close('anchor-results.json')


if __name__ == '__main__':
    main()
