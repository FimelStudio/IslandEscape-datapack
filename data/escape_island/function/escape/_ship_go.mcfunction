execute as @a[tag=state.boarding,tag=infected.common] run function escape_island:escape/boarding_convert_kick
execute as @a[tag=state.boarding,tag=!state.escaped] run function escape_island:escape/boarding_check
function escape_island:util/recount_escaped
scoreboard players set $game ship_countdown 0
bossbar set escape_island:ship visible false
kill @e[type=minecraft:interaction,tag=entity.ship_door]
kill @e[tag=entity.ship_door_hint]
tellraw @a {"text":"[轮船] 缆绳解开，海风号正在离港。","color":"aqua"}
playsound minecraft:entity.boat.paddle_water master @a ~ ~ ~ 1 0.8
execute unless score $game ending_triggered matches 1.. unless score $game escape_route matches 1.. run scoreboard players set $game escape_route 2
function escape_island:escape/_ending_resolve
