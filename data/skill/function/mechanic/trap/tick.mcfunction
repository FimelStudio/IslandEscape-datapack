
scoreboard players remove @a[tag=ie.active,tag=role.mechanic,scores={skill.trap_cd=1..}] skill.trap_cd 1
scoreboard players remove @a[tag=ie.active,tag=infected.common,tag=retained.mechanic,scores={skill.trap_cd=1..}] skill.trap_cd 1
scoreboard players remove @a[tag=ie.active,tag=role.mechanic,scores={skill.trap_place_cd=1..}] skill.trap_place_cd 1
scoreboard players remove @a[tag=ie.active,tag=infected.common,tag=retained.mechanic,scores={skill.trap_place_cd=1..}] skill.trap_place_cd 1

execute as @a[tag=ie.active,tag=role.mechanic,scores={skill.trap_cd=0}] if score @s skill.trap_charges < #max_traps skill.trap_cfg run function skill:mechanic/trap/recharge
execute as @a[tag=ie.active,tag=infected.common,tag=retained.mechanic,scores={skill.trap_cd=0}] if score @s skill.trap_charges < #max_traps skill.trap_cfg run function skill:mechanic/trap/recharge
execute as @a[tag=ie.active,tag=role.mechanic,scores={skill.trap_cd=1..}] run function skill:mechanic/trap/cooldown_tick
execute as @a[tag=ie.active,tag=infected.common,tag=retained.mechanic,scores={skill.trap_cd=1..}] run function skill:mechanic/trap/cooldown_tick

execute as @a[tag=ie.active,tag=role.mechanic] run function skill:mechanic/trap/ensure_item
execute as @a[tag=ie.active,tag=infected.common,tag=retained.mechanic] run function skill:mechanic/trap/ensure_item

execute as @e[type=minecraft:marker,tag=skill.trap.marker] at @s run particle minecraft:dust{color:[0.1,0.8,0.2],scale:0.75} ~ ~0.08 ~ 0.18 0.02 0.18 0 2 force @a[tag=team.human,distance=..20]
execute as @e[type=minecraft:marker,tag=skill.trap.marker] at @s run particle minecraft:happy_villager ~ ~0.18 ~ 0.12 0.02 0.12 0 1 force @a[tag=team.human,distance=..20]

execute as @e[tag=infected.mother,tag=state.hunting,tag=!state.dead] at @s if entity @e[type=minecraft:marker,tag=skill.trap.marker,distance=..1.25,limit=1] run function skill:mechanic/trap/trigger
execute as @e[tag=infected.common,tag=!retained.mechanic,tag=!state.dead] at @s if entity @e[type=minecraft:marker,tag=skill.trap.marker,distance=..1.25,limit=1] run function skill:mechanic/trap/trigger
