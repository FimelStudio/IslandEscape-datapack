execute as @a[scores={death_count=1..},tag=role.mother,tag=!state.dead] at @s run function escape_island:infection/mother_death
execute as @a[scores={death_count=1..},tag=role.infected,tag=!state.dead] at @s run function escape_island:infection/infected_death
execute as @a[scores={death_count=1..},tag=role.survivor,tag=!role.mother,tag=!role.infected,tag=!state.sporifying] at @s run function escape_island:infection/survivor_death
scoreboard players set @a[scores={death_count=1..}] death_count 0
