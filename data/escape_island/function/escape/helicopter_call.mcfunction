# escape_island:escape/helicopter_call  —  signal tower + generator complete; helicopter en route
scoreboard players set $game heli_countdown 1800

bossbar set escape_island:heli visible true
bossbar set escape_island:heli players @a
bossbar set escape_island:heli max 1800
bossbar set escape_island:heli value 1800

# Pick random heli_pad marker and broadcast location
function escape_island:escape/helicopter_pick_landing

tellraw @a {"text":"§6[直升机] 已呼叫！1:30 后降落。地点已广播。","color":"gold"}
playsound minecraft:entity.ender_dragon.flap master @a ~ ~ ~ 1 0.4

function escape_island:game/phase_4_escape
