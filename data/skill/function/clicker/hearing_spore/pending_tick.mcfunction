scoreboard players remove @s skill.clicker_spore_delay 1
execute if score @s skill.clicker_spore_delay matches ..0 run return run function skill:clicker/hearing_spore/launch_pending
particle minecraft:dust{color:[0.0,0.55,0.18],scale:0.45} ~ ~ ~ 0.05 0.05 0.05 0 1 force @a[distance=..24]
