clear @s
tag @s remove state.training
tag @s remove role.doctor
tag @s remove role.captain
tag @s remove role.engineer
tag @s remove role.marine
tag @s remove role.chef
tag @s remove role.radio
tag @s remove role.virologist
tag @s remove role.mechanic
tag @s remove role.priest
tag @s remove role.athlete
tag @s remove role.priest
tag @s remove skill.adrenaline.active
tag @s remove skill.slide.active
tag @s remove skill.slide.locked
tag @s remove skill.mother.eating
tag @s remove skill.mother.eat.fired
tag @s remove skill.mother.eat.absorbing
tag @s remove skill.mother.eat.target
scoreboard players reset @s skill.mother_eat_anim
tag @s remove team.human
tag @s remove team.infected
tag @s remove infected.secondary_mother
tag @s remove infected.special
tag @s remove infected.licker
tag @s remove infected.listener
tag @s remove infected.runner
tag @s remove infected.tank
tag @s remove infected.spitter
tag @s remove state.latent_host
tag @s remove infected.mother
tag @s remove infected.common
tag @s remove state.infected_period
tag @s remove state.sporifying
tag @s remove state.dead
tag @s remove state.disguised
tag @s remove state.infection_resist
tag @s remove retained.doctor
tag @s remove retained.captain
tag @s remove retained.engineer
tag @s remove retained.marine
tag @s remove retained.chef
tag @s remove retained.radio
tag @s remove retained.virologist
tag @s remove retained.mechanic
tag @s remove retained.athlete
tag @s remove retained.priest
tag @s remove flag.cross_intact
tag @s remove flag.has_inject
tag @s remove flag.has_disguise
tag @s remove flag.self_injected_this_period
tag @s remove flag.cross_intercepted
tag @s remove flag.first_attack
tag @s remove state.attack_slowed
tag @s remove skill.antidote.user
tag @s remove skill.antidote.target
tag @s remove skill.battery.recalled
tag @s remove skill.gun_mastery.hit
function skill:radio/cleanup_non_radio
function skill:virologist/cleanup_non_virologist
function skill:priest/cleanup_non_priest
scoreboard players set @s spore_load 0
scoreboard players set @s spore_decay_cd 0
scoreboard players set @s infect_time 0
scoreboard players set @s sporify_timer 0
scoreboard players set @s mother_respawn 0
scoreboard players set @s mother_last_hp 0
scoreboard players set @s mother_regen_cd 0
scoreboard players set @s mother_hit_cd 0
scoreboard players set @s mother_phase 0
scoreboard players set @s mother_phase_timer 0
scoreboard players set @s hb_phase 0
scoreboard players operation @s used_firework_last = @s used_firework
scoreboard players set @s cd_doctor 0
scoreboard players set @s skill.antidote_charges 0
scoreboard players set @s skill.antidote_cd 0
scoreboard players set @s skill.antidote_regen_cd 0
scoreboard players set @s skill.antidote_item 0
scoreboard players set @s skill.antidote_state 0
scoreboard players set @s skill.antidote_sec 0
scoreboard players set @s skill.antidote_last_sec 0
scoreboard players set @s skill.whistle_cd 0
scoreboard players set @s skill.whistle_item 0
scoreboard players set @s skill.whistle_state 0
scoreboard players set @s skill.whistle_sec 0
scoreboard players set @s skill.whistle_last_sec 0
scoreboard players set @s skill.battery_cd 0
scoreboard players set @s skill.battery_item 0
scoreboard players set @s skill.battery_state 0
scoreboard players set @s skill.battery_sec 0
scoreboard players set @s skill.battery_last_sec 0
scoreboard players set @s skill.suppress_cd 0
scoreboard players set @s skill.suppress_item 0
scoreboard players set @s skill.suppress_state 0
scoreboard players set @s skill.suppress_sec 0
scoreboard players set @s skill.suppress_last_sec 0
scoreboard players set @s skill.gm_burst 0
scoreboard players set @s skill.gm_delay 0
scoreboard players set @s skill.gm_input_cd 0
scoreboard players set @s skill.soup_cd 0
scoreboard players set @s skill.soup_item 0
scoreboard players set @s skill.soup_state 0
scoreboard players set @s skill.soup_sec 0
scoreboard players set @s skill.soup_last_sec 0
scoreboard players set @s cd_marine 0
scoreboard players set @s cd_chef 0
scoreboard players set @s cd_radio 0
scoreboard players set @s cd_virologist 0
scoreboard players set @s cd_mechanic 0
scoreboard players set @s skill.trap_charges 0
scoreboard players set @s skill.trap_place_cd 0
scoreboard players set @s cd_priest 0
scoreboard players set @s skill.adren_time 0
scoreboard players set @s skill.adren_cd 0
scoreboard players set @s skill.slide_time 0
scoreboard players set @s skill.slide_cd 0
scoreboard players set @s skill.slide_sprint 0
scoreboard players set @s skill.stamina_warn 0
scoreboard players set @s cd_mother_lunge 0
scoreboard players set @s cd_mother_rotsense 0
scoreboard players set @s cd_mother_howl 0
scoreboard players set @s skill.rotsense_sec 0
scoreboard players set @s skill.rotsense_last 0
scoreboard players set @s skill.howl_sec 0
scoreboard players set @s skill.howl_last 0
scoreboard players set @s death_count 0
effect clear @s
team leave @s
gamemode adventure @s
kill @e[tag=test.dummy]
kill @e[tag=entity.chef_stew_pot]
kill @e[tag=entity.engineer_battery]
kill @e[tag=entity.mechanic_trap]
kill @e[tag=entity.downed_anchor]
kill @e[tag=entity.dead_anchor]
kill @e[tag=display.infection_vignette]
clear @s minecraft:carved_pumpkin
tellraw @s [{"text":"[训练模式] 已退出并清理。","color":"gray"},{"text":" [自测菜单]","color":"aqua","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/menu"}}]
attribute @s minecraft:movement_speed base reset
attribute @s minecraft:max_health base reset
attribute @s minecraft:scale base reset