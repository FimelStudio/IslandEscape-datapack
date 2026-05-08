execute unless score $game gs_active matches 1 run return 0
scoreboard players set $game gs_active 0
execute as @a[tag=gs.player,scores={gs_lives=1..}] run scoreboard players add @s gs_score 20
tellraw @a [{"text":"[Last Stand] 结束。胜者: ","color":"gold"},{"selector":"@a[tag=gs.player,scores={gs_lives=1..},limit=1]"}]
function escape_island:gunfight/cleanup
