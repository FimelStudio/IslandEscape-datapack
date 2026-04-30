
execute if entity @s[tag=infected.mother] as @p[tag=team.human,sort=nearest,limit=1,distance=..5] run function escape_island:infection/add_spore_load {amount:50}


execute if entity @s[tag=infected.common] as @p[tag=team.human,sort=nearest,limit=1,distance=..5] run function escape_island:infection/add_spore_load {amount:35}
execute if entity @s[tag=infected.secondary_mother] as @p[tag=team.human,sort=nearest,limit=1,distance=..5] run function escape_island:infection/add_spore_load {amount:50}
