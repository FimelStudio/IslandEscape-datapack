advancement revoke @s only skill:priest/cross/use

execute unless entity @s[tag=cross_active] run return 0

# Trigger protection
effect give @s minecraft:resistance 1 255 true
tag @s remove state.infected_period
scoreboard players set @s infect_time 0
scoreboard players set @s spore_load 0
effect clear @s minecraft:slowness
tag @s remove cross_active
tag @s remove flag.cross_intact
clear @s minecraft:nautilus_shell[minecraft:custom_data~{skill:"priest_cross"}]
clear @s minecraft:nautilus_shell[minecraft:custom_data~{skill:"priest_cross_used"}]
clear @s minecraft:nautilus_shell[minecraft:custom_data~{role_item:"priest.cross"}]
give @s minecraft:nautilus_shell[minecraft:custom_data={skill:"priest_cross_used",role_item:"survivor.skill"},minecraft:custom_name={text:"黯淡的十字架",color:"dark_gray",italic:false},minecraft:lore=[{text:"阻断效果已触发。",color:"gray",italic:false}]] 1

# FX
playsound minecraft:block.bell.resonate master @a[distance=..20] ~ ~ ~ 1 0.8
particle minecraft:dust{color:[1,0.85,0.2],scale:1.5} ~ ~1 ~ 0.5 0.5 0.5 0.1 50 force @a[distance=..20]
title @s actionbar {"text":"神圣十字架已触发","color":"gold","bold":true}
