execute if score @s range_score > @s range_best run scoreboard players operation @s range_best = @s range_score
tellraw @a [{"text":"[训练场] ","color":"gold"},{"selector":"@s"},{"text":" 退出，得分 "},{"score":{"name":"@s","objective":"range_score"}},{"text":"，最佳 "},{"score":{"name":"@s","objective":"range_best"}}]
tag @s remove range.active
function escape_island:range/cleanup
gamemode adventure @s
