clear @s minecraft:glowstone_dust[minecraft:custom_data={skill:"mother/howl"}]
clear @s minecraft:blaze_powder[minecraft:custom_data={skill:"mother/howl_used"}]

scoreboard players operation @s skill.howl_sec = @s cd_mother_howl
scoreboard players operation @s skill.howl_sec /= $const_20 cd_mother_rotsense
execute store result storage skill:mother.howl item.sec int 1 run scoreboard players get @s skill.howl_sec

execute if score @s cd_mother_howl matches 1.. run function skill:mother/howl/item_cooldown with storage skill:mother.howl item
execute if score @s cd_mother_howl matches 1.. run scoreboard players operation @s skill.howl_last = @s skill.howl_sec
execute unless score @s cd_mother_howl matches 1.. run function skill:mother/howl_item
execute unless score @s cd_mother_howl matches 1.. run scoreboard players set @s skill.howl_last -1
