
execute as @a[tag=state.dead,scores={mother_respawn=1..}] run scoreboard players remove @s mother_respawn 1
execute as @a[tag=state.dead,tag=role.mother,limit=1] store result bossbar escape_island:mother_respawn value run scoreboard players get @s mother_respawn

execute as @a[tag=state.dead,tag=role.infected,scores={mother_respawn=0}] run function escape_island:infection/infected_respawn
execute as @a[tag=state.dead,tag=role.mother,scores={mother_respawn=0}] run function escape_island:infection/mother_respawn
