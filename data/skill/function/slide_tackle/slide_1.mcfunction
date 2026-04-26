scoreboard players set @s skill.slide_ok 0
scoreboard players set @s skill.slide_time 0
tag @s remove slide_blocked
tag @s remove slide_falling
tag @s remove slide_falling_small

summon minecraft:silverfish ~ ~ ~ {Tags:["slide_vehicle","slide_new"],NoAI:1b,Silent:1b,Invulnerable:1b,PersistenceRequired:1b}
effect give @e[type=minecraft:silverfish,tag=slide_new,limit=1,sort=nearest,distance=..1.5] minecraft:invisibility 3 0 true
execute store success score @s skill.slide_ok run ride @s mount @e[type=minecraft:silverfish,tag=slide_new,limit=1,sort=nearest,distance=..1.5]

execute if score @s skill.slide_ok matches 1 run tag @s add sliding
execute if score @s skill.slide_ok matches 1 run tag @s add slide_locked
execute if score @s skill.slide_ok matches 1 run scoreboard players set @s skill.slide_cd 1
execute if score @s skill.slide_ok matches 1 run tag @e[type=minecraft:silverfish,tag=slide_new,limit=1,sort=nearest,distance=..2] remove slide_new
execute unless score @s skill.slide_ok matches 1 run tag @e[type=minecraft:silverfish,tag=slide_new,limit=1,sort=nearest,distance=..2] add slide_cleanup
execute unless score @s skill.slide_ok matches 1 as @e[type=minecraft:silverfish,tag=slide_new,tag=slide_cleanup] at @s run tp @s ~ -512 ~
execute unless score @s skill.slide_ok matches 1 run kill @e[type=minecraft:silverfish,tag=slide_new,tag=slide_cleanup]
execute unless score @s skill.slide_ok matches 1 run scoreboard players set @s skill.slide_time 0

execute if score @s skill.slide_ok matches 1 run playsound minecraft:entity.player.attack.sweep player @a[distance=..12] ~ ~ ~ 0.35 0.85
execute if score @s skill.slide_ok matches 1 run particle minecraft:cloud ~ ~0.15 ~ 0.25 0.03 0.25 0.01 8 force @a[distance=..16]
