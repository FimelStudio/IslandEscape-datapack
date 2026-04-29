clear @s minecraft:potion[minecraft:custom_data~{skill:"viro_detector"}]
clear @s minecraft:glass_bottle[minecraft:custom_data~{skill:"viro_detector"}]
clear @s minecraft:glass_bottle[minecraft:custom_data~{role_item:"virologist.reagent"}]
scoreboard players operation @s skill.detector_sec = @s skill.detector_cd
scoreboard players operation @s skill.detector_sec /= #twenty skill.detector_cfg
execute store result storage skill:virologist.detector item.sec int 1 run scoreboard players get @s skill.detector_sec

execute if score @s skill.detector_cd matches 1.. run scoreboard players set @s skill.detector_state 2
execute if score @s skill.detector_cd matches 1.. run function skill:virologist/detector/item_cooldown with storage skill:virologist.detector item
execute unless score @s skill.detector_cd matches 1.. run scoreboard players set @s skill.detector_state 1
execute unless score @s skill.detector_cd matches 1.. run function skill:virologist/detector/item_ready
