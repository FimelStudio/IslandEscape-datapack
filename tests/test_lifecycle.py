"""Behavioral regression over actual mcfunction state transitions, with world stand-ins."""
import unittest
from mcfunction_vm import Runtime, Player, Entity

class LifecycleTests(unittest.TestCase):
    def setUp(self):
        self.vm=Runtime();self.a,self.b=self.vm.players
        for p in self.vm.players:p.scores['used_firework']=0
    def runf(self,name,actor=None):self.vm.run('escape_island:'+name,actor)
    def score(self,obj,value):self.vm.scores['$game',obj]=value
    def value(self,obj):return self.vm.scores.get(('$game',obj))
    def active_match(self):
        self.score('in_game',1);self.score('ie.mode',1);self.score('ending_triggered',0)
        self.score('mother_dead',0);self.score('ie.evac_ready',0);self.score('ie.humans',2);self.score('ie.players',2)
        for p in self.vm.players:p.tags.update(['ie.active','ie.participant']);p.scores['ie.session']=1
    def test_infection_retains_exactly_the_previous_role(self):
        roles = ('doctor', 'captain', 'engineer', 'marine', 'chef', 'radio', 'virologist', 'mechanic', 'athlete', 'priest')
        for role in roles:
            with self.subTest(role=role):
                vm = Runtime()
                player = vm.players[0]
                player.tags.add('role.' + role)
                vm.run('escape_island:role/retain_on_infection', player)
                self.assertIn('retained.' + role, player.tags)
                self.assertFalse(any(tag.startswith('role.') for tag in player.tags))
                if role == 'radio':
                    self.assertEqual(player.scores['skill.forger_passive_cd'], 45)
                    self.assertEqual(player.scores['skill.forger_uses'], 0)
    def test_player_reset_restores_mother_attributes_and_preserves_progress(self):
        self.a.tags.update(['infected.mother','role.mechanic','state.hunting','ie.active'])
        self.a.attributes.update(armor=4,armor_toughness=2,knockback_resistance=.8,max_health=70)
        self.a.scores.update(career_xp=200,mastery_repair=9,match_repair=31,role=11)
        self.runf('player/reset',self.a)
        for attr in ('armor','armor_toughness','knockback_resistance'):self.assertEqual(self.a.attributes[attr],0)
        self.assertEqual(self.a.attributes['max_health'],20)
        self.assertFalse(self.a.tags & {'infected.mother','role.mechanic','state.hunting','ie.active'})
        self.assertEqual(self.a.scores['role'],0)
        self.assertEqual((self.a.scores['career_xp'],self.a.scores['mastery_repair'],self.a.scores['match_repair']),(200,9,31))
    def test_player_reset_clears_sniper_transient_tags(self):
        self.a.tags.update(['sniper.zooming', 'sniper.bolting'])
        self.a.scores.update({'skill.sniper_cd': 9, 'skill.sniper_bolt': 4})
        self.runf('player/reset', self.a)
        self.assertFalse(self.a.tags & {'sniper.zooming', 'sniper.bolting'})
        self.assertEqual(self.a.scores['skill.sniper_cd'], 0)
        self.assertEqual(self.a.scores['skill.sniper_bolt'], 0)
    def test_anchor_removal_preserves_other_players_anchor(self):
        self.a.scores['ie.actor'] = 11
        first = Entity('anchor_a', tags={'entity.downed_anchor'}, scores={'ie.owner': 11})
        second = Entity('anchor_b', tags={'entity.downed_anchor'}, scores={'ie.owner': 22})
        self.vm.entities.extend([first, second])
        self.vm.run('escape_island:infection/anchor/remove', self.a, {'kind': 'downed'})
        self.assertNotIn(first, self.vm.entities)
        self.assertIn(second, self.vm.entities)
    def test_cleanup_is_repeatable_and_cancels_old_callbacks(self):
        self.active_match();self.a.tags.add('state.infected_period')
        self.score('ie.rules_saved',1);self.score('ie.prev_regen',0);self.score('ie.prev_respawn',1)
        self.vm.scheduled={'escape_island:game/end_mutate','escape_island:game/end_all_infected_finish','escape_island:event/_storm_end'}
        self.runf('game/cleanup');self.runf('game/cleanup')
        self.assertEqual(self.value('in_game'),0);self.assertEqual(self.value('cur_phase'),0)
        self.assertFalse(self.vm.scheduled)
        self.assertFalse(self.vm.rules['natural_health_regeneration']);self.assertTrue(self.vm.rules['immediate_respawn'])
        self.assertTrue(all(not p.tags & {'ie.active','ie.participant','state.infected_period','state.training'} for p in self.vm.players))
        self.assertNotIn('escape_island:career/settle',self.vm.calls)
    def test_new_match_cannot_be_ended_by_old_result_finish(self):
        self.active_match();self.runf('game/end_all_infected')
        self.assertEqual(self.value('ie.finish_left'),60)
        self.runf('game/cleanup');self.active_match()
        for _ in range(80):self.runf('game/result/tick')
        self.runf('game/end_all_infected_finish')
        self.assertEqual(self.value('in_game'),1)
        self.assertNotIn('escape_island:career/settle',self.vm.calls)
    def test_result_locks_once_and_preserves_escape_snapshot(self):
        self.active_match();self.score('escaped_count',2);self.score('escape_result',2);self.score('escape_route',1)
        self.runf('game/end_helicopter');self.runf('game/end_helicopter');self.runf('game/settle')
        self.assertEqual(self.vm.calls.count('escape_island:career/settle'),1)
        self.assertEqual(self.value('escape_result'),2);self.assertEqual(self.value('escaped_count'),2)
        self.assertEqual(self.value('in_game'),0)
    def test_all_infected_animation_finishes_without_reopening_lock(self):
        self.active_match();self.runf('game/end_all_infected')
        for _ in range(60):self.runf('game/result/tick')
        self.assertEqual(self.value('in_game'),0);self.assertEqual(self.value('ending_triggered'),1)
        self.assertEqual(self.vm.calls.count('escape_island:career/settle'),1)
        self.runf('game/end_all_infected_finish')
        self.assertEqual(self.vm.calls.count('escape_island:career/settle'),1)
    def test_two_cures_expire_independently(self):
        self.a.tags.add('state.infected_period');self.runf('infection/cure',self.a)
        for _ in range(200):self.runf('player/tick_timers',self.a)
        self.b.tags.add('state.infected_period');self.runf('infection/cure',self.b)
        for _ in range(200):
            self.runf('player/tick_timers',self.a);self.runf('player/tick_timers',self.b)
        self.assertNotIn('state.infection_resist',self.a.tags)
        self.assertIn('state.infection_resist',self.b.tags);self.assertEqual(self.b.scores['ie.resist_left'],200)
        self.assertFalse(self.vm.scheduled)
    def test_personal_disguise_expires_on_its_player(self):
        self.a.tags.add('state.disguised');self.a.scores['ie.disguise_left']=2
        self.b.tags.add('state.disguised');self.b.scores['ie.disguise_left']=5
        for _ in range(2):
            self.runf('player/tick_timers',self.a);self.runf('player/tick_timers',self.b)
        self.assertNotIn('state.disguised',self.a.tags);self.assertIn('state.disguised',self.b.tags)
        self.assertEqual(self.b.scores['ie.disguise_left'],3)
    def test_pending_sporification_prevents_premature_purge(self):
        self.active_match();self.score('mother_dead',1)
        self.a.tags.add('team.human');self.b.tags.update(['state.sporifying','team.human'])
        self.runf('game/result/check');self.assertEqual(self.value('in_game'),1)
        self.b.tags.remove('state.sporifying');self.b.tags.discard('team.human')
        self.runf('game/result/check');self.assertEqual(self.value('escape_result'),4)
    def test_infected_waits_for_offline_living_mother(self):
        self.active_match()
        self.a.tags.update(['infected.common', 'state.dead'])
        self.a.scores['mother_respawn'] = 0
        self.runf('infection/respawn_tick')
        self.assertIn('state.dead', self.a.tags)
        self.assertNotIn('state.spectator', self.a.tags)
        self.score('mother_dead', 1)
        self.runf('infection/respawn_tick')
        self.assertIn('state.spectator', self.a.tags)
    def test_purge_waits_for_disconnected_participant(self):
        self.active_match(); self.score('mother_dead', 1)
        self.a.tags.add('team.human')
        self.vm.players.remove(self.b)
        self.runf('game/result/check')
        self.assertEqual(self.value('in_game'), 1)
        self.vm.players.append(self.b)
        self.runf('game/result/check')
        self.assertEqual(self.value('escape_result'), 4)
    def test_no_living_survivor_does_not_win_purge(self):
        self.active_match();self.score('mother_dead',1);self.a.tags.update(['team.human','state.dead'])
        self.runf('game/result/check')
        self.assertEqual(self.value('in_game'),1)
        self.assertNotIn('escape_island:game/end_purge',self.vm.calls)
    def test_human_transition_is_idempotent_and_preserves_offline_survivors(self):
        self.active_match()
        self.a.tags.add('team.human')
        self.runf('game/human/leave', self.a)
        self.runf('game/human/leave', self.a)
        self.assertEqual(self.value('ie.humans'), 1)
        self.assertNotIn('team.human', self.a.tags)
        self.runf('game/result/check')
        self.assertEqual(self.value('in_game'), 1)
        self.score('ie.humans', 0)
        self.runf('game/result/check')
        self.assertEqual(self.value('in_game'), 0)
        self.assertEqual(self.value('ie.mode'), 4)
    def test_training_entry_and_role_selection_cannot_mutate_live_match(self):
        self.active_match();self.a.tags.add('role.engineer')
        self.runf('training/start',self.a);self.runf('training/choose_doctor',self.a)
        self.assertIn('role.engineer',self.a.tags);self.assertNotIn('role.doctor',self.a.tags)
        self.assertNotIn('state.training',self.a.tags);self.assertEqual(self.value('in_game'),1)
    def test_training_rule_restored_after_last_player_and_cleanup(self):
        self.vm.rules['immediate_respawn'] = False
        self.a.tags.add('state.training'); self.b.tags.add('state.training')
        self.runf('training/acquire_rules'); self.runf('training/acquire_rules')
        self.a.tags.remove('state.training')
        self.runf('training/restore_rules_if_idle')
        self.assertTrue(self.vm.rules['immediate_respawn'])
        self.b.tags.remove('state.training')
        self.runf('training/restore_rules_if_idle')
        self.assertFalse(self.vm.rules['immediate_respawn'])
        self.a.tags.update(['state.training', 'ie.active'])
        self.runf('training/acquire_rules'); self.runf('game/cleanup')
        self.assertFalse(self.vm.rules['immediate_respawn'])
    def test_reload_restores_training_rule_without_online_players(self):
        self.vm.rules['immediate_respawn'] = True
        self.vm.scores['$training', 'ie.rules_saved'] = 1
        self.vm.scores['$training', 'ie.prev_respawn'] = 0
        self.runf('game/reload')
        self.assertFalse(self.vm.rules['immediate_respawn'])
        self.assertEqual(self.vm.scores['$training', 'ie.rules_saved'], 0)
    def test_profession_assignment_replaces_previous_identity(self):
        self.a.tags.update(['role.mechanic','role.athlete'])
        self.runf('role/_tag_doctor',self.a)
        self.assertEqual({x for x in self.a.tags if x.startswith('role.')},{'role.doctor'})
    def test_more_players_than_roles_all_receive_a_role(self):
        for count in (12, 20):
            with self.subTest(count=count):
                self.vm = Runtime()
                self.vm.players = [Player(f'P{i}') for i in range(count)]
                self.score('player_count', count)
                self.runf('role/assign')
                assigned = [player.scores.get('role', 0) for player in self.vm.players]
                self.assertTrue(all(1 <= role <= 10 for role in assigned), assigned)
                self.assertEqual(len(set(assigned)), 10)
                self.assertTrue(all('state.role_candidate' not in player.tags for player in self.vm.players))
    def test_returning_offline_player_loses_stale_session_state(self):
        self.a.tags.update(['ie.participant','ie.active','infected.mother']);self.a.scores['ie.session']=1
        self.score('ie.match_id',2);self.runf('player/validate_sessions')
        self.assertNotIn('infected.mother',self.a.tags);self.assertNotIn('ie.participant',self.a.tags)
    def test_start_refuses_reentry_without_resetting_match(self):
        self.active_match();self.score('phase_timer',987)
        self.runf('game/start');self.runf('game/start_test')
        self.assertEqual(self.value('phase_timer'),987)
        self.assertNotIn('escape_island:game/initialize',self.vm.calls)


    def test_two_complete_initializations_reassign_one_profession_per_player(self):
        self.vm.players += [Player('C'),Player('D')]
        self.score('player_count',4)
        self.runf('game/initialize')
        first_id=self.value('ie.match_id')
        self.a.attributes.update(armor=4,armor_toughness=2,knockback_resistance=.8)
        self.a.tags.update(['infected.mother','role.mechanic'])
        self.runf('game/cleanup');self.runf('game/initialize')
        self.assertGreater(self.value('ie.match_id'),first_id)
        for p in self.vm.players:
            self.assertEqual(len([t for t in p.tags if t.startswith('role.')]),1)
            self.assertIn('ie.participant',p.tags)
            self.assertEqual(p.scores['ie.session'],self.value('ie.match_id'))
        self.assertEqual(self.a.attributes['armor'],0)
        self.assertEqual(self.value('phase_timer'),0)
    def test_reload_exits_active_match_and_restores_rules(self):
        self.active_match();self.a.tags.add('team.human')
        self.score('ie.rules_saved',1);self.score('ie.prev_regen',1);self.score('ie.prev_respawn',0)
        self.runf('game/reload')
        self.assertEqual(self.value('in_game'),0)
        self.assertNotIn('ie.active',self.a.tags);self.assertNotIn('team.human',self.a.tags)
        self.assertTrue(self.vm.rules['natural_health_regeneration']);self.assertFalse(self.vm.rules['immediate_respawn'])
    def test_idle_reload_does_not_reset_unrelated_player(self):
        self.a.mode='creative';self.a.attributes['movement_speed']=.15
        self.runf('game/reload')
        self.assertEqual(self.a.mode,'creative');self.assertEqual(self.a.attributes['movement_speed'],.15)
        self.assertNotIn('escape_island:player/reset',self.vm.calls)
    def test_cleanup_leaves_late_spectator_unmodified(self):
        self.active_match();spectator=Player('Viewer',mode='creative');spectator.scores['career_xp']=17
        self.vm.players.append(spectator);self.runf('game/cleanup')
        self.assertEqual(spectator.mode,'creative');self.assertEqual(spectator.scores['career_xp'],17)
    def test_settlement_preserves_nonparticipant_score(self):
        self.active_match()
        spectator = Player('Viewer', scores={'mvp_score': 777, 'match_repair': 5})
        self.vm.players.append(spectator)
        self.runf('career/settle')
        self.assertEqual(spectator.scores['mvp_score'], 777)
    def test_gunfight_preparation_keeps_the_selected_participants(self):
        self.a.tags.update(['gs.ready','state.training','ie.active']);self.b.tags.add('gs.ready')
        self.runf('gunfight/start',self.a)
        self.assertTrue(all('gs.player' in p.tags for p in self.vm.players))
        self.assertTrue(all('ie.active' in p.tags for p in self.vm.players))
        self.assertTrue(all('state.training' not in p.tags for p in self.vm.players))
        self.runf('gunfight/cleanup')
        self.assertTrue(all('ie.active' not in p.tags for p in self.vm.players))


    def test_disguise_expiry_does_not_eject_other_boarding_survivors(self):
        self.a.tags.update(['state.disguised','state.disguise_scanning','state.boarding','state.boarding.heli'])
        self.a.scores['ie.disguise_left']=1;self.a.scores['ie.scan_left']=50;self.a.mode='spectator'
        self.b.tags.update(['state.boarding','state.boarding.heli']);self.b.mode='spectator'
        self.runf('player/tick_timers',self.a)
        self.assertNotIn('state.boarding',self.a.tags);self.assertEqual(self.a.mode,'adventure')
        self.assertIn('state.boarding',self.b.tags);self.assertEqual(self.b.mode,'spectator')


    def test_player_reset_removes_only_owned_devices(self):
        self.runf('player/ensure_actor_id',self.a);self.runf('player/ensure_actor_id',self.b)
        first=Entity('battery',tags={'ie.owned'},scores={'ie.owner':self.a.scores['ie.actor']})
        second=Entity('trap',tags={'ie.owned'},scores={'ie.owner':self.b.scores['ie.actor']})
        self.vm.entities=[first,second]
        self.runf('player/reset',self.a)
        self.assertNotIn(first,self.vm.entities);self.assertIn(second,self.vm.entities)
        self.assertNotEqual(self.a.scores['ie.actor'],self.b.scores['ie.actor'])
    def test_claimed_devices_receive_stable_creator_identity(self):
        first=Entity('battery',tags={'ie.new'})
        self.vm.entities=[first];self.runf('player/claim_entities',self.a)
        self.assertEqual(first.scores['ie.owner'],self.a.scores['ie.actor'])
        self.assertIn('ie.owned',first.tags);self.assertNotIn('ie.new',first.tags)


    def test_loaded_devices_from_old_session_are_discarded(self):
        self.score('ie.match_id',2)
        old=Entity('old-trap',tags={'ie.owned'},scores={'ie.session':1})
        current=Entity('current-trap',tags={'ie.owned'},scores={'ie.session':2})
        self.vm.entities=[old,current];self.runf('player/validate_sessions')
        self.assertNotIn(old,self.vm.entities);self.assertIn(current,self.vm.entities)

if __name__=='__main__':unittest.main()
