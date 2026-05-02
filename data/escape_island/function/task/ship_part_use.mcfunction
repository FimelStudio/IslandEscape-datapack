advancement revoke @s only escape_island:interaction/ship_part_use
scoreboard players set @s ship_hold_seen 2

execute unless score $game in_game matches 1 run title @s actionbar {"text":"游戏未开始","color":"red"}
execute unless score $game in_game matches 1 run scoreboard players set @s ship_hold_time 0
execute unless score $game in_game matches 1 run return 0
execute unless score $game cur_phase matches 3 run title @s actionbar {"text":"当前阶段无法修船","color":"red"}
execute unless score $game cur_phase matches 3 run scoreboard players set @s ship_hold_time 0
execute unless score $game cur_phase matches 3 run return 0
execute unless entity @s[tag=team.human,tag=!state.dead,tag=!state.escaped,tag=!state.spectator] run title @s actionbar {"text":"只有幸存者可以投入船舶部件","color":"red"}
execute unless entity @s[tag=team.human,tag=!state.dead,tag=!state.escaped,tag=!state.spectator] run scoreboard players set @s ship_hold_time 0
execute unless entity @s[tag=team.human,tag=!state.dead,tag=!state.escaped,tag=!state.spectator] run return 0
execute unless entity @e[type=minecraft:marker,tag=marker.ship_dock,distance=..3,limit=1] run title @s actionbar {"text":"需要靠近船坞投入部件","color":"yellow"}
execute unless entity @e[type=minecraft:marker,tag=marker.ship_dock,distance=..3,limit=1] run scoreboard players set @s ship_hold_time 0
execute unless entity @e[type=minecraft:marker,tag=marker.ship_dock,distance=..3,limit=1] run return 0
execute if score $game ship_parts >= Tunable tunable.ship_parts_required run title @s actionbar {"text":"船舶部件已集齐，开始修复船体","color":"aqua"}
execute if score $game ship_parts >= Tunable tunable.ship_parts_required run scoreboard players set @s ship_hold_time 0
execute if score $game ship_parts >= Tunable tunable.ship_parts_required run return 0
execute if score Tunable tunable.ship_parts_required matches ..3 if items entity @s weapon.mainhand *[custom_data~{item:"ship_part",part:"starter_battery"}] run title @s actionbar {"text":"本局不需要启动电瓶","color":"yellow"}
execute if score Tunable tunable.ship_parts_required matches ..3 if items entity @s weapon.mainhand *[custom_data~{item:"ship_part",part:"starter_battery"}] run scoreboard players set @s ship_hold_time 0
execute if score Tunable tunable.ship_parts_required matches ..3 if items entity @s weapon.mainhand *[custom_data~{item:"ship_part",part:"starter_battery"}] run return 0
execute if score Tunable tunable.ship_parts_required matches ..3 if items entity @s weapon.offhand *[custom_data~{item:"ship_part",part:"starter_battery"}] run title @s actionbar {"text":"本局不需要启动电瓶","color":"yellow"}
execute if score Tunable tunable.ship_parts_required matches ..3 if items entity @s weapon.offhand *[custom_data~{item:"ship_part",part:"starter_battery"}] run scoreboard players set @s ship_hold_time 0
execute if score Tunable tunable.ship_parts_required matches ..3 if items entity @s weapon.offhand *[custom_data~{item:"ship_part",part:"starter_battery"}] run return 0
execute if score Tunable tunable.ship_parts_required matches ..4 if items entity @s weapon.mainhand *[custom_data~{item:"ship_part",part:"anchor_winch"}] run title @s actionbar {"text":"本局不需要锚机绞盘","color":"yellow"}
execute if score Tunable tunable.ship_parts_required matches ..4 if items entity @s weapon.mainhand *[custom_data~{item:"ship_part",part:"anchor_winch"}] run scoreboard players set @s ship_hold_time 0
execute if score Tunable tunable.ship_parts_required matches ..4 if items entity @s weapon.mainhand *[custom_data~{item:"ship_part",part:"anchor_winch"}] run return 0
execute if score Tunable tunable.ship_parts_required matches ..4 if items entity @s weapon.offhand *[custom_data~{item:"ship_part",part:"anchor_winch"}] run title @s actionbar {"text":"本局不需要锚机绞盘","color":"yellow"}
execute if score Tunable tunable.ship_parts_required matches ..4 if items entity @s weapon.offhand *[custom_data~{item:"ship_part",part:"anchor_winch"}] run scoreboard players set @s ship_hold_time 0
execute if score Tunable tunable.ship_parts_required matches ..4 if items entity @s weapon.offhand *[custom_data~{item:"ship_part",part:"anchor_winch"}] run return 0
execute unless items entity @s weapon.mainhand *[custom_data~{item:"ship_part",part:"propeller"}] unless items entity @s weapon.offhand *[custom_data~{item:"ship_part",part:"propeller"}] unless items entity @s weapon.mainhand *[custom_data~{item:"ship_part",part:"fuel_pump"}] unless items entity @s weapon.offhand *[custom_data~{item:"ship_part",part:"fuel_pump"}] unless items entity @s weapon.mainhand *[custom_data~{item:"ship_part",part:"steering_linkage"}] unless items entity @s weapon.offhand *[custom_data~{item:"ship_part",part:"steering_linkage"}] unless items entity @s weapon.mainhand *[custom_data~{item:"ship_part",part:"starter_battery"}] unless items entity @s weapon.offhand *[custom_data~{item:"ship_part",part:"starter_battery"}] unless items entity @s weapon.mainhand *[custom_data~{item:"ship_part",part:"anchor_winch"}] unless items entity @s weapon.offhand *[custom_data~{item:"ship_part",part:"anchor_winch"}] run title @s actionbar {"text":"未知船舶部件","color":"red"}
execute unless items entity @s weapon.mainhand *[custom_data~{item:"ship_part",part:"propeller"}] unless items entity @s weapon.offhand *[custom_data~{item:"ship_part",part:"propeller"}] unless items entity @s weapon.mainhand *[custom_data~{item:"ship_part",part:"fuel_pump"}] unless items entity @s weapon.offhand *[custom_data~{item:"ship_part",part:"fuel_pump"}] unless items entity @s weapon.mainhand *[custom_data~{item:"ship_part",part:"steering_linkage"}] unless items entity @s weapon.offhand *[custom_data~{item:"ship_part",part:"steering_linkage"}] unless items entity @s weapon.mainhand *[custom_data~{item:"ship_part",part:"starter_battery"}] unless items entity @s weapon.offhand *[custom_data~{item:"ship_part",part:"starter_battery"}] unless items entity @s weapon.mainhand *[custom_data~{item:"ship_part",part:"anchor_winch"}] unless items entity @s weapon.offhand *[custom_data~{item:"ship_part",part:"anchor_winch"}] run scoreboard players set @s ship_hold_time 0
execute unless items entity @s weapon.mainhand *[custom_data~{item:"ship_part",part:"propeller"}] unless items entity @s weapon.offhand *[custom_data~{item:"ship_part",part:"propeller"}] unless items entity @s weapon.mainhand *[custom_data~{item:"ship_part",part:"fuel_pump"}] unless items entity @s weapon.offhand *[custom_data~{item:"ship_part",part:"fuel_pump"}] unless items entity @s weapon.mainhand *[custom_data~{item:"ship_part",part:"steering_linkage"}] unless items entity @s weapon.offhand *[custom_data~{item:"ship_part",part:"steering_linkage"}] unless items entity @s weapon.mainhand *[custom_data~{item:"ship_part",part:"starter_battery"}] unless items entity @s weapon.offhand *[custom_data~{item:"ship_part",part:"starter_battery"}] unless items entity @s weapon.mainhand *[custom_data~{item:"ship_part",part:"anchor_winch"}] unless items entity @s weapon.offhand *[custom_data~{item:"ship_part",part:"anchor_winch"}] run return 0

