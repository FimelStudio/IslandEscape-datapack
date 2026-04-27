
execute if entity @s[tag=state.dead] run return 0
tag @s add state.dead
scoreboard players operation @s mother_respawn = Tunable tunable.mother_respawn_seconds

effect clear @s
execute at @s run summon minecraft:marker ~ ~ ~ {Tags:["entity.dead_anchor"]}
gamemode adventure @s
attribute @s minecraft:movement_speed base set 0
effect give @s minecraft:invisibility 999 0 true
effect give @s minecraft:darkness 999 0 true
effect give @s minecraft:resistance 999 255 true

tellraw @a {"text":"§7信号中断……某处传来了奇怪的沉默。","color":"gray","italic":true}
bossbar set escape_island:mother_respawn visible true
bossbar set escape_island:mother_respawn players @s
execute store result bossbar escape_island:mother_respawn max run scoreboard players get @s mother_respawn
execute store result bossbar escape_island:mother_respawn value run scoreboard players get @s mother_respawn

title @s title {"text":"§4母体倒下","bold":true}
title @s subtitle [{"text":"复活倒计时: ","color":"dark_red"},{"score":{"name":"@s","objective":"mother_respawn"}},{"text":"秒","color":"dark_red"}]
tellraw @s [{"text":"§4你需要 "},{"score":{"name":"@s","objective":"mother_respawn"}},{"text":" 秒复活。","color":"dark_red"}]
