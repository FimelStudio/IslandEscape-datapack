"""Exercise signal repair contribution and caps on an isolated Minecraft server."""
import argparse

from minecraft_acceptance import Acceptance, NAMES


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--sandbox', required=True)
    test = Acceptance(parser.parse_args().sandbox)
    try:
        test.cmd('tick freeze')
        test.reload()
        test.check('four test clients connected', all(name in test.cmd('list') for name in NAMES))
        test.prepare()
        test.cmd('tp @a 0 251 40')
        for name in NAMES[:2]:
            test.cmd(f'execute as {name} run function escape_island:role/_tag_engineer')
            test.cmd(f'clear {name}')
            test.client_request('/action', {'name': name, 'action': 'slot', 'slot': 0})
        test.sprint(2)
        test.cmd('tp IE_TestA -24.0 251.0 0.0')
        test.cmd('item replace entity IE_TestA hotbar.0 with minecraft:string[custom_data={item:"cable"}]')

        def repair():
            test.cmd('function escape_island:task/signal_tower_tick')
            return test.score('$signal_delta', 'signal_progress')

        value = repair()
        test.check('engineer with cable receives personal bonus', value == 62, str(value))
        test.cmd('tp IE_TestB -24.0 251.0 0.0')
        value = repair()
        test.check('engineer without cable contributes no bonus', value == 62, str(value))
        test.cmd('tp IE_TestA -19.0 251.0 0.0')
        test.cmd('execute as IE_TestA at @s run function skill:engineer/battery/start')
        test.cmd('tp IE_TestA -24.0 251.0 0.0')
        value = repair()
        test.check('battery outside four blocks does not contribute', value == 62, str(value))
        test.cmd('kill @e[type=minecraft:marker,tag=entity.engineer_battery]')
        test.cmd('execute as IE_TestA at @s run function skill:engineer/battery/start')
        value = repair()
        test.check('nearby battery stacks with engineer bonus', value == 75, str(value))
        test.cmd('item replace entity IE_TestB hotbar.0 with minecraft:string[custom_data={item:"cable"}]')
        value = repair()
        test.check('multiple bonuses obey team cap', value == 75, str(value))
        test.cmd('tag IE_TestB remove ie.active')
        value = repair()
        test.cmd('execute positioned -24 251 0 as @e[type=minecraft:marker,tag=marker.signal_tower,sort=nearest,limit=1] run scoreboard players operation $repairers ie.accept = @s signal_players')
        test.check('inactive players cannot repair', value == 75 and test.score('$repairers', 'ie.accept') == 1)
        test.cmd('kill @e[type=minecraft:marker,tag=entity.engineer_battery]')
        test.cmd('execute as IE_TestD run function escape_island:player/reset')
        test.cmd('tag IE_TestD add infected.common')
        test.cmd('tag IE_TestD add state.infected_period')
        test.cmd('tp IE_TestD -24.0 251.0 0.0')
        value = repair()
        test.check('inactive infected cannot suppress or slow repair', value == 62, str(value))
        test.cmd('summon minecraft:marker -22 251 0 {Tags:["ie.accept_fixture","marker.signal_tower"]}')
        test.cmd('tp IE_TestA -23.0 251.0 0.0')
        repair()
        test.cmd('execute positioned -24 251 0 as @e[type=minecraft:marker,tag=marker.signal_tower,sort=nearest,limit=1] run scoreboard players operation $first ie.accept = @s signal_engineers')
        test.cmd('execute positioned -22 251 0 as @e[type=minecraft:marker,tag=marker.signal_tower,sort=nearest,limit=1] run scoreboard players operation $second ie.accept = @s signal_engineers')
        test.check('overlapping towers count engineer once', test.score('$first', 'ie.accept') + test.score('$second', 'ie.accept') == 1)
    finally:
        test.close('signal-results.json')


if __name__ == '__main__':
    main()
