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

execute as @a[tag=team.human,tag=!state.dead,tag=!state.escaped,tag=!state.spectator,tag=!infected.mother] at @s if entity @e[tag=marker.ship_dock,distance=..3] run scoreboard players add $ship_delta ship_progress 1
execute if score $game ship_bonus_tick matches 0 as @a[tag=team.human,tag=role.engineer,tag=!state.dead,tag=!state.escaped,tag=!state.spectator] at @s if entity @e[tag=marker.ship_dock,distance=..3] run scoreboard players add $ship_delta ship_progress 1
execute if score $game ship_bonus_tick matches 2 as @a[tag=team.human,tag=role.engineer,tag=!state.dead,tag=!state.escaped,tag=!state.spectator] at @s if entity @e[tag=marker.ship_dock,distance=..3] run scoreboard players add $ship_delta ship_progress 1
execute if score $game ship_bonus_tick matches 4 as @a[tag=team.human,tag=role.engineer,tag=!state.dead,tag=!state.escaped,tag=!state.spectator] at @s if entity @e[tag=marker.ship_dock,distance=..3] run scoreboard players add $ship_delta ship_progress 1
execute if score $game ship_bonus_tick matches 6 as @a[tag=team.human,tag=role.engineer,tag=!state.dead,tag=!state.escaped,tag=!state.spectator] at @s if entity @e[tag=marker.ship_dock,distance=..3] run scoreboard players add $ship_delta ship_progress 1
execute if score $game ship_bonus_tick matches 8 as @a[tag=team.human,tag=role.engineer,tag=!state.dead,tag=!state.escaped,tag=!state.spectator] at @s if entity @e[tag=marker.ship_dock,distance=..3] run scoreboard players add $ship_delta ship_progress 1
execute if score $game ship_bonus_tick matches 0 as @a[tag=team.human,tag=role.mechanic,tag=!state.dead,tag=!state.escaped,tag=!state.spectator] at @s if entity @e[tag=marker.ship_dock,distance=..3] run scoreboard players add $ship_delta ship_progress 1
execute if score $game ship_bonus_tick matches 3 as @a[tag=team.human,tag=role.mechanic,tag=!state.dead,tag=!state.escaped,tag=!state.spectator] at @s if entity @e[tag=marker.ship_dock,distance=..3] run scoreboard players add $ship_delta ship_progress 1
execute if score $game ship_bonus_tick matches 6 as @a[tag=team.human,tag=role.mechanic,tag=!state.dead,tag=!state.escaped,tag=!state.spectator] at @s if entity @e[tag=marker.ship_dock,distance=..3] run scoreboard players add $ship_delta ship_progress 1
execute at @e[type=minecraft:marker,tag=marker.ship_dock,sort=nearest,limit=1] if entity @a[tag=team.human,tag=!state.dead,tag=!state.escaped,tag=!state.spectator,distance=..3] if entity @e[type=minecraft:marker,tag=entity.engineer_battery,distance=..4,limit=1] run scoreboard players add $ship_delta ship_progress 2

execute if score $ship_delta ship_progress matches 5.. run scoreboard players set $ship_delta ship_progress 4
scoreboard players operation $game ship_progress += $ship_delta ship_progress
execute as @a[tag=infected.common,tag=!state.dead,tag=!state.escaped,tag=!state.spectator] at @s if entity @e[tag=marker.ship_dock,distance=..3] run scoreboard players remove $game ship_progress 1
execute as @a[tag=infected.mother,tag=!state.dead,tag=!state.escaped,tag=!state.spectator] at @s if entity @e[tag=marker.ship_dock,distance=..3] run scoreboard players remove $game ship_progress 2

execute if score $game ship_progress matches ..-1 run scoreboard players set $game ship_progress 0
execute if score $game ship_progress matches 101.. run scoreboard players set $game ship_progress 100

bossbar set escape_island:ship name {"text":"轮船修复进度","color":"aqua"}
bossbar set escape_island:ship max 100
execute if score $game ship_progress matches 1.. run bossbar set escape_island:ship visible true
execute if score $game ship_progress matches 1.. run bossbar set escape_island:ship players @a
execute store result bossbar escape_island:ship value run scoreboard players get $game ship_progress

execute if score $game ship_progress matches 100.. run function escape_island:escape/ship_depart
