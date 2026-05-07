title @s title {"text":"§4§l第一名感染者","bold":true}
title @s subtitle {"text":"§8感染链已经接通。"}
tellraw @s {"text":"§4[母体] 第一名感染者已就位。现在可以开始制造复活压力。","color":"dark_red"}
playsound minecraft:entity.warden.roar player @s ~ ~ ~ 0.8 0.7
effect give @s minecraft:darkness 2 0 true
