tag @s add mother_eat_absorbing
scoreboard players set @s skill.mother_eat_anim 18
effect give @s minecraft:slowness 1 255 true
effect give @s minecraft:weakness 1 255 true
effect give @s minecraft:resistance 1 4 true
particle minecraft:dust{color:[0.0,0.9,0.25],scale:1.0} ~ ~0.8 ~ 0.2 0.35 0.2 0.02 12 force @a[distance=..16]
playsound minecraft:entity.enderman.teleport player @a[distance=..16] ~ ~ ~ 0.5 0.7
