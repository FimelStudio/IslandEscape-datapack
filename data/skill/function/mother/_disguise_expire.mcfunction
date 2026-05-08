execute if entity @s[tag=state.disguised] run team join mother @s
execute if entity @s[tag=state.disguised] run tag @s remove state.disguised
bossbar set escape_island:disguise visible false
tellraw @s {"text":"§4伪装已过期。","color":"dark_red"}
