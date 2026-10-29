execute if score $game cur_phase matches 4.. unless score $game ship_countdown matches 1.. run bossbar set escape_island:ship visible false
execute if score $game cur_phase matches 4.. run return 0

execute unless score $game ship_parts >= Tunable tunable.ship_parts_required run bossbar set escape_island:ship name {"text":"轮船部件","color":"aqua"}
execute unless score $game ship_parts >= Tunable tunable.ship_parts_required run execute store result bossbar escape_island:ship max run scoreboard players get Tunable tunable.ship_parts_required
execute unless score $game ship_parts >= Tunable tunable.ship_parts_required run execute store result bossbar escape_island:ship value run scoreboard players get $game ship_parts
execute if score $game ship_parts matches 1.. unless score $game ship_parts >= Tunable tunable.ship_parts_required run bossbar set escape_island:ship visible true
execute if score $game ship_parts matches 1.. unless score $game ship_parts >= Tunable tunable.ship_parts_required run bossbar set escape_island:ship players @a
execute unless score $game ship_parts >= Tunable tunable.ship_parts_required run return 0

scoreboard players add $game ship_bonus_tick 1
execute if score $game ship_bonus_tick matches 10.. run scoreboard players set $game ship_bonus_tick 0
scoreboard players set $ship_delta ship_progress 0
scoreboard players set $ship_count ship_progress 0

execute as @a[tag=ie.active,tag=team.human,tag=!state.dead,tag=!state.escaped,tag=!state.spectator,tag=!infected.mother] at @s if entity @e[tag=marker.ship_dock,distance=..3] run scoreboard players add $ship_count ship_progress 1

execute if score $ship_count ship_progress matches 0 run scoreboard players set $ship_delta ship_progress 0
execute if score $ship_count ship_progress matches 1 run scoreboard players set $ship_delta ship_progress 1
execute if score $ship_count ship_progress matches 2 run scoreboard players set $ship_delta ship_progress 1
execute if score $ship_count ship_progress matches 2 if score $game ship_bonus_tick matches 0..5 run scoreboard players set $ship_delta ship_progress 2
execute if score $ship_count ship_progress matches 3 run scoreboard players set $ship_delta ship_progress 2
execute if score $ship_count ship_progress matches 3 if score $game ship_bonus_tick matches 0..0 run scoreboard players set $ship_delta ship_progress 3
execute if score $ship_count ship_progress matches 4.. run scoreboard players set $ship_delta ship_progress 2
execute if score $ship_count ship_progress matches 4.. if score $game ship_bonus_tick matches 0..4 run scoreboard players set $ship_delta ship_progress 3

execute if score $ship_count ship_progress matches 1.. unless score $ship_delta ship_progress matches 3 as @e[type=minecraft:marker,tag=marker.ship_dock,limit=1] at @s if entity @a[tag=ie.active,tag=team.human,tag=role.engineer,tag=!state.dead,tag=!state.escaped,tag=!state.spectator,tag=!infected.mother,distance=..3,limit=1] if score $game ship_bonus_tick matches 0..2 run scoreboard players add $ship_delta ship_progress 1
execute if score $ship_count ship_progress matches 1.. unless score $ship_delta ship_progress matches 3 as @e[type=minecraft:marker,tag=marker.ship_dock,limit=1] at @s if entity @a[tag=ie.active,tag=team.human,tag=role.mechanic,tag=!state.dead,tag=!state.escaped,tag=!state.spectator,tag=!infected.mother,distance=..3,limit=1] if score $game ship_bonus_tick matches 3..5 run scoreboard players add $ship_delta ship_progress 1
execute if score $ship_count ship_progress matches 1.. unless score $ship_delta ship_progress matches 3 as @e[type=minecraft:marker,tag=marker.ship_dock,limit=1] at @s if entity @e[type=minecraft:marker,tag=entity.engineer_battery,tag=skill.battery.active,distance=..4,limit=1] if score $game ship_bonus_tick matches 6..7 run scoreboard players add $ship_delta ship_progress 1

execute as @e[type=minecraft:marker,tag=marker.ship_dock,limit=1] at @s if entity @a[tag=ie.active,tag=infected.common,tag=!state.dead,tag=!state.escaped,distance=..3,limit=1] if score $game ship_bonus_tick matches 0..4 run scoreboard players set $ship_delta ship_progress -1
execute as @e[type=minecraft:marker,tag=marker.ship_dock,limit=1] at @s if entity @a[tag=ie.active,tag=infected.mother,tag=state.hunting,tag=!state.dead,tag=!state.escaped,distance=..3,limit=1] run scoreboard players set $ship_delta ship_progress -1

