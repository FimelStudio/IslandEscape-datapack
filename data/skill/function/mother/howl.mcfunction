clear @s minecraft:blaze_powder[minecraft:custom_data={skill:"mother/howl_used"}] 1
advancement revoke @s only skill:mother/howl

execute if score @s cd_mother_howl matches 1.. run function skill:mother/howl/update_item
execute if score @s cd_mother_howl matches 1.. run return 0

scoreboard players set @s cd_mother_howl 1800
function skill:mother/howl/update_item

execute if score @s mother_phase matches ..2 run effect give @a[tag=infected.common,tag=!state.dead] minecraft:speed 10 1 true
execute if score @s mother_phase matches ..2 run effect give @a[tag=infected.common,tag=!state.dead] minecraft:strength 10 0 true
execute if score @s mother_phase matches 3.. run effect give @a[tag=infected.common,tag=!state.dead] minecraft:speed 13 1 true
execute if score @s mother_phase matches 3.. run effect give @a[tag=infected.common,tag=!state.dead] minecraft:strength 13 0 true

playsound minecraft:entity.wither.ambient master @a ~ ~ ~ 1 0.5
tellraw @a {"text":"§4[嚎叫] 母体在召唤！所有感染者获得速度和力量。","color":"dark_red","bold":true}
