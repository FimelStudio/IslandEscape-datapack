advancement revoke @s only skill:priest/cross/use

execute unless entity @s[tag=cross_active] run return 0

# Trigger protection
effect give @s minecraft:resistance 1 255 true
tag @s remove state.infected_period
clear @s minecraft:nautilus_shell[minecraft:custom_data~{skill:"priest_cross"}] 1

# FX
playsound minecraft:block.bell.resonate master @a[distance=..20] ~ ~ ~ 1 0.8
particle minecraft:dust{color:[1,0.85,0.2],scale:1.5} ~ ~1 ~ 0.5 0.5 0.5 0.1 50 force @a[distance=..20]
title @s actionbar {"text":"神圣十字架已触发","color":"gold","bold":true}

# Cleanup
tag @s remove cross_active
