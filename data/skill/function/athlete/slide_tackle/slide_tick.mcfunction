execute as @a[tag=!role.athlete] at @s run function skill:athlete/slide_tackle/cleanup_non_athlete

scoreboard players add @a[tag=role.athlete] skill.slide_time 0
scoreboard players add @a[tag=role.athlete] skill.slide_cd 0
scoreboard players add @a[tag=role.athlete] skill.slide_sprint 0
scoreboard players remove @a[tag=role.athlete,scores={skill.slide_cd=1..}] skill.slide_cd 1
scoreboard players remove @a[tag=role.athlete,scores={skill.slide_sprint=1..}] skill.slide_sprint 1
execute as @a[tag=role.athlete] if predicate skill:is_sprint_state run scoreboard players set @s skill.slide_sprint 8
execute as @a[tag=role.athlete] run function skill:athlete/slide_tackle/stamina_tick
scoreboard players operation @a[tag=role.athlete] skill.slide_cost = #cost skill.stamina_cfg
execute as @a[tag=role.athlete,tag=skill.adrenaline.active] run scoreboard players operation @s skill.slide_cost *= #slide_cost_percent skill.adren_cfg
execute as @a[tag=role.athlete,tag=skill.adrenaline.active] run scoreboard players operation @s skill.slide_cost /= #hundred skill.adren_cfg
execute as @a[tag=role.athlete,scores={skill.slide_cost=..0}] run scoreboard players set @s skill.slide_cost 1

execute as @a[tag=role.athlete,tag=!skill.slide.active,tag=skill.slide.locked] unless predicate skill:is_slide run tag @s remove skill.slide.locked
execute as @a[tag=role.athlete,tag=!skill.slide.active,tag=!skill.slide.locked,scores={skill.slide_cd=0,skill.slide_sprint=1..}] at @s if predicate skill:is_slide unless block ~ ~-0.08 ~ #skill:slide_passable if score @s skill.stamina >= @s skill.slide_cost run function skill:athlete/slide_tackle/slide_1
execute as @a[tag=role.athlete,tag=!skill.slide.active,tag=!skill.slide.locked,scores={skill.slide_cd=0,skill.slide_sprint=1..}] at @s if predicate skill:is_slide unless block ~ ~-0.25 ~ #skill:slide_passable if score @s skill.stamina >= @s skill.slide_cost run function skill:athlete/slide_tackle/slide_1
execute as @a[tag=role.athlete,tag=!skill.slide.active,tag=!skill.slide.locked,scores={skill.slide_cd=0,skill.slide_sprint=1..}] at @s if predicate skill:is_slide unless block ~ ~-0.08 ~ #skill:slide_passable unless score @s skill.stamina >= @s skill.slide_cost run function skill:athlete/slide_tackle/stamina_insufficient
execute as @a[tag=role.athlete,tag=!skill.slide.active,tag=!skill.slide.locked,scores={skill.slide_cd=0,skill.slide_sprint=1..}] at @s if predicate skill:is_slide unless block ~ ~-0.25 ~ #skill:slide_passable unless score @s skill.stamina >= @s skill.slide_cost run function skill:athlete/slide_tackle/stamina_insufficient

execute as @a[tag=role.athlete,tag=skill.slide.active] at @s if predicate skill:is_space run function skill:athlete/slide_tackle/slide_2
execute as @a[tag=role.athlete,tag=skill.slide.active,scores={skill.slide_time=17..}] at @s run function skill:athlete/slide_tackle/slide_2
execute as @a[tag=role.athlete,tag=skill.slide.active] at @s if entity @e[type=minecraft:silverfish,tag=skill.slide.vehicle,distance=..2,limit=1] unless data entity @s RootVehicle run ride @s mount @e[type=minecraft:silverfish,tag=skill.slide.vehicle,distance=..2,limit=1,sort=nearest]
execute as @a[tag=role.athlete,tag=skill.slide.active] at @s unless entity @e[type=minecraft:silverfish,tag=skill.slide.vehicle,distance=..4,limit=1] run function skill:athlete/slide_tackle/slide_2

execute as @a[tag=role.athlete,tag=skill.slide.active,scores={skill.slide_time=0..16}] at @s run function skill:athlete/slide_tackle/slide_speed

scoreboard players add @a[tag=role.athlete,tag=skill.slide.active] skill.slide_time 1
execute as @a[tag=role.athlete] run function skill:athlete/slide_tackle/stamina_actionbar

