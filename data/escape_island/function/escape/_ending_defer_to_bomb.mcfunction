scoreboard players set $game ie.evac_ready 0
scoreboard players set $game heli_countdown 0
scoreboard players set $game heli_motion 0
scoreboard players set $game ship_countdown 0
scoreboard players set $game sub_countdown 0
bossbar set escape_island:heli visible false
bossbar set escape_island:ship visible false
bossbar set escape_island:sub visible false
bossbar set escape_island:bomb visible true
bossbar set escape_island:bomb players @a
execute store result bossbar escape_island:bomb value run scoreboard players get $game bomb_countdown
tellraw @a [{"text":"[撤离] ","color":"gold","bold":true},{"score":{"name":"$game","objective":"escaped_count"}},{"text":" 名幸存者已离岛；自爆倒计时继续，最终结局等待引爆。","color":"gold"}]
