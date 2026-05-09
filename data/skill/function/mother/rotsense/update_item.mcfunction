clear @s minecraft:redstone[minecraft:custom_data={skill:"mother/rotsense"}]
clear @s minecraft:gunpowder[minecraft:custom_data={skill:"mother/rotsense_used"}]

scoreboard players operation @s skill.rotsense_sec = @s cd_mother_rotsense
scoreboard players operation @s skill.rotsense_sec /= $const_20 cd_mother_rotsense
execute store result storage skill:mother.rotsense item.sec int 1 run scoreboard players get @s skill.rotsense_sec

execute if score @s cd_mother_rotsense matches 1.. run function skill:mother/rotsense/item_cooldown with storage skill:mother.rotsense item
execute if score @s cd_mother_rotsense matches 1.. run scoreboard players operation @s skill.rotsense_last = @s skill.rotsense_sec
execute unless score @s cd_mother_rotsense matches 1.. run function skill:mother/rotsense_item
execute unless score @s cd_mother_rotsense matches 1.. run scoreboard players set @s skill.rotsense_last -1
