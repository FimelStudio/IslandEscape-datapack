clear @s minecraft:crossbow[minecraft:custom_data~{skill:"marine_suppress"}]
scoreboard players operation @s skill.suppress_sec = @s skill.suppress_cd
scoreboard players operation @s skill.suppress_sec /= #twenty skill.suppress_cfg
execute store result storage skill:marine.suppress item.sec int 1 run scoreboard players get @s skill.suppress_sec

execute if score @s skill.suppress_cd matches 1.. run scoreboard players set @s skill.suppress_state 2
execute if score @s skill.suppress_cd matches 1.. run function skill:marine/suppress/item_cooldown with storage skill:marine.suppress item
execute unless score @s skill.suppress_cd matches 1.. run scoreboard players set @s skill.suppress_state 1
execute unless score @s skill.suppress_cd matches 1.. run function skill:marine/suppress/item_ready
