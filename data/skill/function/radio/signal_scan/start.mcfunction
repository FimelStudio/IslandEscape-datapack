scoreboard players operation @s skill.signal_scan_cd = #cooldown skill.signal_scan_cfg
scoreboard players set @s skill.signal_scan_time 0
playsound minecraft:block.note_block.pling player @s ~ ~ ~ 0.9 1.65 1
tellraw @s {"text":"=== 异常信号报告 ===","color":"dark_aqua","bold":true}
tag @s add skill.radio_viewer
tag @e[tag=skill.radio_reported] remove skill.radio_reported
execute as @a[tag=role.infected,tag=!state.dead,tag=!skill.radio_viewer,tag=!skill.radio_reported] at @s run function skill:radio/signal_scan/report_line
execute as @a[tag=state.infected_period,tag=!role.infected,tag=!state.dead,tag=!skill.radio_viewer,tag=!skill.radio_reported] at @s run function skill:radio/signal_scan/report_line
execute as @a[tag=role.mother,tag=flag.first_attack,tag=!state.disguised,tag=!state.dead,tag=!skill.radio_viewer,tag=!skill.radio_reported] at @s run function skill:radio/signal_scan/report_line
execute as @a[tag=role.mother,team=!mother_hidden,tag=!state.disguised,tag=!state.dead,tag=!skill.radio_viewer,tag=!skill.radio_reported] at @s run function skill:radio/signal_scan/report_line
execute as @e[tag=test.dummy,tag=role.infected,tag=!skill.radio_reported] at @s run function skill:radio/signal_scan/report_line
execute as @e[tag=test.dummy,tag=role.mother,tag=!skill.radio_reported] at @s run function skill:radio/signal_scan/report_line
execute unless entity @a[tag=role.infected,tag=!state.dead,tag=!skill.radio_viewer] unless entity @a[tag=state.infected_period,tag=!role.infected,tag=!state.dead,tag=!skill.radio_viewer] unless entity @a[tag=role.mother,tag=flag.first_attack,tag=!state.disguised,tag=!state.dead,tag=!skill.radio_viewer] unless entity @a[tag=role.mother,team=!mother_hidden,tag=!state.disguised,tag=!state.dead,tag=!skill.radio_viewer] unless entity @e[tag=test.dummy,tag=role.infected] unless entity @e[tag=test.dummy,tag=role.mother] run tellraw @s {"text":"未发现异常信号。","color":"gray"}
tag @e[tag=skill.radio_reported] remove skill.radio_reported
tag @s remove skill.radio_viewer
title @s actionbar {"text":"异常信号报告已接收","color":"aqua"}
function skill:radio/signal_scan/update_item
