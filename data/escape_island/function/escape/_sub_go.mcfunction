execute as @a[tag=state.boarding] run tag @s add state.escaped
execute as @a[tag=state.boarding] run scoreboard players add $game escaped_count 1
execute as @a[tag=state.boarding] run tag @s remove state.boarding

tellraw @a {"text":"§5潜艇已离港！","color":"dark_purple"}
kill @e[type=minecraft:interaction,tag=entity.sub_door]
kill @e[tag=entity.sub_door_hint]
bossbar set escape_island:sub visible false

function escape_island:game/end_lab
