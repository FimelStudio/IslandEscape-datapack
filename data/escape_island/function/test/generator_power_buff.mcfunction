# Prepare environment and trigger generator completion to test global power buff
scoreboard players set $game power_buff 0
function escape_island:test/generator_setup
# Inform player
tellraw @s {"text":"[自测] 正在触发发电机完成测试...","color":"gold"}
# Trigger completion logic (this will set gen_done and activate power_buff)
function escape_island:task/generator_complete
# Report result
execute if score $game power_buff matches 1.. run tellraw @s {"text":"[自测] power_buff 已激活：全图修复速率应被放大","color":"green"}
execute unless score $game power_buff matches 1.. run tellraw @s {"text":"[自测] power_buff 未激活：请检查 generator_complete 或 tunable 设置","color":"red"}
