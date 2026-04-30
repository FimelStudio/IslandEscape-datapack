
advancement revoke @s only escape_island:interaction/hit_by_mother
advancement revoke @s only escape_island:interaction/hit_by_secondary_mother

execute if entity @s[tag=team.human] at @s as @a[tag=infected.mother,tag=!flag.first_attack,distance=..8,sort=nearest,limit=1] run function escape_island:interaction/_mother_first_attack
execute if entity @s[tag=team.human] at @s as @a[tag=infected.secondary_mother,tag=!flag.first_attack,distance=..8,sort=nearest,limit=1] run function escape_island:interaction/_mother_first_attack

execute if entity @s[tag=team.human,tag=!state.infected_period] run function escape_island:infection/add_spore_load {amount:50}
