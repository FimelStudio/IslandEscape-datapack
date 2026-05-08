execute unless score $game gs_active matches 1 run return 0
scoreboard players remove @a[tag=gs.player,scores={gs_invuln=1..}] gs_invuln 1
scoreboard players remove @a[tag=gs.player,scores={gs_respawn=1..}] gs_respawn 1
execute as @a[tag=gs.player,scores={gs_invuln=1..}] run effect give @s minecraft:resistance 2 255 true
execute as @a[tag=gs.player,scores={gs_respawn=0},tag=gs.dead] run function escape_island:gunfight/respawn
execute as @a[tag=gs.player] run title @s actionbar [{"text":"LS 分数 ","color":"red"},{"score":{"name":"@s","objective":"gs_score"}},{"text":" 命 "},{"score":{"name":"@s","objective":"gs_lives"}}]
execute if entity @a[tag=gs.player,scores={gs_lives=1..},limit=1] unless entity @a[tag=gs.player,scores={gs_lives=1..},limit=2] run function escape_island:gunfight/end
