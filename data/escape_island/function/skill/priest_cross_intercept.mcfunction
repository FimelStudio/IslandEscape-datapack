# escape_island:skill/priest_cross_intercept  —  run as priest when cross triggers
# Blocks the infection/death, consume the cross.

tag @s remove flag.cross_intact
tag @s add flag.cross_intercepted

# Clear the cross item
clear @s minecraft:nautilus_shell[minecraft:custom_data~{role_item:"priest.cross"}] 1

# Clear infection state if applicable
tag @s remove state.infected_period
scoreboard players set @s infect_time 0
scoreboard players set @s spore_load 0
effect clear @s minecraft:slowness

# Ember effect: resistance II + speed I for 10 seconds
effect give @s minecraft:resistance 10 1 false
effect give @s minecraft:speed 10 0 false

# Visual + sound
title @s title {"text":"§f✝ 十字架碎裂","bold":true}
playsound minecraft:block.bell.resonate master @a[distance=..30] ~ ~ ~ 1 0.8
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 0.5

tellraw @a {"text":"§f祈祷声……","color":"white","italic":true}
