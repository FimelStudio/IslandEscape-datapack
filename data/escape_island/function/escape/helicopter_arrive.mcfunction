tellraw @a {"text":"§6[直升机] 已降落！60 秒内上机！","color":"gold"}
playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 1 0.5
execute unless entity @e[tag=entity.helicopter,limit=1] at @e[type=minecraft:marker,tag=heli.selected_pad,limit=1] run function escape_island:escape/_spawn_helicopter
execute at @e[type=minecraft:marker,tag=heli.selected_pad,limit=1] as @e[tag=entity.helicopter] run tp @s ~ ~4.0 ~ 180 0
scoreboard players set $game heli_motion 0

scoreboard players set $game heli_countdown -61
bossbar set escape_island:heli name {"text":"直升机登机窗口","color":"gold"}
bossbar set escape_island:heli max 60
bossbar set escape_island:heli value 60

function escape_island:escape/helicopter_spawn_door
