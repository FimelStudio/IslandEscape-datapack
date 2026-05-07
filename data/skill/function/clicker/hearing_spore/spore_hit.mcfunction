$function escape_island:infection/add_spore_load {amount:$(spore_value)}
tag @e[type=minecraft:marker,tag=entity.clicker_spore,distance=..0.15,sort=nearest,limit=1] add skill.clicker_spore.dead
title @s actionbar {"text":"循声孢子命中：孢子污染上升","color":"dark_green"}
playsound minecraft:block.fungus.break master @a[distance=..16] ~ ~ ~ 0.8 0.9
particle minecraft:spore_blossom_air ~ ~ ~ 0.45 0.45 0.45 0.04 24 force @a[distance=..24]
