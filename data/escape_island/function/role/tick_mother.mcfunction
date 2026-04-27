# escape_island:role/tick_mother  —  mother passives, runs every second

# Baseline damage reduction: Resistance I, refreshed while alive.
execute as @a[tag=role.mother,tag=!state.dead] at @s run effect give @s minecraft:resistance 2 0 true

# Refresh current HP into scoreboard
execute as @a[tag=role.mother,tag=!state.dead] store result score @s mother_hp run data get entity @s Health 1

# Out-of-combat regen: detect HP decrease → reset regen_cd to 5
execute as @a[tag=role.mother,tag=!state.dead] if score @s mother_hp < @s mother_last_hp run scoreboard players set @s mother_regen_cd 5
execute as @a[tag=role.mother,tag=!state.dead] run scoreboard players operation @s mother_last_hp = @s mother_hp
execute as @a[tag=role.mother,tag=!state.dead,scores={mother_regen_cd=1..}] run scoreboard players remove @s mother_regen_cd 1
# Regen II (~1.6 HP/s) when out of combat
execute as @a[tag=role.mother,tag=!state.dead,scores={mother_regen_cd=..0}] at @s run effect give @s minecraft:regeneration 2 1 true

# Berserk: HP ≤ 30% of 60 = 1..18. Score 0 means uninitialized/failed read, not low HP.
execute as @a[tag=role.mother,tag=!state.dead,scores={mother_hp=1..18}] at @s run effect give @s minecraft:speed 3 1 true
execute as @a[tag=role.mother,tag=!state.dead,scores={mother_hp=1..18}] at @s run effect give @s minecraft:strength 3 0 true

# Virologist detection: gold particles around mother, visible only to nearby virologist
# 1–4 block range: dense particles
execute as @a[tag=role.mother,tag=!state.disguised,tag=!state.dead] at @s run particle minecraft:dust{color:[1.0,0.84,0.0],scale:0.9} ~ ~1 ~ 0.5 0.4 0.5 0.01 8 force @a[tag=role.virologist,distance=..4]
# 5–8 block range: sparse particles
execute as @a[tag=role.mother,tag=!state.disguised,tag=!state.dead] at @s run particle minecraft:dust{color:[1.0,0.84,0.0],scale:0.5} ~ ~1 ~ 0.4 0.3 0.4 0.01 2 force @a[tag=role.virologist,distance=5..8]
