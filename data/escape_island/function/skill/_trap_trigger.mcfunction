# Run as victim player
effect give @s minecraft:slowness 80 1 false
effect give @s minecraft:glowing 600 0 false
playsound minecraft:block.tripwire.click_off master @a[distance=..20] ~ ~ ~ 1 1
# Kill the trap marker after trigger
kill @e[tag=entity.mechanic_trap,distance=..1,limit=1]
