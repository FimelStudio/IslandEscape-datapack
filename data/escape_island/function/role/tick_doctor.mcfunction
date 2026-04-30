# 船医被动: 5格内队友回血+50%; 自身孢子阈值130
tag @s add role.doctor
execute as @a[tag=team.human,tag=!role.doctor,distance=..5] run effect give @s minecraft:regeneration 2 0 true

