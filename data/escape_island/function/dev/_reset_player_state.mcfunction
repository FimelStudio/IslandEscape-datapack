# 开发场景显式加入训练；不依靠残留职业自动启动调度。
function escape_island:player/reset
tag @s add state.training
tag @s add ie.active
scoreboard players operation @s ie.session = $game ie.match_id
