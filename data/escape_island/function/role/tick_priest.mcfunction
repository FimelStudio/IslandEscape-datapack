execute as @a[tag=role.priest,tag=!state.dead] at @s run effect give @s minecraft:night_vision 3 0 true
execute as @a[tag=role.priest,tag=state.infected_period,tag=skill.priest.cross.active] at @s run function skill:priest/cross/use
