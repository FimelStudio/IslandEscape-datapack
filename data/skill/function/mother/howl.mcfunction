clear @s minecraft:blaze_powder[minecraft:custom_data={skill:"mother/howl_used"}] 1
advancement revoke @s only skill:mother/howl

execute if score @s cd_mother_howl matches 1.. run return 0

scoreboard players set @s cd_mother_howl 1800

effect give @a[tag=infected.common,tag=!state.dead] minecraft:speed 10 1 true
effect give @a[tag=infected.common,tag=!state.dead] minecraft:strength 10 0 true

playsound minecraft:entity.wither.ambient master @a ~ ~ ~ 1 0.5
tellraw @a {"text":"§4[嚎叫] 母体在召唤！所有感染者获得速度和力量。","color":"dark_red","bold":true}
