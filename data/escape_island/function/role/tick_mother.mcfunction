
execute as @a[tag=infected.mother,tag=!state.dead] at @s run effect give @s minecraft:resistance 2 0 true

execute as @a[tag=infected.mother,tag=!state.dead] store result score @s mother_hp run data get entity @s Health 1

execute as @a[tag=infected.mother,tag=!state.dead] if score @s mother_hp < @s mother_last_hp run scoreboard players set @s mother_regen_cd 5
execute as @a[tag=infected.mother,tag=!state.dead] run scoreboard players operation @s mother_last_hp = @s mother_hp
execute as @a[tag=infected.mother,tag=!state.dead,scores={mother_regen_cd=1..}] run scoreboard players remove @s mother_regen_cd 1
execute as @a[tag=infected.mother,tag=!state.dead,scores={mother_regen_cd=..0}] at @s run effect give @s minecraft:regeneration 2 1 true

execute as @a[tag=infected.mother,tag=!state.dead,scores={mother_hp=1..24}] at @s run effect give @s minecraft:speed 3 1 true
execute as @a[tag=infected.mother,tag=!state.dead,scores={mother_hp=1..24}] at @s run effect give @s minecraft:strength 3 0 true

execute as @a[tag=infected.mother,tag=state.dead] run title @s actionbar {"text":"母巢崩坏 — 你已消亡，感染者将随之瓦解。","color":"dark_gray","italic":true}

execute as @a[tag=infected.mother,tag=state.attack_slowed,scores={mother_hit_cd=0}] run attribute @s minecraft:attack_speed base set 4
execute as @a[tag=infected.mother,tag=state.attack_slowed,scores={mother_hit_cd=0}] run tag @s remove state.attack_slowed
