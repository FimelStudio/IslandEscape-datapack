advancement revoke @s only skill:common/flashbang
execute anchored eyes positioned ^ ^ ^3 run particle minecraft:flash ~ ~1 ~ 2 1 2 0.01 30 force @a[distance=..24]
execute anchored eyes positioned ^ ^ ^3 run effect give @a[tag=team.infected,distance=..4] minecraft:darkness 3 2 true
execute anchored eyes positioned ^ ^ ^3 run effect give @a[tag=team.infected,distance=..4] minecraft:slowness 3 1 true
playsound minecraft:entity.generic.explode master @a[distance=..24] ~ ~ ~ 0.8 1.5
