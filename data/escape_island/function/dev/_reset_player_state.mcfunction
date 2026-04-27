clear @s
tag @s remove role.survivor
tag @s remove role.mother
tag @s remove role.infected
tag @s remove role.doctor
tag @s remove role.captain
tag @s remove role.engineer
tag @s remove role.marine
tag @s remove role.chef
tag @s remove role.radio
tag @s remove role.virologist
tag @s remove role.mechanic
tag @s remove role.sailor
tag @s remove role.priest
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
scoreboard players set @s role 0
scoreboard players set @s is_mother 0
scoreboard players set @s spore_load 0
scoreboard players set @s spore_decay_cd 0
scoreboard players set @s infect_time 0
scoreboard players set @s sporify_timer 0
scoreboard players set @s mother_respawn 0
scoreboard players set @s death_count 0
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
