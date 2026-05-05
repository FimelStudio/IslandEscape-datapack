advancement revoke @s only skill:mother/mutate
execute if entity @s[tag=state.mutated] run return 0

tag @s add state.mutated
team join mother @s
gamerule pvp true

tellraw @a {"text":"§4§l母体已变异！§r 伪装脱落，猎手现身。所有幸存者，快跑！","color":"dark_red","bold":true}
playsound minecraft:entity.warden.roar master @a ~ ~ ~ 1 0.6
title @s title {"text":"§4§l变异完成","bold":true}
title @s subtitle {"text":"§c伪装已脱落。猎杀开始。"}
clear @s minecraft:sugar[minecraft:custom_data~{weapon:"pistol"}]
clear @s minecraft:paper[minecraft:custom_data~{weapon:"pistol_used"}]
clear @s minecraft:iron_axe
clear @s minecraft:iron_sword
clear @s minecraft:iron_nugget[minecraft:custom_data={ammo:1}]
attribute @s minecraft:attack_damage base set 4
effect give @s minecraft:resistance 60 5 true
effect give @s minecraft:speed 60 0 true
effect give @s minecraft:strength 60 0 true
