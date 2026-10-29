# 先展示完整快照并汇总贡献，再清理；重复调用不再发放结果。
execute unless score $game ending_triggered matches 1 run return 0
execute if score $game ie.pending_kind matches 0 run return 0
function escape_island:ui/show_v01_result
function escape_island:career/settle
function escape_island:game/cleanup
tellraw @a {"text":"状态已清除。输入 /function escape_island:game/start 再来一局。","color":"gold"}
