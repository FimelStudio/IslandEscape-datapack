"""Validate healing target selection and isolation with real clients."""
import argparse

from minecraft_acceptance import Acceptance, NAMES


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--sandbox', required=True)
    args = parser.parse_args()
    test = Acceptance(args.sandbox)
    try:
        test.cmd('tick freeze')
        test.check('four test clients connected', all(name in test.cmd('list') for name in NAMES))
        test.cmd('function escape_island:game/cleanup')
        test.cmd('function ie_accept:setup')
        for player in ('IE_TestA', 'IE_TestB'):
            test.cmd(f'execute as {player} at @s run function escape_island:training/start')
        test.cmd('execute as IE_TestA at @s run function escape_island:training/choose_doctor')
        test.cmd('execute as IE_TestB at @s run function escape_island:training/choose_captain')
        test.cmd('tag IE_TestD add skill.antidote.target')
        test.use_hotbar('IE_TestA', 6)
        test.check('doctor ignores inactive stale target', test.score('IE_TestA', 'skill.antidote_charges') == 1 and test.count('@a[name=IE_TestD,tag=skill.antidote.target]') == 1)
        test.sprint(12)
        test.cmd('execute as IE_TestB run function escape_island:infection/force_infect')
        test.use_hotbar('IE_TestA', 6)
        test.check('doctor cures active teammate', test.count('@a[name=IE_TestB,tag=!state.infected_period,tag=state.infection_resist]') == 1 and test.score('IE_TestA', 'skill.antidote_charges') == 0)
        test.cmd('execute as IE_TestA at @s run function escape_island:training/choose_chef')
        test.cmd('tp IE_TestA 0.0 251.0 0.0')
        test.cmd('tp IE_TestB 1.0 251.0 0.0')
        for player in ('IE_TestA', 'IE_TestB'):
            test.cmd(f'execute as {player} run function escape_island:infection/force_infect')
            test.cmd(f'scoreboard players set {player} infect_time 20')
        test.cmd('tag IE_TestD add skill.soup.target')
        test.use_hotbar('IE_TestA', 6)
        test.check('chef prioritizes infected teammate', test.score('IE_TestB', 'infect_time') >= 27 and test.score('IE_TestA', 'infect_time') <= 20)
        test.check('chef leaves inactive observer tags untouched', test.count('@a[name=IE_TestD,tag=skill.soup.target]') == 1)
        test.cmd('execute as IE_TestA at @s run function escape_island:training/choose_chef')
        test.cmd('execute as IE_TestB at @s run function escape_island:training/choose_captain')
        test.cmd('effect clear IE_TestB minecraft:instant_health')
        test.cmd('damage IE_TestB 12 minecraft:generic')
        test.cmd('execute store result score $health_before ie.accept run data get entity IE_TestB Health 1')
        before = test.score('$health_before', 'ie.accept')
        test.use_hotbar('IE_TestA', 6)
        test.cmd('execute store result score $health_after ie.accept run data get entity IE_TestB Health 1')
        test.check('chef heals nearby injured teammate', before <= 8 and test.score('$health_after', 'ie.accept') > before)
        test.cmd('execute as IE_TestA at @s run function escape_island:training/choose_chef')
        test.cmd('effect clear IE_TestA minecraft:instant_health')
        test.cmd('damage IE_TestA 12 minecraft:generic')
        test.cmd('execute store result score $health_before ie.accept run data get entity IE_TestA Health 1')
        before = test.score('$health_before', 'ie.accept')
        test.use_hotbar('IE_TestA', 6)
        test.cmd('execute store result score $health_after ie.accept run data get entity IE_TestA Health 1')
        test.check('chef heals self when no teammate needs help', before <= 8 and test.score('$health_after', 'ie.accept') > before)
    finally:
        test.close('healing-results.json')


if __name__ == '__main__':
    main()
