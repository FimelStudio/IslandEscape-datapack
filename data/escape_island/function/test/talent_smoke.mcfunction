function escape_island:talent/clear
function escape_island:talent/pick_core_breakaway
function escape_island:talent/pick_branch_repair
function escape_island:talent/pick_branch_info
function escape_island:talent/random_fate
scoreboard players set @s talent_exhaustion 45
scoreboard players set @s talent_rescue_cd 120
scoreboard players set @s talent_info_cd 90
function escape_island:talent/show
tellraw @s {"text":"[TEST] 天赋选择、命运牌和三类冷却已写入。","color":"green"}
