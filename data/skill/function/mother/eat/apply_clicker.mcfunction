tag @s add infected.common
tag @s add infected.special
tag @s add infected.clicker
tag @s remove infected.licker
tag @s remove infected.runner
tag @s remove infected.tank
tag @s remove infected.spitter
scoreboard players set @s skill.clicker_cd 0
scoreboard players set @s skill.clicker_state 0
data modify storage zombie:eated target_type set value "循声者"

attribute @s minecraft:movement_speed base set 0.26
attribute @s minecraft:max_health base set 10
execute if entity @a[tag=infected.mother,scores={mother_phase=2},limit=1] run attribute @s minecraft:max_health base set 15
execute if entity @a[tag=infected.mother,scores={mother_phase=3},limit=1] run attribute @s minecraft:max_health base set 20
execute if entity @a[tag=infected.mother,scores={mother_phase=4..},limit=1] run attribute @s minecraft:max_health base set 25
effect give @s minecraft:instant_health 1 10 true
