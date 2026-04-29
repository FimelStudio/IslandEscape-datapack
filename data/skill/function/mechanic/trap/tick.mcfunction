kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:tripwire_hook",components:{"minecraft:custom_data":{skill:"mechanic_trap"}}}}]
kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:tripwire_hook",components:{"minecraft:custom_data":{skill:"mechanic_infected_trap"}}}}]

scoreboard players remove @a[tag=mechanic,scores={skill.trap_cd=1..}] skill.trap_cd 1
scoreboard players remove @a[tag=role.infected,tag=retained.mechanic,scores={skill.trap_cd=1..}] skill.trap_cd 1
scoreboard players remove @a[tag=mechanic,scores={skill.trap_place_cd=1..}] skill.trap_place_cd 1
scoreboard players remove @a[tag=role.infected,tag=retained.mechanic,scores={skill.trap_place_cd=1..}] skill.trap_place_cd 1

execute as @a[tag=mechanic,scores={skill.trap_cd=0}] if score @s skill.trap_charges < #max_traps skill.trap_cfg run function skill:mechanic/trap/recharge
execute as @a[tag=role.infected,tag=retained.mechanic,scores={skill.trap_cd=0}] if score @s skill.trap_charges < #max_traps skill.trap_cfg run function skill:mechanic/trap/recharge
execute as @a[tag=mechanic,scores={skill.trap_cd=1..}] run function skill:mechanic/trap/cooldown_tick
execute as @a[tag=role.infected,tag=retained.mechanic,scores={skill.trap_cd=1..}] run function skill:mechanic/trap/cooldown_tick

execute as @a[tag=mechanic] run function skill:mechanic/trap/ensure_item
execute as @a[tag=role.infected,tag=retained.mechanic] run function skill:mechanic/trap/ensure_item

execute as @e[type=minecraft:marker,tag=skill.trap_marker] at @s run particle minecraft:dust{color:[0.1,0.8,0.2],scale:0.75} ~ ~0.08 ~ 0.18 0.02 0.18 0 2 force @a[tag=role.survivor,distance=..20]
execute as @e[type=minecraft:marker,tag=skill.trap_marker] at @s run particle minecraft:happy_villager ~ ~0.18 ~ 0.12 0.02 0.12 0 1 force @a[tag=role.survivor,distance=..20]

execute as @e[tag=role.mother,tag=!state.dead] at @s if entity @e[type=minecraft:marker,tag=skill.trap_marker,distance=..1.25,limit=1] run function skill:mechanic/trap/trigger
execute as @e[tag=role.infected,tag=!retained.mechanic,tag=!state.dead] at @s if entity @e[type=minecraft:marker,tag=skill.trap_marker,distance=..1.25,limit=1] run function skill:mechanic/trap/trigger
