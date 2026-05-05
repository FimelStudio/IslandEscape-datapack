scoreboard players operation $game heli_countdown = Tunable tunable.helicopter_countdown
execute if score $game gen_done matches 1 run scoreboard players remove $game heli_countdown 15

function escape_island:escape/helicopter_cleanup

bossbar set escape_island:heli name {"text":"直升机倒计时","color":"gold"}
bossbar set escape_island:signal visible false
bossbar set escape_island:gen visible false
bossbar set escape_island:ship visible false
bossbar set escape_island:sub visible false
scoreboard players set $game ship_progress 0
function escape_island:task/ship_reset_parts
scoreboard players set $game ship_countdown 0
bossbar set escape_island:heli visible true
bossbar set escape_island:heli players @a
execute store result bossbar escape_island:heli max run scoreboard players get $game heli_countdown
execute store result bossbar escape_island:heli value run scoreboard players get $game heli_countdown

tellraw @a {"text":"天边开始发白，直升机正在靠近……","color":"gold","italic":true}

execute if entity @e[type=minecraft:marker,tag=marker.heli_pad,limit=1] run function escape_island:escape/helicopter_pick_landing
execute unless entity @e[type=minecraft:marker,tag=marker.heli_pad,limit=1] run tellraw @a {"text":"[直升机] 未找到 marker.heli_pad，无法选择降落点。","color":"red"}

tellraw @a [{"text":"[直升机] 已呼叫！约 ","color":"gold"},{"score":{"name":"$game","objective":"heli_countdown"}},{"text":" 秒后降落。地点已广播。","color":"gold"}]
playsound minecraft:entity.ender_dragon.flap master @a ~ ~ ~ 1 0.4

function escape_island:game/phase_4_escape
