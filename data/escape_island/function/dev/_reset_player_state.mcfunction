clear @s
tag @s remove role.survivor
tag @s remove role.mother
tag @s remove role.infected
tag @s remove zombie
tag @s remove role.doctor
tag @s remove doctor
tag @s remove role.captain
tag @s remove captain
tag @s remove role.engineer
tag @s remove engineer
tag @s remove role.marine
tag @s remove marine
tag @s remove role.chef
tag @s remove chef
tag @s remove role.radio
tag @s remove radio
tag @s remove role.virologist
tag @s remove virologist
tag @s remove role.mechanic
tag @s remove role.sailor
tag @s remove role.athlete
tag @s remove role.priest
tag @s remove athlete
tag @s remove adren_active
tag @s remove sliding
tag @s remove slide_locked
tag @s remove mother_eating
tag @s remove mother_eat_fired
tag @s remove mother_eat_absorbing
tag @s remove eaten_zombie
scoreboard players reset @s skill.mother_eat_anim
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
tag @s remove skill.antidote_user
tag @s remove skill.antidote_target
tag @s remove skill.battery_recalled
tag @s remove skill.gm_hit
function skill:radio/cleanup_non_radio
function skill:virologist/cleanup_non_virologist
scoreboard players set @s role 0
scoreboard players set @s is_mother 0
scoreboard players set @s spore_load 0
scoreboard players set @s spore_decay_cd 0
scoreboard players set @s infect_time 0
scoreboard players set @s sporify_timer 0
scoreboard players set @s mother_respawn 0
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
gamemode survival @s
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
