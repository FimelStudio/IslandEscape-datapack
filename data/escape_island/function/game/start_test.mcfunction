execute unless score $game dev_mode matches 1 run function escape_island:util/recount_players
execute if score $game player_count matches ..3 run tellraw @a {"text":"[孤岛逃生 测试版] 至少需要 4 名玩家才能开始。","color":"red"}
execute if score $game player_count matches ..3 run return 0

scoreboard players set Tunable tunable.ship_parts_required 5
execute if score $game player_count matches 4 run scoreboard players set Tunable tunable.ship_parts_required 3

function escape_island:util/apply_scaling

gamerule immediate_respawn true
gamerule natural_health_regeneration false
kill @e[tag=entity.downed_anchor]
kill @e[tag=entity.dead_anchor]
function skill:mother/eat/clear_storage

scoreboard players set $game in_game 1
scoreboard players set $game cur_phase 1
scoreboard players set $game phase_timer 0
scoreboard players set $game escaped_count 0
scoreboard players set $game infected_dead 0
scoreboard players set $game bomb_armed 0
scoreboard players set $game dawn_active 0
scoreboard players set $game mother_dead 0
scoreboard players set $game ending_triggered 0
scoreboard players set $game signal_progress 0
scoreboard players set $game signal_done 0
scoreboard players set @e[type=minecraft:marker,tag=marker.signal_tower] signal_local 0
scoreboard players set @e[type=minecraft:marker,tag=marker.signal_tower] signal_core_acc 0
scoreboard players set @e[type=minecraft:marker,tag=marker.signal_tower] signal_repair_acc 0
tag @e[tag=marker.signal_done] remove marker.signal_done
scoreboard players set $game ship_progress 0
scoreboard players set $game ship_bonus_tick 0
function escape_island:task/ship_reset_parts
scoreboard players set $game ship_hold_time 0
scoreboard players set $game ship_hold_seen 0
scoreboard players set $game lab_cards 0
scoreboard players set $game gen_state 0
scoreboard players set $game gen_countdown 0
scoreboard players set $game gen_overload 0
scoreboard players set $game gen_hold_time 0
scoreboard players set $game gen_hold_seen 0
scoreboard players set $game gen_hold_lock 0
scoreboard players set $game gen_interact_cd 0
scoreboard players set $game gen_done 0
scoreboard players set @e[type=minecraft:marker,tag=marker.generator] gen_progress 0
scoreboard players set @e[type=minecraft:marker,tag=marker.generator] gen_state 0
scoreboard players set @e[type=minecraft:marker,tag=marker.generator] gen_countdown 0
scoreboard players set @e[type=minecraft:marker,tag=marker.generator] gen_overload 0
function escape_island:task/generator_attach_interactions

tag @a remove team.human
tag @a remove team.infected
tag @a remove infected.special
tag @a remove infected.licker
tag @a remove infected.listener
tag @a remove infected.runner
tag @a remove infected.tank
tag @a remove infected.spitter
tag @a remove infected.mother
tag @a remove infected.common
tag @a remove role.doctor
tag @a remove role.captain
tag @a remove role.engineer
tag @a remove role.marine
tag @a remove role.chef
tag @a remove role.radio
tag @a remove role.virologist
tag @a remove role.mechanic
tag @a remove role.priest
tag @a remove role.athlete
tag @a remove state.latent_host
tag @a remove infected.secondary_mother
tag @a remove skill.adrenaline.active
tag @a remove skill.slide.active
tag @a remove skill.slide.locked
tag @a remove skill.mother.eating
tag @a remove skill.mother.eat.fired
tag @a remove skill.mother.eat.absorbing
tag @a remove skill.mother.eat.target
tag @a remove state.infected_period
tag @a remove state.boarding
tag @a remove state.escaped
tag @a remove state.sporifying
tag @a remove state.dead
tag @a remove state.spectator
tag @a remove state.disguised
tag @a remove state.disguise_scanning
tag @a remove state.infection_resist
tag @a remove state.berserk
tag @a remove state.infect_immune
tag @a remove retained.doctor
tag @a remove retained.captain
tag @a remove retained.engineer
tag @a remove retained.marine
tag @a remove retained.chef
tag @a remove retained.radio
tag @a remove retained.virologist
tag @a remove retained.mechanic
tag @a remove retained.athlete
tag @a remove retained.priest
tag @a remove flag.has_inject
tag @a remove flag.has_keynote
tag @a remove flag.has_promfile
tag @a remove flag.has_disguise
tag @a remove flag.tutorial_seen
tag @a remove flag.first_attack
tag @a remove state.attack_slowed
tag @a remove state.mutated
tag @a remove mother.passive.fire
tag @a remove skill.antidote.user
tag @a remove skill.antidote.target
tag @a remove skill.battery.recalled
tag @a remove skill.gun_mastery.hit
execute as @a run function skill:radio/cleanup_non_radio
execute as @a run function skill:virologist/cleanup_non_virologist
execute as @a run function skill:priest/cleanup_non_priest