scoreboard players add @s ship_hold_time 1
title @s actionbar [{"text":"投入船舶部件 ","color":"aqua"},{"score":{"name":"@s","objective":"ship_hold_time"}},{"text":"/20","color":"aqua"}]
execute if score @s ship_hold_time matches 10 run playsound minecraft:block.chain.hit player @s ~ ~ ~ 0.6 1.2
execute unless score @s ship_hold_time matches 20.. run return 0

execute if items entity @s weapon.mainhand *[custom_data~{item:"ship_part",part:"propeller"}] run function escape_island:task/ship_part_submit_propeller
execute if score @s ship_hold_time matches 0 run return 0
execute if items entity @s weapon.offhand *[custom_data~{item:"ship_part",part:"propeller"}] run function escape_island:task/ship_part_submit_propeller
execute if score @s ship_hold_time matches 0 run return 0
execute if items entity @s weapon.mainhand *[custom_data~{item:"ship_part",part:"fuel_pump"}] run function escape_island:task/ship_part_submit_fuel_pump
execute if score @s ship_hold_time matches 0 run return 0
execute if items entity @s weapon.offhand *[custom_data~{item:"ship_part",part:"fuel_pump"}] run function escape_island:task/ship_part_submit_fuel_pump
execute if score @s ship_hold_time matches 0 run return 0
execute if items entity @s weapon.mainhand *[custom_data~{item:"ship_part",part:"steering_linkage"}] run function escape_island:task/ship_part_submit_steering_linkage
execute if score @s ship_hold_time matches 0 run return 0
execute if items entity @s weapon.offhand *[custom_data~{item:"ship_part",part:"steering_linkage"}] run function escape_island:task/ship_part_submit_steering_linkage
execute if score @s ship_hold_time matches 0 run return 0
execute if items entity @s weapon.mainhand *[custom_data~{item:"ship_part",part:"starter_battery"}] run function escape_island:task/ship_part_submit_starter_battery
execute if score @s ship_hold_time matches 0 run return 0
execute if items entity @s weapon.offhand *[custom_data~{item:"ship_part",part:"starter_battery"}] run function escape_island:task/ship_part_submit_starter_battery
execute if score @s ship_hold_time matches 0 run return 0
execute if items entity @s weapon.mainhand *[custom_data~{item:"ship_part",part:"anchor_winch"}] run function escape_island:task/ship_part_submit_anchor_winch
execute if score @s ship_hold_time matches 0 run return 0
execute if items entity @s weapon.offhand *[custom_data~{item:"ship_part",part:"anchor_winch"}] run function escape_island:task/ship_part_submit_anchor_winch
