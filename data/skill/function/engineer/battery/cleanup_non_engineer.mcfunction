advancement revoke @s only skill:engineer/battery/use
clear @s minecraft:redstone_torch[custom_data={skill:"engineer_battery"}]
tag @s remove skill.battery_recalled
scoreboard players set @s skill.battery_cd 0
scoreboard players set @s skill.battery_item 0
scoreboard players set @s skill.battery_state 0
scoreboard players set @s skill.battery_sec 0
scoreboard players set @s skill.battery_last_sec 0
