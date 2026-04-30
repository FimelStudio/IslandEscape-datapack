advancement revoke @s only skill:virologist/detector/use
clear @s minecraft:sugar[custom_data={skill:"viro_detector_used"}]

execute unless entity @s[tag=role.virologist] run function skill:virologist/detector/cleanup_non_virologist
execute unless entity @s[tag=role.virologist] run return 0

execute if score @s skill.detector_cd matches 1.. run title @s actionbar {"text":"检测剂冷却中","color":"yellow"}
execute if score @s skill.detector_cd matches 1.. run function skill:virologist/detector/update_item
execute if score @s skill.detector_cd matches 1.. run return 0

function skill:virologist/detector/start
