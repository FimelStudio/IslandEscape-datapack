particle minecraft:campfire_cosy_smoke ~ ~1 ~ 1.5 1 1.5 0.02 40 force @a[distance=..24]
particle minecraft:poof ~ ~0.5 ~ 1 0.5 1 0.05 20 force @a[distance=..24]
effect give @a[tag=team.infected,tag=!infected.mother,tag=!state.dead,tag=!state.spectator,distance=..4] minecraft:darkness 5 0 true
effect give @a[tag=infected.mother,tag=state.hunting,tag=!state.dead,tag=!state.spectator,distance=..4] minecraft:darkness 5 0 true
playsound minecraft:block.fire.extinguish player @a[distance=..16] ~ ~ ~ 0.6 1
