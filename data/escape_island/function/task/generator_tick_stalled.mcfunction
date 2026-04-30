bossbar set escape_island:gen max 60
bossbar set escape_island:gen value 0
execute as @a[distance=..4] run title @s actionbar [{"text":"发电机故障，维修过载 ","color":"red"},{"score":{"name":"@e[type=minecraft:marker,tag=marker.generator,sort=nearest,limit=1]","objective":"gen_overload"}},{"text":"/20","color":"red"}]
execute if score @s gen_overload matches 0 run function escape_island:task/generator_restart
