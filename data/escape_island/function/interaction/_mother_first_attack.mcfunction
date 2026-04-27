execute if entity @s[tag=flag.first_attack] run return 0
tag @s add flag.first_attack
tellraw @a [{"text":"丛林深处传来嚎叫……","color":"dark_red","bold":true},{"text":"有人遭受了突袭。","color":"gray"}]
playsound minecraft:entity.wither.ambient master @a ~ ~ ~ 0.6 0.7
