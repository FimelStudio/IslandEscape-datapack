# escape_island:skill/mother_howl  —  孢子召唤: 感染者集合 60s
advancement revoke @s only escape_island:skill/mother_howl
execute if score @s cd_mother_howl matches 1.. run return 0

scoreboard players set @s cd_mother_howl 90
effect give @a[tag=role.infected] minecraft:speed 60 1 false
playsound minecraft:entity.wither.ambient master @a ~ ~ ~ 1 0.5
tellraw @a[tag=role.infected] {"text":"§4[召唤] 向母体集合！","color":"dark_red","bold":true}
