execute as @a[tag=role.priest,tag=!state.dead] at @s run effect give @s minecraft:night_vision 3 0 true
execute as @a[tag=role.priest,tag=state.infected_period,tag=cross_active] at @s run function skill:priest/cross/use
