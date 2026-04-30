execute if score $game gen_state matches 1 run tellraw @s {"text":"§a发电机已经启动。","color":"green"}
execute if score $game gen_state matches 1 run return 0
execute if score $game gen_state matches 2 run tellraw @s {"text":"§c发电机已损毁，需要重新部署。","color":"red"}
execute if score $game gen_state matches 2 run return 0
execute if score $game gen_state matches 3 run tellraw @s {"text":"§a这座发电机已经稳定运转，无需再添加燃料。","color":"green"}
execute if score $game gen_state matches 3 run return 0

execute unless entity @e[type=minecraft:marker,tag=marker.generator,distance=..2.5,limit=1] run tellraw @s {"text":"§c需要站在发电机旁投入燃料。","color":"red"}
execute unless entity @e[type=minecraft:marker,tag=marker.generator,distance=..2.5,limit=1] run return 0
execute unless items entity @s weapon.mainhand *[custom_data~{item:"fuel_cell"}] run return 0

clear @s *[custom_data~{item:"fuel_cell"}] 1
scoreboard players add $game gen_progress 1
tellraw @s {"text":"§6燃料电池已投入发电机。","color":"gold"}
scoreboard players set @s gen_hold_lock 1
scoreboard players set @s gen_hold_time 0

execute if score $game gen_progress matches 3.. run function escape_island:task/_generator_start
