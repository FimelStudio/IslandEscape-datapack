clear @s
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
tag @s remove gen.channel.sabotage
tag @s remove gen.channel.repair
scoreboard players reset @s skill.mother_eat_anim
scoreboard players set @s skill.trap_charges 0
scoreboard players set @s skill.trap_place_cd 0
tag @s remove state.infected_period
tag @s remove state.sporifying
tag @s remove state.dead
tag @s remove state.disguised
tag @s remove state.infection_resist
tag @s remove flag.cross_intact
tag @s remove flag.cross_intercepted
tag @s remove flag.has_inject
tag @s remove flag.has_disguise
tag @s remove flag.first_attack
tag @s remove state.attack_slowed
tag @s remove state.mutated
tag @s remove skill.antidote.user
tag @s remove skill.antidote.target
tag @s remove skill.battery.recalled
tag @s remove skill.gun_mastery.hit
function skill:radio/cleanup_non_radio
function skill:virologist/cleanup_non_virologist
function skill:priest/cleanup_non_priest
scoreboard players set @s role 0
scoreboard players set @s is_mother 0
scoreboard players set @s spore_load 0
scoreboard players set @s spore_decay_cd 0
scoreboard players set @s cd_mother_rotsense 0
scoreboard players set @s cd_mother_howl 0
scoreboard players set @s skill.rotsense_sec 0
scoreboard players set @s skill.rotsense_last 0
scoreboard players set @s skill.howl_sec 0
scoreboard players set @s skill.howl_last 0
scoreboard players set @s infect_time 0
scoreboard players set @s sporify_timer 0
scoreboard players set @s mother_respawn 0
scoreboard players set @s mother_hit_cd 0
scoreboard players set @s mother_phase 0
scoreboard players set @s mother_phase_timer 0
scoreboard players set @s mother_last_hp 0
scoreboard players set @s mother_regen_cd 0
scoreboard players set @s death_count 0
scoreboard players set @s skill.antidote_charges 0
scoreboard players set @s skill.antidote_cd 0
scoreboard players set @s skill.antidote_regen_cd 0
scoreboard players set @s skill.antidote_state 0
scoreboard players set @s skill.whistle_cd 0
scoreboard players set @s skill.whistle_item 0
scoreboard players set @s skill.whistle_state 0
scoreboard players set @s skill.battery_cd 0
scoreboard players set @s skill.battery_item 0
scoreboard players set @s skill.battery_state 0
scoreboard players set @s skill.suppress_cd 0
scoreboard players set @s skill.suppress_item 0
scoreboard players set @s skill.suppress_state 0
scoreboard players set @s skill.gm_burst 0
scoreboard players set @s skill.gm_delay 0
scoreboard players set @s skill.gm_input_cd 0
scoreboard players set @s skill.soup_cd 0
scoreboard players set @s skill.soup_item 0
scoreboard players set @s skill.soup_state 0
scoreboard players set @s skill.soup_sec 0
scoreboard players set @s skill.soup_last_sec 0
effect clear @s
team leave @s
gamemode adventure @s
execute at @s run kill @e[type=minecraft:marker,tag=entity.downed_anchor,distance=..3,sort=nearest,limit=1]
execute at @s run kill @e[type=minecraft:marker,tag=entity.dead_anchor,distance=..3,sort=nearest,limit=1]
attribute @s minecraft:max_health base set 20
attribute @s minecraft:attack_damage base set 1
attribute @s minecraft:armor base set 0
attribute @s minecraft:armor_toughness base set 0
attribute @s minecraft:knockback_resistance base set 0
attribute @s minecraft:movement_speed base set 0.1
effect give @s minecraft:instant_health 1 10 true
effect give @s minecraft:saturation 1 20 true