# 发电机奖励：用累计误差给轮船整数进度补足约 1.2 倍
execute if score $game power_buff matches 1.. if score $ship_delta ship_progress matches 1.. run scoreboard players operation $ship_power ship_progress = $ship_delta ship_progress
execute if score $game power_buff matches 1.. if score $ship_delta ship_progress matches 1.. run scoreboard players operation $ship_power ship_progress *= $const_2 ship_progress
execute if score $game power_buff matches 1.. if score $ship_delta ship_progress matches 1.. run scoreboard players operation $game power_buff_acc += $ship_power ship_progress
execute if score $game power_buff matches 1.. if score $game power_buff_acc matches 10.. run scoreboard players add $ship_delta ship_progress 1
execute if score $game power_buff matches 1.. if score $game power_buff_acc matches 10.. run scoreboard players remove $game power_buff_acc 10

# 伪装母体侵蚀光环：用累计误差近似 0.85 倍，避免 1 点贡献直接被整除为 0
execute if score $ship_delta ship_progress matches 1.. as @e[type=minecraft:marker,tag=marker.ship_dock] at @s if entity @a[tag=ie.active,tag=infected.mother,tag=!state.dead,tag=!state.hunting,tag=!state.disguised,distance=..3,limit=1] run scoreboard players operation $ship_aura_loss ship_progress = $ship_delta ship_progress
execute if score $ship_delta ship_progress matches 1.. as @e[type=minecraft:marker,tag=marker.ship_dock] at @s if entity @a[tag=ie.active,tag=infected.mother,tag=!state.dead,tag=!state.hunting,tag=!state.disguised,distance=..3,limit=1] run scoreboard players operation $ship_aura_loss ship_progress *= $const_15 signal_progress
execute if score $ship_delta ship_progress matches 1.. as @e[type=minecraft:marker,tag=marker.ship_dock] at @s if entity @a[tag=ie.active,tag=infected.mother,tag=!state.dead,tag=!state.hunting,tag=!state.disguised,distance=..3,limit=1] run scoreboard players operation $game ship_aura_acc += $ship_aura_loss ship_progress
execute if score $ship_delta ship_progress matches 1.. if score $game ship_aura_acc matches 100.. run scoreboard players remove $ship_delta ship_progress 1
execute if score $game ship_aura_acc matches 100.. run scoreboard players remove $game ship_aura_acc 100

scoreboard players operation $game ship_progress += $ship_delta ship_progress

execute if score $game ship_progress matches ..-1 run scoreboard players set $game ship_progress 0
execute if score $game ship_progress matches 101.. run scoreboard players set $game ship_progress 100

bossbar set escape_island:ship name {"text":"轮船修复进度","color":"aqua"}
bossbar set escape_island:ship max 100
execute if score $game ship_progress matches 1.. run bossbar set escape_island:ship visible true
execute if score $game ship_progress matches 1.. run bossbar set escape_island:ship players @a
execute store result bossbar escape_island:ship value run scoreboard players get $game ship_progress
execute as @e[type=minecraft:marker,tag=marker.ship_dock] at @s if entity @a[tag=ie.active,tag=infected.mother,tag=!state.dead,tag=!state.hunting,tag=!state.disguised,distance=..3,limit=1] as @a[tag=ie.active,tag=team.human,tag=!state.dead,distance=..3] at @s if score @s cd_aura_heartbeat matches ..0 run playsound minecraft:entity.warden.heartbeat player @s ~ ~ ~ 0.15 0.8 1
execute as @e[type=minecraft:marker,tag=marker.ship_dock] at @s if entity @a[tag=ie.active,tag=infected.mother,tag=!state.dead,tag=!state.hunting,tag=!state.disguised,distance=..3,limit=1] as @a[tag=ie.active,tag=team.human,tag=!state.dead,distance=..3] if score @s cd_aura_notice matches ..0 run title @s actionbar {"text":"信号受污染","color":"dark_gray"}
execute as @e[type=minecraft:marker,tag=marker.ship_dock] at @s if entity @a[tag=ie.active,tag=infected.mother,tag=!state.dead,tag=!state.hunting,tag=!state.disguised,distance=..3,limit=1] as @a[tag=ie.active,tag=team.human,tag=!state.dead,distance=..3] if score @s cd_aura_heartbeat matches ..0 run scoreboard players set @s cd_aura_heartbeat 4
execute as @e[type=minecraft:marker,tag=marker.ship_dock] at @s if entity @a[tag=ie.active,tag=infected.mother,tag=!state.dead,tag=!state.hunting,tag=!state.disguised,distance=..3,limit=1] as @a[tag=ie.active,tag=team.human,tag=!state.dead,distance=..3] if score @s cd_aura_notice matches ..0 run scoreboard players set @s cd_aura_notice 12

execute if score $game ship_progress matches 100.. run function escape_island:escape/ship_depart
