
execute if score $tick ie.hygiene matches 0 as @a[tag=ie.active,tag=!role.engineer] run function skill:engineer/battery/cleanup_non_engineer

scoreboard players remove @a[tag=ie.active,tag=role.engineer,scores={skill.battery_cd=1..}] skill.battery_cd 1
scoreboard players remove @e[type=minecraft:marker,tag=entity.engineer_battery,scores={skill.battery_timer=1..}] skill.battery_timer 1

execute as @e[type=minecraft:marker,tag=entity.engineer_battery] at @s run particle minecraft:electric_spark ~ ~0.12 ~ 0.18 0.04 0.18 0.01 1 force @a[distance=..12]
execute as @e[type=minecraft:marker,tag=entity.engineer_battery,scores={skill.battery_timer=..0}] at @s run particle minecraft:poof ~ ~0.15 ~ 0.18 0.08 0.18 0.01 8 force @a[distance=..12]
execute as @e[type=minecraft:marker,tag=entity.engineer_battery,scores={skill.battery_timer=..0}] run kill @s

execute as @a[tag=ie.active,tag=role.engineer,scores={skill.battery_cd=0,skill.battery_state=2}] run function skill:engineer/battery/update_item
execute as @a[tag=ie.active,tag=role.engineer,scores={skill.battery_cd=1..}] run function skill:engineer/battery/cooldown_tick
execute as @a[tag=ie.active,tag=role.engineer] run function skill:engineer/battery/ensure_item
