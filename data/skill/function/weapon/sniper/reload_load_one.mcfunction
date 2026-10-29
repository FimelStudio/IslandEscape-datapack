# 一颗物品对应一发子弹；不会超过弹匣容量。
execute unless score @s skill.sniper_mag matches ..4 run return 0
execute store success score #has_ammo skill.sniper_cd run clear @s minecraft:arrow[minecraft:custom_data~{ammo:"sniper_round"}] 1
execute if score #has_ammo skill.sniper_cd matches 1 run scoreboard players add @s skill.sniper_mag 1
