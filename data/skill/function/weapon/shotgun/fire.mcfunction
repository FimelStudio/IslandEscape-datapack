scoreboard players set @s skill.shotgun_cd 20
playsound minecraft:item.crossbow.shoot master @a[distance=..24] ~ ~ ~ 1 0.7
execute anchored eyes positioned ^ ^ ^4 as @e[tag=infected.common,tag=!state.dead,distance=..4] run damage @s 5 minecraft:generic
execute anchored eyes positioned ^ ^ ^4 as @e[tag=infected.mother,tag=!state.dead,distance=..4] run damage @s 4 minecraft:generic
execute anchored eyes positioned ^ ^ ^4 run particle minecraft:crit ~ ~ ~ 2 1 2 0.15 40 force @a[distance=..24]
