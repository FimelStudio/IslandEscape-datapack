scoreboard players add @s mother_phase 1
scoreboard players set @s mother_phase_timer 0

execute if score @s mother_phase matches 2 run attribute @s minecraft:max_health base set 90
execute if score @s mother_phase matches 2 run effect give @s minecraft:instant_health 1 10 true
execute if score @s mother_phase matches 2 run tellraw @s {"text":"[ 母体进化 ] 第二阶段 —— 90HP，更强大的生命值。","color":"dark_red","bold":true}
execute if score @s mother_phase matches 2 run playsound minecraft:entity.warden.heartbeat player @s ~ ~ ~ 1 0.8

execute if score @s mother_phase matches 3 run attribute @s minecraft:max_health base set 100
execute if score @s mother_phase matches 3 run effect give @s minecraft:instant_health 1 10 true
execute if score @s mother_phase matches 3 run tellraw @s {"text":"[ 母体进化 ] 最终阶段 —— 100HP，完全觉醒。","color":"dark_red","bold":true}
execute if score @s mother_phase matches 3 run playsound minecraft:entity.warden.roar player @s ~ ~ ~ 1 0.7
execute if score @s mother_phase matches 3 run tellraw @a {"text":"§4那东西……已经彻底醒过来了。","color":"dark_red","italic":true}
