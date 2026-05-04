damage @s 2 minecraft:on_fire
effect give @s minecraft:glowing 5 0 true
effect give @s minecraft:slowness 3 1 true
particle minecraft:flame ~ ~1 ~ 0.3 0.5 0.3 0.02 20 force @a[distance=..24]
playsound minecraft:entity.blaze.shoot master @a[distance=..24] ~ ~ ~ 1 0.8
