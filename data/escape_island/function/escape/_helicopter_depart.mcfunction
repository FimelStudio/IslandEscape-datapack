execute as @a[tag=state.boarding,tag=!state.escaped] run function escape_island:escape/boarding_check

function escape_island:util/recount_escaped

scoreboard players set $game heli_countdown 0
scoreboard players set $game heli_motion 201
bossbar set escape_island:heli visible false
kill @e[type=minecraft:interaction,tag=entity.helicopter_door]
kill @e[tag=entity.helicopter_door_hint]
tellraw @a {"text":"[直升机] 舱门关闭，正在起飞。","color":"gold"}
playsound minecraft:entity.ender_dragon.flap master @a ~ ~ ~ 1 0.8