scoreboard players reset @a spore_load
scoreboard players reset @a signal_repair_time
scoreboard players reset @a signal_repair_seen
scoreboard players reset @a bomb_repair_time
scoreboard players reset @a bomb_file_count
scoreboard players reset @a spore_decay_cd
scoreboard players reset @a infect_time
scoreboard players reset @a sporify_timer
scoreboard players reset @a is_mother
scoreboard players reset @a mother_hp
scoreboard players reset @a mother_respawn
scoreboard players reset @a cd_doctor
scoreboard players reset @a skill.antidote_charges
scoreboard players reset @a skill.antidote_cd
scoreboard players reset @a skill.antidote_regen_cd
scoreboard players reset @a skill.antidote_item
scoreboard players reset @a skill.antidote_state
scoreboard players reset @a skill.antidote_sec
scoreboard players reset @a skill.antidote_last_sec
scoreboard players reset @a skill.whistle_cd
scoreboard players reset @a skill.whistle_item
scoreboard players reset @a skill.whistle_state
scoreboard players reset @a skill.whistle_sec
scoreboard players reset @a skill.whistle_last_sec
scoreboard players reset @a skill.battery_cd
scoreboard players reset @a skill.battery_item
scoreboard players reset @a skill.battery_state
scoreboard players reset @a skill.battery_sec
scoreboard players reset @a skill.battery_last_sec
scoreboard players reset @a skill.suppress_cd
scoreboard players reset @a skill.suppress_item
scoreboard players reset @a skill.suppress_state
scoreboard players reset @a skill.suppress_sec
scoreboard players reset @a skill.suppress_last_sec
scoreboard players reset @a skill.gm_burst
scoreboard players reset @a skill.gm_delay
scoreboard players reset @a skill.gm_input_cd
scoreboard players reset @a skill.soup_cd
scoreboard players reset @a skill.soup_item
scoreboard players reset @a skill.soup_state
scoreboard players reset @a skill.soup_sec
scoreboard players reset @a skill.soup_last_sec
scoreboard players reset @a cd_marine
scoreboard players reset @a cd_chef
scoreboard players reset @a cd_radio
scoreboard players reset @a cd_virologist
scoreboard players reset @a cd_mechanic
scoreboard players reset @a cd_priest
scoreboard players reset @a skill.adren_time
scoreboard players reset @a skill.adren_cd
scoreboard players reset @a skill.slide_time
scoreboard players reset @a skill.slide_cd
scoreboard players reset @a skill.stamina_warn
scoreboard players reset @a skill.mother_eat_anim
scoreboard players reset @a ie.dialog
scoreboard players reset @a ie.eat_health
scoreboard players reset @a cd_mother_lunge
scoreboard players reset @a cd_mother_hunt
scoreboard players reset @a cd_mother_mutate
scoreboard players reset @a cd_mother_passive_spore
scoreboard players reset @a cd_aura_heartbeat
scoreboard players reset @a cd_mother_rotsense
scoreboard players reset @a cd_mother_howl
scoreboard players reset @a skill.rotsense_sec
scoreboard players reset @a skill.rotsense_last
scoreboard players reset @a skill.mutate_sec
scoreboard players reset @a skill.mutate_last
scoreboard players reset @a skill.howl_sec
scoreboard players reset @a skill.howl_last
scoreboard players reset @a death_count
scoreboard players reset @a hb_phase
scoreboard players reset @a mother_last_hp
scoreboard players reset @a mother_regen_cd
scoreboard players reset @a mother_hit_cd
scoreboard players reset @a mother_phase
scoreboard players reset @a mother_phase_timer
scoreboard players reset @a mother_passive_stick
scoreboard players reset @a gen_interact_cd
scoreboard players operation @a used_firework_last = @a used_firework

team join survivors @a
clear @a
gamemode adventure @a
effect clear @a
execute as @a run attribute @s minecraft:movement_speed base set 0.1

give @a minecraft:string[custom_data={item:"cable"},custom_name={text:"线缆",color:"yellow",bold:true,italic:false},lore=[{text:"手持靠近信号塔自动修复",color:"gray",italic:false}]] 1
give @a minecraft:gold_ingot[custom_data={item:"fuel_cell"},custom_name={text:"燃料电池",color:"gold",bold:true,italic:false},lore=[{text:"对着发电机右键投入燃料",color:"gray",italic:false}],consumable={animation:"spyglass",consume_seconds:999,has_consume_particles:false,sound:{sound_id:""}},use_cooldown={seconds:0.1,cooldown_group:"escape_island:generator_use"}] 3

effect give @a minecraft:saturation 1 20 true

function escape_island:game/randomize_match
function escape_island:dev/show_markers

function escape_island:task/place_loot_chests

function escape_island:game/phase_1_load
