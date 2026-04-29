advancement revoke @s only skill:mechanic/trap/use
tag @s remove skill.trap_recalled

execute unless entity @s[tag=mechanic] unless entity @s[tag=retained.mechanic] run function skill:mechanic/cleanup_non_mechanic
execute unless entity @s[tag=mechanic] unless entity @s[tag=retained.mechanic] run return 0

execute if predicate skill:is_sneak at @s if entity @e[type=minecraft:marker,tag=skill.trap_marker,distance=..3,limit=1] run function skill:mechanic/trap/recall
execute if predicate skill:is_sneak unless entity @s[tag=skill.trap_recalled] at @s unless entity @e[type=minecraft:marker,tag=skill.trap_marker,distance=..3,limit=1] run title @s actionbar {"text":"附近没有可拆除的机关陷阱","color":"gray"}
execute if predicate skill:is_sneak run tag @s remove skill.trap_recalled
execute if predicate skill:is_sneak run return 0

execute if score @s skill.trap_place_cd matches 1.. run title @s actionbar {"text":"机关陷阱布置间隔","color":"yellow"}
execute if score @s skill.trap_place_cd matches 1.. run function skill:mechanic/trap/update_item
execute if score @s skill.trap_place_cd matches 1.. run return 0

function skill:mechanic/trap/start
