advancement revoke @s only skill:engineer/battery/use
execute store result score @s skill.battery_item run clear @s minecraft:redstone_torch[custom_data={skill:"engineer_battery"}] 0
execute if score @s skill.battery_item matches 0 run function skill:engineer/battery/update_item
