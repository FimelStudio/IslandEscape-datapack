
title @a title {"text":"游戏结束","color":"gold","bold":true}

gamemode spectator @a[tag=state.escaped]

gamemode adventure @a[tag=!state.escaped]
effect clear @a

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

kill @e[tag=entity.engineer_battery]
kill @e[tag=entity.mechanic_trap]
kill @e[tag=entity.chef_stew_pot]

tellraw @a {"text":"─────────────────────────────","color":"gray"}
tellraw @a {"text":"输入 /function escape_island:game/start 再来一局。","color":"gold"}
