advancement revoke @s only skill:engineer/battery/use
clear @s minecraft:sugar[custom_data={skill:"engineer_battery_used"}]

execute unless entity @s[tag=role.engineer] run function skill:engineer/battery/cleanup_non_engineer
execute unless entity @s[tag=role.engineer] run return 0

tag @s remove skill.battery.recalled
execute if predicate skill:is_sneak at @s if entity @e[type=minecraft:marker,tag=entity.engineer_battery,distance=..2,limit=1] run function skill:engineer/battery/recall
execute if predicate skill:is_sneak unless entity @s[tag=skill.battery.recalled] at @s unless entity @e[type=minecraft:marker,tag=entity.engineer_battery,distance=..2,limit=1] run title @s actionbar {"text":"附近没有可回收的微型电池","color":"gray"}
execute if predicate skill:is_sneak run tag @s remove skill.battery.recalled
execute if predicate skill:is_sneak run return 0

execute if score @s skill.battery_cd matches 1.. run title @s actionbar {"text":"微型电池冷却中","color":"yellow"}
execute if score @s skill.battery_cd matches 1.. run function skill:engineer/battery/update_item
execute if score @s skill.battery_cd matches 1.. run return 0

execute if entity @e[type=minecraft:marker,tag=entity.engineer_battery,limit=1] run title @s actionbar {"text":"场上已有微型电池，潜行右键靠近电池可回收","color":"red"}
execute if entity @e[type=minecraft:marker,tag=entity.engineer_battery,limit=1] run return 0

function skill:engineer/battery/start
