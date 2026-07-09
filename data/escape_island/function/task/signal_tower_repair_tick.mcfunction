execute if entity @a[tag=infected.common,tag=!state.dead,distance=..2.5,limit=1] run title @a[tag=team.human,distance=..2.5] actionbar {"text":"感染者压制中……","color":"red"}
execute if entity @a[tag=infected.common,tag=!state.dead,distance=..2.5,limit=1] run scoreboard players set @s signal_repair_acc 0
execute if entity @a[tag=infected.common,tag=!state.dead,distance=..2.5,limit=1] run return 0
execute if entity @a[tag=infected.mother,tag=!state.dead,tag=state.hunting,distance=..2.5,limit=1] run title @a[tag=team.human,distance=..2.5] actionbar {"text":"母体压制中……","color":"dark_red"}
execute if entity @a[tag=infected.mother,tag=!state.dead,tag=state.hunting,distance=..2.5,limit=1] run scoreboard players set @s signal_repair_acc 0
execute if entity @a[tag=infected.mother,tag=!state.dead,tag=state.hunting,distance=..2.5,limit=1] run return 0

scoreboard players operation $sig_p signal_progress = @s signal_players

# 每秒把本地修复量换算为百分之一进度，累积满 100 才给信号塔 +1。
scoreboard players operation $signal_delta signal_progress = $const_1000 signal_progress
execute if entity @s[tag=marker.signal_core] run scoreboard players operation $signal_delta signal_progress /= Tunable tunable.signal_core_tick_seconds
execute unless entity @s[tag=marker.signal_core] run scoreboard players operation $signal_delta signal_progress /= Tunable tunable.signal_side_tick_seconds

execute if score $sig_p signal_progress matches 1 run scoreboard players operation $signal_delta signal_progress *= Tunable tunable.signal_team_cap_1p
execute if score $sig_p signal_progress matches 2 run scoreboard players operation $signal_delta signal_progress *= Tunable tunable.signal_team_cap_2p
execute if score $sig_p signal_progress matches 3 run scoreboard players operation $signal_delta signal_progress *= Tunable tunable.signal_team_cap_3p
execute if score $sig_p signal_progress matches 4.. run scoreboard players operation $signal_delta signal_progress *= Tunable tunable.signal_team_cap_4p
scoreboard players operation $signal_delta signal_progress /= Tunable tunable.signal_team_cap_1p

execute if entity @a[tag=state.infected_period,distance=..2.5,limit=1] run scoreboard players operation $signal_delta signal_progress /= $const_2 spore_load


# 发电机奖励：修复贡献乘以百分比倍率
execute if score $game power_buff matches 1.. run scoreboard players operation $signal_delta signal_progress *= Tunable tunable.power_buff_multiplier
execute if score $game power_buff matches 1.. run scoreboard players operation $signal_delta signal_progress /= $const_10 signal_progress

# 伪装母体侵蚀光环：靠近修复点时降低修复贡献
execute if entity @a[tag=infected.mother,tag=!state.dead,tag=!state.hunting,tag=!state.disguised,distance=..3,limit=1] run scoreboard players operation $signal_delta signal_progress *= $const_17 signal_progress
execute if entity @a[tag=infected.mother,tag=!state.dead,tag=!state.hunting,tag=!state.disguised,distance=..3,limit=1] run scoreboard players operation $signal_delta signal_progress /= $const_20 signal_progress

scoreboard players operation @s signal_repair_acc += $signal_delta signal_progress
execute if score @s signal_repair_acc matches 100.. run scoreboard players add @s signal_local 1
execute if score @s signal_repair_acc matches 100.. run scoreboard players remove @s signal_repair_acc 100
execute if score @s signal_repair_acc matches 100.. run scoreboard players add @s signal_local 1
execute if score @s signal_repair_acc matches 100.. run scoreboard players remove @s signal_repair_acc 100

scoreboard players operation $signal_show signal_progress = @s signal_local
execute if entity @s[tag=marker.signal_core] run title @a[tag=team.human,distance=..2.5] actionbar [{"text":"修复核心塔中 ","color":"gold"},{"score":{"name":"$signal_show","objective":"signal_progress"}},{"text":"/100","color":"gold"}]
execute unless entity @s[tag=marker.signal_core] run title @a[tag=team.human,distance=..2.5] actionbar [{"text":"修复中 ","color":"yellow"},{"score":{"name":"$signal_show","objective":"signal_progress"}},{"text":"/100","color":"yellow"}]
execute if entity @a[tag=infected.mother,tag=!state.dead,tag=!state.hunting,tag=!state.disguised,distance=..3,limit=1] as @a[tag=team.human,tag=!state.dead,distance=..2.5] at @s if score @s cd_aura_heartbeat matches ..0 run playsound minecraft:entity.warden.heartbeat player @s ~ ~ ~ 0.15 0.8 1
execute if entity @a[tag=infected.mother,tag=!state.dead,tag=!state.hunting,tag=!state.disguised,distance=..3,limit=1] as @a[tag=team.human,tag=!state.dead,distance=..2.5] if score @s cd_aura_notice matches ..0 run title @s actionbar {"text":"信号受污染","color":"dark_gray"}
execute if entity @a[tag=infected.mother,tag=!state.dead,tag=!state.hunting,tag=!state.disguised,distance=..3,limit=1] as @a[tag=team.human,tag=!state.dead,distance=..2.5] if score @s cd_aura_heartbeat matches ..0 run scoreboard players set @s cd_aura_heartbeat 4
execute if entity @a[tag=infected.mother,tag=!state.dead,tag=!state.hunting,tag=!state.disguised,distance=..3,limit=1] as @a[tag=team.human,tag=!state.dead,distance=..2.5] if score @s cd_aura_notice matches ..0 run scoreboard players set @s cd_aura_notice 12

execute if score @s signal_local matches 100.. run function escape_island:task/signal_tower_complete
