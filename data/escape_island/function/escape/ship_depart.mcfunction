# Ship fully repaired — 30s boarding countdown
execute if score $game cur_phase matches 4 run return 0

scoreboard players set $game ship_countdown 600
bossbar set escape_island:ship visible true
bossbar set escape_island:ship players @a
bossbar set escape_island:ship max 600

tellraw @a {"text":"§b[轮船] 修复完成！30 秒后离港。快上船！","color":"aqua"}
playsound minecraft:block.bell.use master @a ~ ~ ~ 1 0.5
function escape_island:game/phase_4_escape

schedule function escape_island:escape/_ship_go 600t
