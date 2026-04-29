scoreboard players remove @s skill.gm_burst 1
scoreboard players set @s skill.gm_delay 2
scoreboard players set #hit skill.gm_runtime 0

playsound minecraft:entity.firework_rocket.blast master @a[distance=..18] ~ ~ ~ 0.9 1.8
playsound minecraft:entity.firework_rocket.blast player @s ~ ~ ~ 0.8 1.8
particle minecraft:smoke ^ ^-0.05 ^0.6 0.03 0.03 0.03 0 5 force @a[distance=..18]
particle minecraft:crit ^ ^ ^0.8 0.02 0.02 0.02 0.2 10 force @a[distance=..18]

function skill:marine/gun_mastery/raycast
