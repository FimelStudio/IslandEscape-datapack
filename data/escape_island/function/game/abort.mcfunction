
execute if score $game in_game matches 0 run return 0

scoreboard players set $game in_game 0
tellraw @a {"text":"[孤岛逃生] 游戏已强制中止。","color":"red"}

effect clear @a
gamemode survival @a

bossbar set escape_island:phase visible false
bossbar set escape_island:signal visible false
bossbar set escape_island:gen visible false
bossbar set escape_island:heli visible false
bossbar set escape_island:ship visible false
bossbar set escape_island:sub visible false
bossbar set escape_island:bomb visible false
bossbar set escape_island:infection visible false
bossbar set escape_island:disguise visible false
bossbar set escape_island:mother_respawn visible false

team leave @a
tag @a remove mother_eating
tag @a remove mother_eat_fired
tag @a remove mother_eat_absorbing
tag @a remove eaten_zombie
scoreboard players reset @a skill.mother_eat_anim
function skill:mother/eat/clear_storage

tellraw @a {"text":"输入 /function escape_island:game/start 重新开始。","color":"gold"}
