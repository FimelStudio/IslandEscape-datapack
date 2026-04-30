bossbar set escape_island:gen max 60
execute store result bossbar escape_island:gen value run scoreboard players get @s gen_countdown

execute if score @s gen_overload matches ..0 run scoreboard players set @s gen_overload 0

execute unless entity @s[tag=gen.sabotaged] run scoreboard players remove @s gen_countdown 1
execute as @a[distance=..4] run title @s actionbar [{"text":"发电机稳定 ","color":"green"},{"score":{"name":"@e[type=minecraft:marker,tag=marker.generator,sort=nearest,limit=1]","objective":"gen_countdown"}},{"text":"秒 | 过载 ","color":"yellow"},{"score":{"name":"@e[type=minecraft:marker,tag=marker.generator,sort=nearest,limit=1]","objective":"gen_overload"}},{"text":"/20","color":"yellow"}]
execute if entity @s[tag=gen.sabotaged] as @a[distance=..4] run title @s actionbar [{"text":"发电机被破坏中 | 过载 ","color":"red"},{"score":{"name":"@e[type=minecraft:marker,tag=marker.generator,sort=nearest,limit=1]","objective":"gen_overload"}},{"text":"/20","color":"red"}]
tag @s remove gen.sabotaged

execute if score @s gen_overload matches 20.. run function escape_island:task/generator_stall
execute if score @s gen_countdown matches ..0 run function escape_island:task/generator_complete
