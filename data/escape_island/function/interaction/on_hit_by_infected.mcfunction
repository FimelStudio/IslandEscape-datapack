
advancement revoke @s only escape_island:interaction/hit_by_infected

execute if entity @s[tag=team.human,tag=!state.infected_period] run function escape_island:infection/add_spore_load {amount:35}

execute if entity @s[tag=team.human] if entity @a[tag=infected.common,tag=retained.doctor,distance=..4,sort=nearest,limit=1] run effect give @s minecraft:poison 5 0 true
execute if entity @s[tag=team.human] if entity @a[tag=infected.common,tag=retained.marine,distance=..4,sort=nearest,limit=1] run effect give @s minecraft:blindness 1 0 true
execute if entity @s[tag=team.human] if entity @a[tag=infected.common,tag=retained.virologist,distance=..4,sort=nearest,limit=1] run effect give @s minecraft:nausea 3 0 true
