scoreboard players add @a skill.slide_time 0
scoreboard players add @a skill.slide_cd 0
scoreboard players remove @a[scores={skill.slide_cd=1..}] skill.slide_cd 1
execute as @a run function skill:athlete/slide_tackle/stamina_tick

execute as @a[tag=!sliding,tag=slide_locked] unless predicate skill:is_slide run tag @s remove slide_locked
execute as @a[tag=!sliding,tag=!slide_locked,scores={skill.slide_cd=0}] at @s if predicate skill:is_slide if predicate skill:is_onground if score @s skill.stamina >= #cost skill.stamina_cfg run function skill:athlete/slide_tackle/slide_1
execute as @a[tag=!sliding,tag=!slide_locked,scores={skill.slide_cd=0}] at @s if predicate skill:is_slide if predicate skill:is_onground unless score @s skill.stamina >= #cost skill.stamina_cfg run function skill:athlete/slide_tackle/stamina_insufficient

execute as @a[tag=sliding] at @s if predicate skill:is_space run function skill:athlete/slide_tackle/slide_2
execute as @a[tag=sliding,scores={skill.slide_time=17..}] at @s run function skill:athlete/slide_tackle/slide_2
execute as @a[tag=sliding] at @s if entity @e[type=minecraft:silverfish,tag=slide_vehicle,distance=..2,limit=1] unless data entity @s RootVehicle run ride @s mount @e[type=minecraft:silverfish,tag=slide_vehicle,distance=..2,limit=1,sort=nearest]
execute as @a[tag=sliding] at @s unless entity @e[type=minecraft:silverfish,tag=slide_vehicle,distance=..4,limit=1] run function skill:athlete/slide_tackle/slide_2

execute as @a[tag=sliding,scores={skill.slide_time=0..16}] at @s run function skill:athlete/slide_tackle/slide_speed

scoreboard players add @a[tag=sliding] skill.slide_time 1
execute as @a run function skill:athlete/slide_tackle/stamina_actionbar

