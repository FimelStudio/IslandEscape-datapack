scoreboard players set @s skill.slide_ok 0
scoreboard players set @s skill.slide_time 0
scoreboard players set @s skill.slide_fall 0
tag @s remove skill.slide.blocked
tag @s remove skill.slide.falling
tag @s remove skill.slide.falling_small
tag @s remove skill.slide.moved
tag @s remove skill.slide.drop_113
tag @s remove skill.slide.drop_100
tag @s remove skill.slide.drop_083
tag @s remove skill.slide.drop_064
tag @s remove skill.slide.drop_044
tag @s remove skill.slide.drop_030
tag @s remove skill.slide.drop_015
tag @s remove skill.slide.drop_008

summon minecraft:silverfish ~ ~ ~ {Tags:["skill.slide.vehicle","skill.slide.new"],NoAI:1b,Silent:1b,Invulnerable:1b,PersistenceRequired:1b}
attribute @e[type=minecraft:silverfish,tag=skill.slide.new,limit=1,sort=nearest,distance=..1.5] minecraft:scale base set 0.25
execute rotated as @s rotated ~ 0 run rotate @e[type=minecraft:silverfish,tag=skill.slide.new,limit=1,sort=nearest,distance=..1.5] ~ 0
effect give @e[type=minecraft:silverfish,tag=skill.slide.new,limit=1,sort=nearest,distance=..1.5] minecraft:invisibility 3 0 true
execute store success score @s skill.slide_ok run ride @s mount @e[type=minecraft:silverfish,tag=skill.slide.new,limit=1,sort=nearest,distance=..1.5]

execute if score @s skill.slide_ok matches 1 run tag @s add skill.slide.active
execute if score @s skill.slide_ok matches 1 run tag @s add skill.slide.locked
execute if score @s skill.slide_ok matches 1 run scoreboard players set @s skill.slide_cd 1
execute if score @s skill.slide_ok matches 1 run scoreboard players operation @s skill.stamina -= @s skill.slide_cost
execute if score @s skill.slide_ok matches 1 run tag @e[type=minecraft:silverfish,tag=skill.slide.new,limit=1,sort=nearest,distance=..2] remove skill.slide.new
execute unless score @s skill.slide_ok matches 1 run tag @e[type=minecraft:silverfish,tag=skill.slide.new,limit=1,sort=nearest,distance=..2] add skill.slide.cleanup
execute unless score @s skill.slide_ok matches 1 as @e[type=minecraft:silverfish,tag=skill.slide.new,tag=skill.slide.cleanup] at @s run tp @s ~ -512 ~
execute unless score @s skill.slide_ok matches 1 run kill @e[type=minecraft:silverfish,tag=skill.slide.new,tag=skill.slide.cleanup]
execute unless score @s skill.slide_ok matches 1 run scoreboard players set @s skill.slide_time 0

execute if score @s skill.slide_ok matches 1 run playsound minecraft:entity.player.attack.sweep player @a[distance=..12] ~ ~ ~ 0.35 0.85
execute if score @s skill.slide_ok matches 1 run particle minecraft:cloud ~ ~0.15 ~ 0.25 0.03 0.25 0.01 8 force @a[distance=..16]
