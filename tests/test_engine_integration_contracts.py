"""Guard the engine integration points exercised by minecraft_acceptance.py."""
import json
import re
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


class EngineIntegrationContracts(unittest.TestCase):
    def test_animated_java_initializes_and_ticks_without_recursive_export_entry(self):
        loads = json.loads((ROOT / 'data/minecraft/tags/function/load.json').read_text(encoding='utf-8'))['values']
        ticks = json.loads((ROOT / 'data/minecraft/tags/function/tick.json').read_text(encoding='utf-8'))['values']
        self.assertIn('escape_island:compat/animated_java_load', loads)
        self.assertNotIn('animated_java:global/on_load', loads)
        self.assertIn('animated_java:global/on_tick', ticks)
        compat = (ROOT / 'data/escape_island/function/compat/animated_java_load.mcfunction').read_text(encoding='utf-8')
        self.assertIn('function animated_java:helicopter/on_load', compat)
        self.assertNotIn('function animated_java:global/on_load', compat)

    def test_power_multiplier_uses_percent_scale(self):
        source = (ROOT / 'data/escape_island/function/task/signal_tower_repair_tick.mcfunction').read_text(encoding='utf-8')
        self.assertIn('run scoreboard players operation $signal_delta signal_progress /= $const_100 signal_progress', source)

    def test_formal_start_checks_map_before_initializing(self):
        source = (ROOT / 'data/escape_island/function/game/start.mcfunction').read_text(encoding='utf-8')
        self.assertLess(source.index('function escape_island:game/validate_map'), source.index('function escape_island:game/initialize'))
        self.assertIn('execute unless score $game ie.map_ready matches 1 run return 0', source)

    def test_periodic_player_mutations_only_target_active_contexts(self):
        skill_files = [p for p in (ROOT / 'data/skill/function').rglob('*.mcfunction') if 'tick' in p.stem]
        infection = ROOT / 'data/escape_island/function/infection'
        files = skill_files + [infection / (name + '.mcfunction') for name in ('tick_infected_state', 'spore_load_decay', 'respawn_tick', 'death_check')] + [ROOT / 'data/escape_island/function/talent/tick.mcfunction']
        actor = re.compile(r'(?:\bas |^\$?tag |^\$?scoreboard players (?:add|remove|set|operation|reset) )(@a(?:\[[^]]*\])?)')
        failures = []
        for path in files:
            for number, line in enumerate(path.read_text(encoding='utf-8').splitlines(), 1):
                if line.lstrip().startswith('#'):
                    continue
                for match in actor.finditer(line):
                    if not re.search(r'\btag=ie\.active(?:,|\])', match.group(1)):
                        failures.append(f'{path.relative_to(ROOT)}:{number}')
        self.assertEqual(failures, [], 'Periodic player mutations must respect the active context')

    def test_automatic_weapon_macro_expands_to_existing_functions(self):
        base = ROOT / 'data/skill/function/weapon'
        template = (base / 'common/tick_automatic.mcfunction').read_text(encoding='utf-8')
        for weapon, other in (('pistol', 'ak47'), ('ak47', 'pistol')):
            wrapper = (base / weapon / 'tick.mcfunction').read_text(encoding='utf-8')
            self.assertIn(f'{{weapon:"{weapon}",other:"{other}"}}', wrapper)
            expanded = template.replace('$(weapon)', weapon).replace('$(other)', other)
            self.assertNotIn('$(', expanded)
            for reference in re.findall(r'\bfunction (skill:[a-z0-9_./-]+)', expanded):
                path = ROOT / 'data/skill/function' / (reference.removeprefix('skill:') + '.mcfunction')
                self.assertTrue(path.is_file(), reference)

    def test_skill_registration_does_not_reset_online_players(self):
        forbidden = re.compile(r'^\s*(?:advancement revoke|tag|scoreboard players (?:set|add|remove|operation|reset)|clear|effect clear|gamemode|attribute) @a(?:\[|\s)')
        failures = []
        base = ROOT / 'data/skill/function'
        pending, seen = ['init'], set()
        while pending:
            name = pending.pop()
            if name in seen:
                continue
            seen.add(name)
            path = base / (name + '.mcfunction')
            self.assertTrue(path.is_file(), name)
            for number, line in enumerate(path.read_text(encoding='utf-8').splitlines(), 1):
                if forbidden.search(line):
                    failures.append(f'{path.relative_to(ROOT)}:{number}')
                if re.match(r'^\s*(?:kill|tp) @e(?:\[|\s)', line):
                    failures.append(f'{path.relative_to(ROOT)}:{number}')
                pending.extend(re.findall(r'\bfunction skill:([a-z0-9_./-]+)', line))
        self.assertEqual(failures, [], 'Skill registration must not reset unrelated online players')

    def test_skill_player_tags_are_in_temporary_state_contract(self):
        contract = json.loads((ROOT / 'tools/state_contract.json').read_text(encoding='utf-8'))
        owned = {tag for group in contract['groups'].values() for tag in group['tags']}
        failures = []
        for path in (ROOT / 'data/skill/function').rglob('*.mcfunction'):
            for number, line in enumerate(path.read_text(encoding='utf-8').splitlines(), 1):
                if line.lstrip().startswith(('#', '$')):
                    continue
                for tag in re.findall(r'\btag @s add ([a-z0-9_.]+)', line):
                    # This function executes as the newly summoned marker, not a player.
                    if path.as_posix().endswith('/clicker/hearing_spore/launch_pending.mcfunction') and tag == 'entity.clicker_spore':
                        continue
                    if tag not in owned:
                        failures.append(f'{path.relative_to(ROOT)}:{number} ({tag})')
        self.assertEqual(failures, [], 'Player skill tags need an explicit cleanup owner')


if __name__ == '__main__':
    unittest.main()
