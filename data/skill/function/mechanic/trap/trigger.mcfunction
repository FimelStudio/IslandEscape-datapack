effect give @s minecraft:slowness 4 1 false
effect give @s minecraft:glowing 30 0 false
execute at @s run particle minecraft:dust{color:[0.1,0.8,0.2],scale:1.2} ~ ~0.4 ~ 0.45 0.25 0.45 0.02 36 force @a[distance=..18]
execute at @s run playsound minecraft:block.tripwire.click_off master @a[distance=..20] ~ ~ ~ 1 0.8
execute at @s run kill @e[type=minecraft:marker,tag=skill.trap_marker,distance=..1.5,sort=nearest,limit=1]
