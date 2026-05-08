execute if score $game ending_triggered matches 1.. run return 0
scoreboard players set $game in_game 0
scoreboard players set $game ending_triggered 1

tellraw @a {"text":"[ 结局 4 ] §4§l毁灭岛屿§r — 孢子炸弹引爆，岛屿与所有感染体一同沉没。","color":"dark_red"}
function escape_island:util/recount_escaped
execute if score $game escaped_count matches 1.. run tellraw @a [{"text":"§6结果：Real Ending。","color":"gold","bold":true},{"score":{"name":"$game","objective":"escaped_count"}},{"text":" 名幸存者带着证据离开，病毒源被摧毁。","color":"gold"}]
execute if score $game escaped_count matches 0 run tellraw @a {"text":"§e结果：牺牲真结局。无人撤离，但病毒源已被摧毁。","color":"yellow"}
playsound minecraft:entity.generic.explode master @a ~ ~ ~ 2 0.5

function escape_island:game/settle
