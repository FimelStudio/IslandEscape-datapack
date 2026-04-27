# escape_island:infection/on_attack  —  called when an infected/mother attacks a player
# Context: @s = attacker. Must be called from advancement or other hook.
# Finds the attacked player and adds spore load.

# Mother attack: +50 spore
execute if entity @s[tag=role.mother] as @p[tag=role.survivor,sort=nearest,limit=1,distance=..5] run function escape_island:infection/add_spore_load {amount:50}

# Mother lunge hit: +35 spore (called separately from mother_lunge.mcfunction)

# Infected attack: +35 spore
execute if entity @s[tag=role.infected] as @p[tag=role.survivor,sort=nearest,limit=1,distance=..5] run function escape_island:infection/add_spore_load {amount:35}
execute if entity @s[tag=role.secondary_mother] as @p[tag=role.survivor,sort=nearest,limit=1,distance=..5] run function escape_island:infection/add_spore_load {amount:50}
