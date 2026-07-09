execute if score $game final_pressure matches 1 run return 0
scoreboard players set $game final_pressure 1

title @a title {"text":"孢子浓度上升","color":"dark_purple","bold":true}
title @a subtitle {"text":"岛屿正在进入终局高压。撤离窗口会越来越窄。","color":"gray"}
title @a actionbar {"text":"终局高压：母体变异窗口已刷新","color":"dark_purple"}
tellraw @a {"text":"§5[终局高压]§r 孢子云压低了天空，母体获得一次开团窗口。","color":"dark_purple"}
playsound minecraft:block.sculk_shrieker.shriek master @a ~ ~ ~ 0.8 0.7
execute at @a[tag=team.human,limit=1] run particle minecraft:dust{color:[0.25,0.0,0.35],scale:4} ~ ~2 ~ 8 2 8 0.01 100 force @a

execute as @a[tag=infected.mother,tag=!state.dead,tag=!state.spectator,tag=!state.hunting] run scoreboard players set @s cd_mother_mutate 0
execute as @a[tag=infected.mother,tag=!state.dead,tag=!state.spectator,tag=!state.hunting] run scoreboard players set @s skill.mutate_sec 0
execute as @a[tag=infected.mother,tag=!state.dead,tag=!state.spectator,tag=!state.hunting] run function skill:mother/mutate/update_item
execute as @a[tag=infected.mother,tag=!state.dead,tag=!state.spectator] run tellraw @s {"text":"§4[母体]§r 终局高压已刷新你的变异脉冲。","color":"dark_red"}
