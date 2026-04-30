scoreboard players operation @s skill.signal_scan_cd = #cooldown skill.signal_scan_cfg
scoreboard players set @s skill.signal_scan_time 0
playsound minecraft:block.note_block.pling player @s ~ ~ ~ 0.9 1.65 1
tellraw @s {"text":"=== 异常信号报告 ===","color":"dark_aqua","bold":true}
tag @s add skill.radio.viewer
tag @e[tag=skill.radio.reported] remove skill.radio.reported
execute as @a[tag=infected.common,tag=!state.dead,tag=!skill.radio.viewer,tag=!skill.radio.reported] at @s run function skill:radio/signal_scan/report_line
execute as @a[tag=state.infected_period,tag=!infected.common,tag=!state.dead,tag=!skill.radio.viewer,tag=!skill.radio.reported] at @s run function skill:radio/signal_scan/report_line
execute as @a[tag=infected.mother,tag=flag.first_attack,tag=!state.disguised,tag=!state.dead,tag=!skill.radio.viewer,tag=!skill.radio.reported] at @s run function skill:radio/signal_scan/report_line
execute as @a[tag=infected.mother,team=!mother_hidden,tag=!state.disguised,tag=!state.dead,tag=!skill.radio.viewer,tag=!skill.radio.reported] at @s run function skill:radio/signal_scan/report_line
execute as @e[tag=test.dummy,tag=infected.common,tag=!skill.radio.reported] at @s run function skill:radio/signal_scan/report_line
execute as @e[tag=test.dummy,tag=infected.mother,tag=!skill.radio.reported] at @s run function skill:radio/signal_scan/report_line
execute unless entity @a[tag=infected.common,tag=!state.dead,tag=!skill.radio.viewer] unless entity @a[tag=state.infected_period,tag=!infected.common,tag=!state.dead,tag=!skill.radio.viewer] unless entity @a[tag=infected.mother,tag=flag.first_attack,tag=!state.disguised,tag=!state.dead,tag=!skill.radio.viewer] unless entity @a[tag=infected.mother,team=!mother_hidden,tag=!state.disguised,tag=!state.dead,tag=!skill.radio.viewer] unless entity @e[tag=test.dummy,tag=infected.common] unless entity @e[tag=test.dummy,tag=infected.mother] run tellraw @s {"text":"未发现异常信号。","color":"gray"}
tag @e[tag=skill.radio.reported] remove skill.radio.reported
tag @s remove skill.radio.viewer
title @s actionbar {"text":"异常信号报告已接收","color":"aqua"}
function skill:radio/signal_scan/update_item
