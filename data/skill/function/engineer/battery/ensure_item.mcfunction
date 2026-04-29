advancement revoke @s only skill:engineer/battery/use
execute unless items entity @s hotbar.6 minecraft:redstone_torch[minecraft:custom_data~{skill:"engineer_battery"}] run function skill:engineer/battery/update_item
