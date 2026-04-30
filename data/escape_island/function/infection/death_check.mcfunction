execute as @a[scores={death_count=1..},tag=infected.mother,tag=!state.dead] at @s run function escape_island:infection/mother_death
execute as @a[scores={death_count=1..},tag=infected.common,tag=!state.dead] at @s run function escape_island:infection/infected_death
execute as @a[scores={death_count=1..},tag=team.human,tag=!infected.mother,tag=!infected.common,tag=!state.sporifying] at @s run function escape_island:infection/survivor_death
scoreboard players set @a[scores={death_count=1..}] death_count 0
