# 记录当前幸存者职业，供感染阵营的继承能力使用；不改变现有职业。
execute if entity @s[tag=role.doctor] run tag @s add retained.doctor
execute if entity @s[tag=role.captain] run tag @s add retained.captain
execute if entity @s[tag=role.engineer] run tag @s add retained.engineer
execute if entity @s[tag=role.marine] run tag @s add retained.marine
execute if entity @s[tag=role.chef] run tag @s add retained.chef
execute if entity @s[tag=role.radio] run tag @s add retained.radio
execute if entity @s[tag=role.virologist] run tag @s add retained.virologist
execute if entity @s[tag=role.mechanic] run tag @s add retained.mechanic
execute if entity @s[tag=role.athlete] run tag @s add retained.athlete
execute if entity @s[tag=role.priest] run tag @s add retained.priest
