execute at @s run tellraw @a[tag=team.human,tag=!state.dead,distance=..24] {"text":"[通讯噪声] 电台杂讯爆发，频道读数出现漂移……","color":"yellow","italic":true}
execute at @s run tellraw @a[tag=team.human,tag=!state.dead,distance=..24] {"text":"[提示] 当前异常提示可能包含噪声。","color":"gray"}
execute at @s run playsound minecraft:block.sculk_sensor.clicking master @a[distance=..24] ~ ~ ~ 0.7 0.7

execute at @s as @e[type=minecraft:marker,tag=scan.station,distance=..24] run scoreboard players operation @s scan_station_cd += #station_jam skill.radio_jam_cfg
execute at @s as @e[type=minecraft:marker,tag=scan.station,distance=..24,scores={scan_active=1..}] run function escape_island:scan/cancel

scoreboard players operation @s skill.radio_jam_cd = #cooldown skill.radio_jam_cfg
function skill:radio/jam/update_item

tellraw @s {"text":"§5污染干扰器已释放：附近扫描站被干扰。","color":"dark_purple"}
