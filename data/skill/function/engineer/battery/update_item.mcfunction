clear @s minecraft:redstone_torch[minecraft:custom_data~{skill:"engineer_battery"}]
scoreboard players operation @s skill.battery_sec = @s skill.battery_cd
scoreboard players operation @s skill.battery_sec /= #twenty skill.battery_cfg
execute store result storage skill:engineer.battery item.sec int 1 run scoreboard players get @s skill.battery_sec

execute if score @s skill.battery_cd matches 1.. run scoreboard players set @s skill.battery_state 2
execute if score @s skill.battery_cd matches 1.. run function skill:engineer/battery/item_cooldown with storage skill:engineer.battery item
execute unless score @s skill.battery_cd matches 1.. run scoreboard players set @s skill.battery_state 1
execute unless score @s skill.battery_cd matches 1.. run function skill:engineer/battery/item_ready
