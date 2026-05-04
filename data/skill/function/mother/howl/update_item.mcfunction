clear @s minecraft:glowstone_dust[minecraft:custom_data={skill:"mother/howl"}]
clear @s minecraft:blaze_powder[minecraft:custom_data={skill:"mother/howl_used"}]

execute store result storage skill:mother.howl item.sec int 1 run scoreboard players get @s skill.howl_sec

execute if score @s cd_mother_howl matches 1.. run function skill:mother/howl/item_cooldown with storage skill:mother.howl item
execute unless score @s cd_mother_howl matches 1.. run function skill:mother/howl_item
