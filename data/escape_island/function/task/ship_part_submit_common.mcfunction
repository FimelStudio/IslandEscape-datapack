scoreboard players set @s ship_hold_time 0
bossbar set escape_island:ship name {"text":"轮船部件","color":"aqua"}
bossbar set escape_island:ship visible true
bossbar set escape_island:ship players @a
execute store result bossbar escape_island:ship max run scoreboard players get Tunable tunable.ship_parts_required
execute store result bossbar escape_island:ship value run scoreboard players get $game ship_parts
title @s actionbar [{"text":"已投入船舶部件 ","color":"aqua"},{"score":{"name":"$game","objective":"ship_parts"}},{"text":"/","color":"aqua"},{"score":{"name":"Tunable","objective":"tunable.ship_parts_required"}}]
playsound minecraft:block.chain.place player @s ~ ~ ~ 0.8 1.2
execute if score $game ship_parts >= Tunable tunable.ship_parts_required run tellraw @a {"text":"§b[轮船] 所需船舶部件已集齐，站在船坞附近修复船体！","color":"aqua"}
execute if score $game ship_parts >= Tunable tunable.ship_parts_required run playsound minecraft:block.bell.use master @a ~ ~ ~ 0.8 1.2
