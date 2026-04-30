scoreboard players add @s gen_progress 1
execute as @a[tag=gen.user,sort=nearest,limit=1,distance=..3] run tellraw @s [{"text":"§6燃料电池已投入发电机：","color":"gold"},{"score":{"name":"@e[type=minecraft:marker,tag=marker.generator,sort=nearest,limit=1]","objective":"gen_progress"}},{"text":"/3","color":"gold"}]
execute at @s run playsound minecraft:block.copper_bulb.turn_on master @a[distance=..12] ~ ~ ~ 0.7 1.2
execute if score $game player_count matches ..7 if score @s gen_progress matches 2.. run function escape_island:task/_generator_start
execute if score $game player_count matches 8.. if score @s gen_progress matches 3.. run function escape_island:task/_generator_start
