# 准备环境并触发发电机完成，用于测试全图修复加成
scoreboard players set $game power_buff 0
function escape_island:test/generator_setup
# 提示测试开始
tellraw @s {"text":"[自测] 正在触发发电机完成测试...","color":"gold"}
# 触发完成逻辑：设置 gen_done 并激活 power_buff
function escape_island:task/generator_complete
# 输出结果
execute if score $game power_buff matches 1.. run tellraw @s {"text":"[自测] power_buff 已激活：全图修复速率应被放大","color":"green"}
execute unless score $game power_buff matches 1.. run tellraw @s {"text":"[自测] power_buff 未激活：请检查 generator_complete 或 tunable 设置","color":"red"}
