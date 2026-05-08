tag @s add skill.mother.eating
function skill:mother/eat/clear_storage
function skill:mother/eat/config

execute anchored eyes positioned ^ ^ ^4 run tag @a[tag=infected.common,tag=!infected.mother,tag=!state.dead,tag=!state.spectator,tag=!skill.mother.eat.target,distance=..4,sort=nearest,limit=1] add skill.mother.eat.target
execute unless entity @a[tag=skill.mother.eat.target,limit=1] run tag @s remove skill.mother.eating
execute unless entity @a[tag=skill.mother.eat.target,limit=1] run function skill:mother/eat/eat_0
execute unless entity @a[tag=skill.mother.eat.target,limit=1] run return 0

execute store result storage zombie:eated target_health int 1 run attribute @a[tag=skill.mother.eat.target,limit=1] minecraft:max_health base get 1
execute store result storage zombie:eated target_speed double 1 run attribute @a[tag=skill.mother.eat.target,limit=1] minecraft:movement_speed base get 1
execute store result storage zombie:eated target_scale double 1 run attribute @a[tag=skill.mother.eat.target,limit=1] minecraft:scale base get 1
execute store result storage zombie:eated max_health int 1 run attribute @a[tag=skill.mother.eat.target,limit=1] minecraft:max_health base get 1
data modify storage zombie:eated target_name set value {selector:"@a[tag=skill.mother.eat.target,limit=1]"}
function skill:mother/eat/update_target_type
execute at @a[tag=skill.mother.eat.target,limit=1] summon text_display run function skill:mother/eat/eat_1_get_name

execute as @a[tag=skill.mother.eat.target,limit=1] at @s run function skill:mother/eat/start_absorb
title @s actionbar {"text":"已抓住感染体，正在吞噬。","color":"dark_red"}
