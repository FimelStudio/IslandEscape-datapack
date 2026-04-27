
execute if entity @s[tag=role.mother] as @p[tag=role.survivor,sort=nearest,limit=1,distance=..5] run function escape_island:infection/add_spore_load {amount:50}


execute if entity @s[tag=role.infected] as @p[tag=role.survivor,sort=nearest,limit=1,distance=..5] run function escape_island:infection/add_spore_load {amount:35}
execute if entity @s[tag=role.secondary_mother] as @p[tag=role.survivor,sort=nearest,limit=1,distance=..5] run function escape_island:infection/add_spore_load {amount:50}
