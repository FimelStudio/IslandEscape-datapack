"""Exercise a local Minecraft server in an explicitly provisioned test sandbox.

The server must contain the ie_acceptance_probe pack and four IE_Test* clients.
This script modifies the sandbox world and must never be pointed at a real save.
"""
import argparse
import json
import re
import time
import urllib.request
from pathlib import Path

from minecraft_rcon import Rcon

NAMES = [f'IE_Test{letter}' for letter in 'ABCD']


class Acceptance:
    def __init__(self, sandbox):
        self.root = Path(sandbox).resolve()
        if not (self.root / 'world/datapacks/ie_acceptance_probe/pack.mcmeta').is_file():
            raise RuntimeError('Missing isolated acceptance probe; refusing to run')
        self.rcon = Rcon(self.root)
        self.results = []

    def cmd(self, value):
        return self.rcon.command(value)

    def score(self, name, objective):
        response = self.cmd(f'scoreboard players get {name} {objective}')
        match = re.search(r'has (-?\d+) \[', response)
        if not match:
            raise AssertionError(f'Cannot read {name} {objective}: {response}')
        return int(match.group(1))

    def count(self, selector):
        self.cmd(f'execute store result score $assert ie.accept if entity {selector}')
        return self.score('$assert', 'ie.accept')

    def sprint(self, ticks):
        self.cmd(f'tick sprint {ticks}t')
        deadline = time.monotonic() + 180
        while time.monotonic() < deadline:
            if 'sprinting' not in self.cmd('tick query'):
                return
            time.sleep(.1)
        raise TimeoutError(f'Tick sprint did not finish: {ticks}')

    def reload(self):
        previous = self.score('$load', 'ie.accept')
        self.cmd('reload')
        self.cmd('tick unfreeze')
        deadline = time.monotonic() + 30
        while time.monotonic() < deadline:
            if self.score('$load', 'ie.accept') > previous:
                self.cmd('tick freeze')
                return
            time.sleep(.1)
        raise TimeoutError('Reload did not finish and run the probe load hook')

    def check(self, name, condition, detail=''):
        self.results.append({'test': name, 'passed': bool(condition), 'detail': detail})
        print(('PASS' if condition else 'FAIL') + ' ' + name + (' — ' + detail if detail else ''), flush=True)
        if not condition:
            raise AssertionError(name + ': ' + detail)

    def prepare(self):
        self.cmd('function escape_island:game/cleanup')
        self.cmd('function ie_accept:setup')
        self.cmd('function escape_island:game/start')
        if self.score('$game', 'in_game') != 1:
            raise AssertionError('Fixture match did not start')

    def client_request(self, path, data=None):
        payload = None if data is None else json.dumps(data).encode()
        request = urllib.request.Request('http://127.0.0.1:25578' + path, data=payload, headers={'Content-Type': 'application/json'})
        with urllib.request.urlopen(request, timeout=10) as response:
            body = response.read().decode()
        return json.loads(body) if path.startswith('/entities') else body

    def connection(self, name, connected):
        self.client_request('/action', {'name': name, 'action': 'connect' if connected else 'disconnect'})
        deadline = time.monotonic() + 20
        while time.monotonic() < deadline:
            present = name in self.cmd('list')
            if present == connected:
                return
            time.sleep(.1)
        raise TimeoutError(f'Client {name} did not {"connect" if connected else "disconnect"}')

    def use_hotbar(self, name, slot):
        self.client_request('/action', {'name': name, 'action': 'slot', 'slot': slot})
        self.sprint(2)
        time.sleep(.3)
        self.client_request('/action', {'name': name, 'action': 'use'})
        time.sleep(.3)
        self.sprint(4)
        self.client_request('/action', {'name': name, 'action': 'release'})

    def run(self):
        self.cmd('tick freeze')
        self.check('four network clients', all(name in self.cmd('list') for name in NAMES))
        self.cmd('function escape_island:game/cleanup')
        self.cmd('kill @e[type=minecraft:marker,tag=ie.accept_fixture]')
        self.cmd('function escape_island:game/start')
        self.check('incomplete map rejected', self.score('$game', 'in_game') == 0 and self.score('$game', 'ie.map_ready') == 0)
        self.cmd('function ie_accept:setup')
        self.cmd('execute as IE_TestA at @s run function escape_island:test/regression_lifecycle')
        self.check('lifecycle regression', self.score('$regression', 'ie.test_fail') == 0)
        self.cmd('scoreboard players set IE_TestD skill.pistol_reload 33')
        self.cmd('tag IE_TestD add skill.adrenaline.active')
        self.cmd('scoreboard players set IE_TestD skill.slide_cost 41')
        self.cmd('tag IE_TestD add skill.slide.active')
        self.reload()
        self.check('idle reload preserves unrelated player state', self.score('IE_TestD', 'skill.pistol_reload') == 33 and self.score('IE_TestD', 'skill.slide_cost') == 41 and self.count('@a[name=IE_TestD,tag=skill.adrenaline.active,tag=skill.slide.active]') == 1)
        self.cmd('execute as IE_TestD run function escape_island:player/reset')
        self.cmd('gamerule immediate_respawn false')
        self.cmd('execute as IE_TestA at @s run function escape_island:training/start')
        self.cmd('execute as IE_TestB at @s run function escape_island:training/start')
        self.cmd('scoreboard players set IE_TestA skill.pistol_fire_cd 8')
        self.cmd('function escape_island:player/tick_skills')
        self.check('training keeps skill updates active', self.count('@a[name=IE_TestA,tag=state.training,tag=ie.active]') == 1 and self.score('IE_TestA', 'skill.pistol_fire_cd') == 7)
        roles = [
            ('doctor', 1, 'tipped_arrow', 'doctor_antidote'),
            ('captain', 2, 'sugar', 'captain_whistle'),
            ('engineer', 3, 'redstone_torch', 'engineer_battery'),
            ('marine', 4, 'crossbow', 'marine_suppress'),
            ('chef', 5, 'mushroom_stew', 'cook_soup'),
            ('radio', 6, 'compass', 'radio_signal_scan'),
            ('virologist', 7, 'potion', 'viro_detector'),
            ('mechanic', 8, 'tripwire_hook', 'mechanic_trap'),
            ('athlete', 9, 'sugar', 'athlete_adrenaline'),
            ('priest', 10, 'nautilus_shell', 'priest_cross'),
        ]
        previous_role = None
        for role_name, role_id, item, skill in roles:
            self.cmd(f'execute as IE_TestA at @s run function escape_island:training/choose_{role_name}')
            self.cmd('function escape_island:player/tick_skills')
            self.cmd(f'execute store success score $role_item ie.accept if items entity IE_TestA container.* minecraft:{item}[minecraft:custom_data~{{skill:"{skill}"}}]')
            prior_removed = previous_role is None or self.count(f'@a[name=IE_TestA,tag=role.{previous_role}]') == 0
            valid = self.count(f'@a[name=IE_TestA,tag=ie.active,tag=role.{role_name}]') == 1 and self.score('IE_TestA', 'role') == role_id and self.score('$role_item', 'ie.accept') == 1 and prior_removed
            self.check('training role and item: ' + role_name, valid)
            if previous_role == 'engineer':
                self.check('engineer battery removed on role change', self.count('@e[type=minecraft:marker,tag=entity.engineer_battery]') == 0)
            if previous_role == 'mechanic':
                self.check('mechanic trap removed on role change', self.count('@e[type=minecraft:marker,tag=entity.mechanic_trap]') == 0)
            if role_name == 'doctor':
                self.cmd('execute as IE_TestA run function escape_island:infection/force_infect')
                self.use_hotbar('IE_TestA', 6)
                self.check('doctor antidote cures infection', self.count('@a[name=IE_TestA,tag=!state.infected_period,tag=state.infection_resist]') == 1 and self.score('IE_TestA', 'skill.antidote_charges') == 0)
            elif role_name == 'priest':
                self.cmd('execute as IE_TestA run function escape_island:infection/force_infect')
                self.check('priest cross intercepts infection', self.count('@a[name=IE_TestA,tag=!state.infected_period,tag=!flag.cross_intact]') == 1)
            else:
                self.use_hotbar('IE_TestA', 5 if role_name == 'athlete' else 6)
                cooldowns = {'captain':'skill.whistle_cd', 'marine':'skill.suppress_cd', 'chef':'skill.soup_cd', 'radio':'skill.signal_scan_cd', 'virologist':'skill.detector_cd', 'athlete':'skill.adren_cd'}
                if role_name in cooldowns:
                    self.check(role_name + ' ability activates', self.score('IE_TestA', cooldowns[role_name]) > 0)
                elif role_name == 'engineer':
                    self.check('engineer ability creates owned battery', self.count('@e[type=minecraft:marker,tag=entity.engineer_battery,tag=ie.owned]') == 1)
                elif role_name == 'mechanic':
                    self.check('mechanic ability creates owned trap', self.count('@e[type=minecraft:marker,tag=entity.mechanic_trap,tag=ie.owned]') == 1 and self.score('IE_TestA', 'skill.trap_charges') == 2)
            previous_role = role_name
        self.cmd('execute as IE_TestA at @s run function escape_island:training/reset')
        shared = self.cmd('gamerule immediate_respawn').strip().endswith('true')
        self.cmd('execute as IE_TestB at @s run function escape_island:training/reset')
        restored = self.cmd('gamerule immediate_respawn').strip().endswith('false')
        self.check('training shares and restores world rule', shared and restored)
        self.cmd('execute as IE_TestA at @s run function escape_island:training/start')
        self.prepare()
        original = self.score('$game', 'ie.prev_respawn')
        self.cmd('function escape_island:game/cleanup')
        restored = self.cmd('gamerule immediate_respawn').strip().endswith('false')
        self.check('training to match preserves original world rule', original == 0 and restored)
        self.cmd('execute as IE_TestA at @s run function escape_island:range/enter')
        self.cmd('scoreboard players set IE_TestA skill.pistol_fire_cd 8')
        self.cmd('function escape_island:player/tick_skills')
        self.check('shooting range keeps weapon updates active', self.count('@a[name=IE_TestA,tag=range.active,tag=ie.active]') == 1 and self.score('IE_TestA', 'skill.pistol_fire_cd') == 7)
        self.cmd('execute as IE_TestA at @s run function escape_island:range/exit')
        self.cmd('tag IE_TestA add gs.ready')
        self.cmd('tag IE_TestB add gs.ready')
        self.cmd('execute as IE_TestA at @s run function escape_island:gunfight/start')
        self.cmd('scoreboard players set IE_TestA skill.pistol_fire_cd 8')
        self.cmd('function escape_island:player/tick_skills')
        self.check('gunfight keeps weapon updates active', self.count('@a[name=IE_TestA,tag=gs.player,tag=ie.active]') == 1 and self.score('IE_TestA', 'skill.pistol_fire_cd') == 7)
        self.cmd('function escape_island:game/cleanup')
        self.prepare()
        self.check('fixture match starts', self.count('@a[tag=ie.participant]') == 4)
        self.reload()
        self.check('active match reload cleans up and restores rules', self.score('$game', 'in_game') == 0 and self.count('@a[tag=ie.participant]') == 0 and self.cmd('gamerule immediate_respawn').strip().endswith('false'))
        self.prepare()
        match_id = self.score('$game', 'ie.match_id')
        roles = [self.score(name, 'role') for name in NAMES]
        self.check('unique starting roles', len(set(roles)) == 4, str(roles))
        self.cmd('function escape_island:game/start')
        self.check('duplicate start ignored', self.score('$game', 'ie.match_id') == match_id and self.score('$game', 'cur_phase') == 1)

        # Simulate a late-joining observer without changing the other participants.
        self.cmd('execute as IE_TestD run function escape_island:player/reset')
        self.cmd('give IE_TestD minecraft:nautilus_shell[custom_data={skill:"priest_cross"}] 1')
        self.cmd('scoreboard players set IE_TestD skill.pistol_reload 33')
        self.cmd('scoreboard players set IE_TestA skill.pistol_fire_cd 8')
        self.cmd('function escape_island:player/tick_skills')
        self.cmd('execute store success score $observer_item ie.accept if items entity IE_TestD container.* minecraft:nautilus_shell[minecraft:custom_data~{skill:"priest_cross"}]')
        self.check('skill updates leave observer inventory and scores alone', self.score('IE_TestD', 'skill.pistol_reload') == 33 and self.score('$observer_item', 'ie.accept') == 1)
        self.check('active player weapon cooldown still advances', self.score('IE_TestA', 'skill.pistol_fire_cd') == 7)
        self.cmd('give IE_TestA minecraft:nautilus_shell[custom_data={skill:"priest_cross"}] 1')
        self.sprint(21)
        self.cmd('execute store success score $wrong_role_item ie.accept if items entity IE_TestA container.* minecraft:nautilus_shell[minecraft:custom_data~{skill:"priest_cross"}]')
        self.cmd('execute store success score $observer_item ie.accept if items entity IE_TestD container.* minecraft:nautilus_shell[minecraft:custom_data~{skill:"priest_cross"}]')
        self.check('periodic cleanup removes wrong-role items without touching observers', self.score('$wrong_role_item', 'ie.accept') == 0 and self.score('$observer_item', 'ie.accept') == 1)
        self.cmd('tag IE_TestD add state.infected_period')
        self.cmd('scoreboard players set IE_TestD infect_time 2')
        self.cmd('function escape_island:player/tick_second')
        self.check('infection tick ignores inactive observer', self.score('IE_TestD', 'infect_time') == 2)
        self.cmd('scoreboard players set IE_TestD talent_exhaustion 9')
        self.cmd('scoreboard players set IE_TestA talent_exhaustion 9')
        self.cmd('scoreboard players set IE_TestD signal_repair_seen 9')
        self.cmd('scoreboard players set IE_TestA signal_repair_seen 9')
        self.cmd('function escape_island:talent/tick')
        self.cmd('function escape_island:tick')
        self.check('talent and task timers isolate observers', self.score('IE_TestD', 'talent_exhaustion') == 9 and self.score('IE_TestD', 'signal_repair_seen') == 9 and self.score('IE_TestA', 'talent_exhaustion') == 8 and self.score('IE_TestA', 'signal_repair_seen') == 8)
        self.cmd('effect clear IE_TestD')
        self.cmd('effect clear IE_TestA')
        self.cmd('effect give IE_TestA minecraft:darkness 999 0 true')
        self.cmd('function escape_island:event/blackout')
        observer_effects = self.cmd('data get entity IE_TestD active_effects')
        self.cmd('function escape_island:event/_blackout_end')
        participant_effects = self.cmd('data get entity IE_TestA active_effects')
        self.check('blackout respects observers and unrelated darkness', 'minecraft:darkness' not in observer_effects and 'minecraft:darkness' in participant_effects and self.score('$blackout', 'ie.event') == 0)
        self.cmd('effect clear IE_TestA minecraft:darkness')
        self.cmd('function escape_island:event/storm')
        self.connection('IE_TestA', False)
        self.cmd('function escape_island:event/_storm_end')
        self.connection('IE_TestA', True)
        self.sprint(2)
        self.check('storm end applies across reconnect', self.score('$storm', 'ie.event') == 0 and self.count('@a[name=IE_TestA,tag=event.storm]') == 0)
        self.cmd('clear IE_TestA')
        self.cmd('execute as IE_TestA run function skill:weapon/pistol/give')
        self.client_request('/action', {'name': 'IE_TestA', 'action': 'slot', 'slot': 0})
        self.sprint(2)
        time.sleep(.3)
        self.client_request('/action', {'name': 'IE_TestA', 'action': 'use'})
        time.sleep(.3)
        self.sprint(4)
        self.check('active client can fire pistol', self.score('IE_TestA', 'skill.pistol_mag') == 7)
        self.client_request('/action', {'name': 'IE_TestA', 'action': 'release'})
        self.cmd('give IE_TestA minecraft:iron_nugget[custom_data={ammo:1}] 8')
        self.cmd('execute as IE_TestA run function skill:weapon/pistol/reload_start')
        self.sprint(41)
        self.check('pistol reload completes', self.score('IE_TestA', 'skill.pistol_mag') == 8 and self.count('@a[name=IE_TestA,tag=skill.pistol.reloading]') == 0)
        self.cmd('clear IE_TestA')
        self.cmd('execute as IE_TestA run function skill:weapon/ak47/give')
        self.client_request('/action', {'name': 'IE_TestA', 'action': 'slot', 'slot': 0})
        self.sprint(2)
        time.sleep(.3)
        self.client_request('/action', {'name': 'IE_TestA', 'action': 'use'})
        time.sleep(.3)
        self.sprint(4)
        self.check('active client can fire AK47', self.score('IE_TestA', 'skill.ak47_mag') == 29)
        self.client_request('/action', {'name': 'IE_TestA', 'action': 'release'})
        self.cmd('give IE_TestA minecraft:iron_nugget[custom_data={ammo:"7.62"}] 30')
        self.cmd('execute as IE_TestA run function skill:weapon/ak47/reload_start')
        self.sprint(41)
        self.check('AK47 reload completes', self.score('IE_TestA', 'skill.ak47_mag') == 30 and self.count('@a[name=IE_TestA,tag=skill.ak47.reloading]') == 0)
        self.cmd('clear IE_TestA')
        self.cmd('execute as IE_TestA run function skill:weapon/shotgun/give')
        for remaining in range(5, -1, -1):
            self.use_hotbar('IE_TestA', 0)
            self.check('shotgun fires with expected magazine ' + str(remaining), self.score('IE_TestA', 'skill.shotgun_mag') == remaining)
            self.sprint(16)
        self.use_hotbar('IE_TestA', 0)
        self.check('empty shotgun cannot reload without ammunition', self.score('IE_TestA', 'skill.shotgun_mag') == 0 and self.count('@a[name=IE_TestA,tag=skill.shotgun.reloading]') == 0)
        self.cmd('give IE_TestA minecraft:iron_nugget[custom_data={ammo:1}] 2')
        self.use_hotbar('IE_TestA', 0)
        self.sprint(41)
        self.cmd('execute store result score $shotgun_ammo_left ie.accept run clear IE_TestA minecraft:iron_nugget[minecraft:custom_data~{ammo:1}] 0')
        self.check('shotgun reload consumes only available ammunition', self.score('IE_TestA', 'skill.shotgun_mag') == 2 and self.score('$shotgun_ammo_left', 'ie.accept') == 0 and self.count('@a[name=IE_TestA,tag=skill.shotgun.reloading]') == 0)
        self.cmd('clear IE_TestA')
        self.cmd('execute as IE_TestA run function skill:weapon/sniper/give')
        self.client_request('/action', {'name': 'IE_TestA', 'action': 'sneak', 'value': True})
        self.use_hotbar('IE_TestA', 0)
        self.client_request('/action', {'name': 'IE_TestA', 'action': 'sneak', 'value': False})
        self.check('active client can fire sniper', self.score('IE_TestA', 'skill.sniper_mag') == 4)
        self.cmd('scoreboard players set IE_TestA skill.sniper_mag 1')
        self.cmd('give IE_TestA minecraft:arrow[custom_data={ammo:"sniper_round"}] 1')
        self.cmd('execute as IE_TestA run function skill:weapon/sniper/reload_start')
        self.sprint(71)
        self.cmd('execute store result score $ammo_left ie.accept run clear IE_TestA minecraft:arrow[minecraft:custom_data~{ammo:"sniper_round"}] 0')
        self.check('sniper reload consumes only available ammo', self.score('IE_TestA', 'skill.sniper_mag') == 2 and self.score('$ammo_left', 'ie.accept') == 0)
        self.cmd('clear IE_TestA')
        self.cmd('scoreboard players set IE_TestA skill.sniper_cd 4')
        self.cmd('scoreboard players set IE_TestA skill.sniper_bolt 2')
        self.cmd('tag IE_TestA add sniper.bolting')
        self.cmd('tag IE_TestA add sniper.zooming')
        self.cmd('function escape_island:player/tick_skills')
        self.cmd('function escape_island:player/tick_skills')
        self.check('sniper timers and zoom clean up after switching weapons', self.score('IE_TestA', 'skill.sniper_cd') == 2 and self.score('IE_TestA', 'skill.sniper_bolt') == 0 and self.count('@a[name=IE_TestA,tag=sniper.bolting]') == 0 and self.count('@a[name=IE_TestA,tag=sniper.zooming]') == 0)
        self.cmd('tag IE_TestD add sniper.bolting')
        self.cmd('tag IE_TestD add sniper.zooming')
        self.cmd('execute as IE_TestD run function escape_island:player/reset')
        self.check('sniper temporary tags are removed by player reset', self.count('@a[name=IE_TestD,tag=sniper.bolting]') == 0 and self.count('@a[name=IE_TestD,tag=sniper.zooming]') == 0)
        self.cmd('execute as IE_TestA run function escape_island:role/_tag_mechanic')
        self.cmd('execute as IE_TestA at @s run function escape_island:infection/turn')
        self.check('infection retains former role without leaving live role', self.count('@a[name=IE_TestA,tag=retained.mechanic,tag=!role.mechanic,tag=infected.common]') == 1 and self.score('IE_TestA', 'role') == 12)
        self.prepare()
        match_id = self.score('$game', 'ie.match_id')

        role = self.score(NAMES[0], 'role')
        self.connection(NAMES[0], False)
        self.connection(NAMES[0], True)
        self.sprint(2)
        self.check('reconnect retains current match identity', self.count(f'@a[name={NAMES[0]},tag=ie.participant,tag=ie.active]') == 1 and self.score(NAMES[0], 'ie.session') == match_id and self.score(NAMES[0], 'role') == role)
        self.connection(NAMES[0], False)
        self.cmd('function escape_island:game/cleanup')
        self.connection(NAMES[0], True)
        self.sprint(2)
        self.check('reconnect after match clears stale state', self.count(f'@a[name={NAMES[0]},tag=ie.active]') == 0 and self.count(f'@a[name={NAMES[0]},tag=ie.participant]') == 0 and self.score(NAMES[0], 'role') == 0)
        self.prepare()
        self.cmd('execute as IE_TestD at @s run function escape_island:player/reset')
        self.cmd('scoreboard players set IE_TestD mvp_score 777')
        self.cmd('function escape_island:game/end_purge')
        self.check('settlement preserves nonparticipant score', self.score('IE_TestD', 'mvp_score') == 777)
        self.prepare()

        self.cmd('tp @a 0 251 40')
        self.cmd('scoreboard players set @e[type=minecraft:marker,tag=marker.signal_tower,tag=!marker.signal_core] signal_players 1')
        vals = []
        for powered in (0, 1):
            self.cmd(f'scoreboard players set $game power_buff {powered}')
            self.cmd('execute positioned -24 251 0 as @e[type=minecraft:marker,tag=marker.signal_tower,tag=!marker.signal_core,sort=nearest,limit=1] at @s run function escape_island:task/signal_tower_repair_tick')
            vals.append(self.score('$signal_delta', 'signal_progress'))
        self.check('generator repair multiplier', vals == [50, 60], str(vals))
        self.cmd('scoreboard players set $game power_buff 0')

        for name in NAMES[:2]:
            self.cmd(f'execute as {name} run function escape_island:infection/force_infect')
            self.cmd(f'execute as {name} run function escape_island:infection/cure')
            if name == NAMES[0]: self.sprint(200)
        self.sprint(200)
        a, b = (self.score(name, 'ie.resist_left') for name in NAMES[:2])
        self.check('independent infection resistance timers', a == 0 and 190 <= b <= 200, f'{a}, {b}')

        self.sprint(2001)
        self.check('phase 2 and one mother', self.score('$game', 'cur_phase') == 2 and self.count('@a[tag=infected.mother]') == 1)
        mother = next(n for n in NAMES if self.count(f'@a[name={n},tag=infected.mother]'))
        human = next(n for n in NAMES if n != mother)
        self.cmd(f'damage {human} 10000 minecraft:generic_kill')
        self.sprint(40)
        self.check('real player death enters sporification', self.count(f'@a[name={human},tag=state.sporifying]') == 1, human)
        self.sprint(320)
        self.check('real player respawns and turns infected', self.count(f'@a[name={human},tag=infected.common]') == 1 and human in self.cmd('list'), human)
        self.cmd(f'effect clear {mother} minecraft:resistance')
        self.cmd(f'damage {mother} 10000 minecraft:generic_kill')
        self.sprint(40)
        self.check('mother death waits for living infected', self.score('$game', 'mother_dead') == 1 and self.score('$game', 'in_game') == 1)
        self.cmd(f'effect clear {human} minecraft:resistance')
        self.cmd(f'damage {human} 10000 minecraft:generic_kill')
        self.sprint(40)
        self.check('purge settles after last infected dies', self.score('$game', 'in_game') == 0 and self.score('$game', 'escape_result') == 4)

        self.prepare()
        self.cmd('function escape_island:game/end_all_infected')
        self.check('result enters delayed settlement', self.score('$game', 'ie.mode') == 4 and self.score('$game', 'ie.finish_left') == 60)
        old_settlements = self.score('$game', 'ie.settle_count')
        self.cmd('function escape_island:game/start')
        self.cmd('function escape_island:game/end_all_infected_finish')
        self.sprint(80)
        self.check('old settlement cannot end new match', self.score('$game', 'in_game') == 1 and self.score('$game', 'ie.settle_count') == old_settlements)

        self.cmd('function escape_island:game/cleanup')
        self.cmd('kill @e[tag=aj.helicopter.root]')
        self.cmd('execute positioned 0 251 0 run function animated_java:helicopter/summon {args:{animation:"animation_airscrew_circle",start_animation:true}}')
        self.sprint(1)
        initial = self.score('@e[tag=aj.helicopter.root,limit=1]', 'aj.animation_airscrew_circle.frame')
        self.sprint(3)
        after = self.score('@e[tag=aj.helicopter.root,limit=1]', 'aj.animation_airscrew_circle.frame')
        self.check('helicopter animation advances', initial != after, f'{initial} -> {after}')
        self.cmd('kill @e[tag=aj.helicopter.entity]')

        self.prepare()
        self.sprint(3601)
        self.check('phase 3 reached naturally', self.score('$game', 'cur_phase') == 3)
        mother = next(n for n in NAMES if self.count(f'@a[name={n},tag=infected.mother]'))
        humans = [n for n in NAMES if n != mother]
        self.cmd(f'tp {mother} 0 251 40')
        for name, x in zip(humans, [-24, -12, 12]):
            self.cmd(f'clear {name}')
            self.cmd(f'execute as {name} run function escape_island:task/give_cable')
            self.client_request('/action', {'name': name, 'action': 'slot', 'slot': 0})
            self.cmd(f'tp {name} {x} 251 0')
        self.sprint(4100)
        progress = self.score('$game', 'signal_progress')
        completed = self.count('@e[type=minecraft:marker,tag=marker.signal_tower,tag=marker.signal_done]')
        self.check('three towers repaired through normal ticks', progress == 75 and completed == 3, f'progress={progress}, towers={completed}')
        self.cmd(f'clear {humans[0]}')
        self.cmd(f'execute as {humans[0]} run function escape_island:task/give_cable')
        self.cmd(f'tp {humans[0]} 24 251 0')
        self.sprint(4100)
        self.check('fourth tower calls helicopter', self.score('$game', 'signal_done') == 1 and self.score('$game', 'cur_phase') == 4)
        self.sprint(1820)
        countdown = self.score('$game', 'heli_countdown')
        self.check('helicopter lands', countdown < 0 and self.count('@e[type=minecraft:interaction,tag=entity.helicopter_boarding]') == 1, f'countdown={countdown}')
        pos = self.cmd('data get entity @e[type=minecraft:interaction,tag=entity.helicopter_boarding,limit=1] Pos')
        values = re.findall(r'(-?\d+(?:\.\d+)?)d', pos)
        if len(values) != 3: raise AssertionError('Cannot read boarding position: ' + pos)
        x, y, z = map(float, values)
        self.cmd(f'tp {humans[0]} {x} {y} {z}')
        self.sprint(2)
        time.sleep(.5)
        entities = self.client_request('/entities?name=' + humans[0])
        nearby = sorted(entities, key=lambda e: sum((e['position'][k]-v)**2 for k,v in zip(('x','y','z'),(x,y,z))))
        if not nearby: raise AssertionError('Client did not receive helicopter interaction entity')
        self.client_request('/action', {'name': humans[0], 'action': 'interact', 'entity': nearby[0]['id']})
        self.sprint(2)
        self.check('client right click boards helicopter', self.count(f'@a[name={humans[0]},tag=state.boarding.heli]') == 1)
        self.sprint(1300)
        escaped = self.score('$game', 'escaped_count')
        result = self.score('$game', 'escape_result')
        self.check('boarded player escapes and match settles', self.score('$game', 'in_game') == 0 and self.score('$game', 'ie.settle_count') == old_settlements + 1 and escaped >= 1 and result in (1, 2), f'escaped={escaped}, result={result}')

    def close(self, filename='engine-results.json'):
        (self.root / filename).write_text(json.dumps(self.results, ensure_ascii=False, indent=2), encoding='utf-8')
        self.rcon.close()


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--sandbox', required=True)
    args = parser.parse_args()
    test = Acceptance(args.sandbox)
    try:
        test.run()
    finally:
        test.close()
