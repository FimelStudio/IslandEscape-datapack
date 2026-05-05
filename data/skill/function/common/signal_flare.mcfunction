advancement revoke @s only skill:common/signal_flare
particle minecraft:flame ~ ~1 ~ 1 0.5 1 0.02 30 force @a[distance=..32]
effect give @a[tag=team.infected,distance=..6] minecraft:glowing 8 0 true
effect give @a[tag=team.infected,distance=..6] minecraft:slowness 3 1 true
playsound minecraft:entity.blaze.shoot master @a[distance=..32] ~ ~ ~ 1 0.8
