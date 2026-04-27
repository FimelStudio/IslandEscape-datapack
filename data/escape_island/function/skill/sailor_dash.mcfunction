# escape_island:skill/sailor_dash
advancement revoke @s only escape_island:skill/sailor_dash
execute if score @s cd_sailor matches 1.. run return 0

scoreboard players set @s cd_sailor 30
effect give @s minecraft:speed 3 2 false
playsound minecraft:entity.dolphin.jump master @s ~ ~ ~ 1 1.2
