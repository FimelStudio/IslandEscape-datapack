advancement revoke @s only skill:captain/horn
execute if score @s cd_captain matches 1.. run return 0

scoreboard players set @s cd_captain 120
effect give @a[tag=role.survivor,distance=..8] minecraft:speed 15 1 false
effect give @a[tag=role.survivor,distance=..8] minecraft:strength 15 0 false
playsound minecraft:entity.goat.horn_break master @a ~ ~ ~ 1 1
tellraw @a[distance=..8] {"text":"§e船长吹响了哨子！速度+力量 15秒。","color":"yellow"}
