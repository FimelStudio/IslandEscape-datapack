# escape_island:skill/mother_disguise  —  X-7 伪装试剂
advancement revoke @s only escape_island:interaction/drink_disguise
execute if entity @s[tag=state.disguised] run return 0

tag @s add state.disguised
tag @s add flag.has_disguise
team join survivors @s

# Visual: hide red effects
effect clear @s minecraft:glowing

scoreboard players set @s cd_mother_lunge 0

# Disguise lasts 90 seconds
bossbar set escape_island:disguise visible true
bossbar set escape_island:disguise players @s
bossbar set escape_island:disguise max 90
bossbar set escape_island:disguise value 90

tellraw @s {"text":"§5伪装激活：90秒内你看起来像一名幸存者。","color":"dark_purple"}

# Schedule disguise expiry
schedule function escape_island:skill/_disguise_expire 1800t
