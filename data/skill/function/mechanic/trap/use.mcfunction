advancement revoke @s only skill:mechanic/trap/use
tag @s remove skill.trap.recalled

execute unless entity @s[tag=role.mechanic] unless entity @s[tag=retained.mechanic] run function skill:mechanic/cleanup_non_mechanic
execute unless entity @s[tag=role.mechanic] unless entity @s[tag=retained.mechanic] run return 0

execute if predicate skill:is_sneak run scoreboard players set #recall_len skill.trap_tmp 0
execute if predicate skill:is_sneak anchored eyes run function skill:mechanic/trap/recall_raycast
execute if predicate skill:is_sneak unless entity @s[tag=skill.trap.recalled] run title @s actionbar {"text":"未瞄准可拆除的机关陷阱","color":"gray"}
execute if predicate skill:is_sneak run tag @s remove skill.trap.recalled
execute if predicate skill:is_sneak run return 0

execute if score @s skill.trap_place_cd matches 1.. run title @s actionbar {"text":"机关陷阱布置间隔","color":"yellow"}
execute if score @s skill.trap_place_cd matches 1.. run function skill:mechanic/trap/update_item
execute if score @s skill.trap_place_cd matches 1.. run return 0

function skill:mechanic/trap/start
