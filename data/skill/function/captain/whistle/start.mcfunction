execute at @s as @a[tag=role.survivor,tag=!state.dead,distance=..8] run effect give @s minecraft:speed 15 1 true
execute at @s as @a[tag=role.survivor,tag=!state.dead,distance=..8] run effect give @s minecraft:strength 15 0 true
execute at @s run playsound minecraft:item.goat_horn.sound.0 player @a[distance=..16] ~ ~ ~ 1 1 0
execute at @s run particle minecraft:dust{color:[1.0,0.85,0.15],scale:1.2} ~ ~1 ~ 0.7 0.45 0.7 0.02 35 force @a[distance=..16]
execute at @s run tellraw @a[tag=role.survivor,distance=..8] {"text":"§e船长吹响哨子：速度II + 力量I，持续15秒。","color":"yellow"}

scoreboard players operation @s skill.whistle_cd = #cooldown skill.whistle_cfg
function skill:captain/whistle/update_item
