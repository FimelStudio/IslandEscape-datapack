execute if score @s range_score > @s range_best run scoreboard players operation @s range_best = @s range_score
tellraw @s [{"text":"[训练场结算] 得分 ","color":"gold"},{"score":{"name":"@s","objective":"range_score"}},{"text":"，命中 "},{"score":{"name":"@s","objective":"range_hits"}},{"text":"/"},{"score":{"name":"@s","objective":"range_shots"}},{"text":"，最佳 "},{"score":{"name":"@s","objective":"range_best"}}]
scoreboard players set @s range_mode 0
scoreboard players set @s range_timer 0
scoreboard players set @s range_lives 3
bossbar set escape_island:range_timer visible false
bossbar set escape_island:range_timer players
