scoreboard players set #loaded skill.ak47_tmp 0
execute if score @s skill.ak47_mag matches ..29 store result score #loaded skill.ak47_tmp run clear @s minecraft:iron_nugget[minecraft:custom_data~{ammo:"7.62"}] 1
execute if score #loaded skill.ak47_tmp matches 1.. run scoreboard players add @s skill.ak47_mag 1
