execute unless entity @a[tag=mother_eating,limit=1] run tag @s remove mother_eat_absorbing
execute unless entity @a[tag=mother_eating,limit=1] run return 0

effect give @s minecraft:slowness 1 255 true
effect give @s minecraft:weakness 1 255 true
effect give @s minecraft:resistance 1 4 true
execute at @s facing entity @a[tag=mother_eating,limit=1] eyes run tp @s ^ ^ ^0.5 facing entity @a[tag=mother_eating,limit=1] eyes
particle minecraft:dust{color:[0.0,0.9,0.25],scale:0.8} ~ ~0.8 ~ 0.12 0.25 0.12 0.01 6 force @a[distance=..16]
execute at @a[tag=mother_eating,limit=1] if entity @s[distance=..1.2] run function skill:mother/eat/swallow_target
execute unless entity @s[tag=mother_eat_absorbing] run return 0
scoreboard players remove @s skill.mother_eat_anim 1
execute if score @s skill.mother_eat_anim matches ..0 run function skill:mother/eat/swallow_target
