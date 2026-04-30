advancement revoke @s only skill:virologist/detector/use
clear @s minecraft:potion[minecraft:custom_data~{skill:"viro_detector"}]
clear @s minecraft:glass_bottle[minecraft:custom_data~{skill:"viro_detector"}]
clear @s minecraft:glass_bottle[minecraft:custom_data~{role_item:"virologist.reagent"}]
scoreboard players set @s skill.detector_cd 0
scoreboard players set @s skill.detector_item 0
scoreboard players set @s skill.detector_state 0
scoreboard players set @s skill.detector_sec 0
scoreboard players set @s skill.detector_last_sec 0
scoreboard players set @s skill.viro_passive_cd 0
tag @s remove skill.virologist.hit
tag @s remove skill.virologist.viewer
