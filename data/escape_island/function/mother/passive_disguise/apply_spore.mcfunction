function escape_island:infection/add_spore_load {amount:10}
execute if score @s cd_aura_heartbeat matches ..0 run playsound minecraft:entity.warden.heartbeat player @s ~ ~ ~ 0.15 0.8 1
execute if score @s cd_aura_heartbeat matches ..0 run title @s actionbar {"text":"§8心口像被潮湿的雾压了一下。","color":"dark_gray"}
execute if score @s cd_aura_heartbeat matches ..0 run scoreboard players set @s cd_aura_heartbeat 4
