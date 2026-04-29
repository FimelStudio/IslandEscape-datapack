scoreboard players set #loaded skill.pistol_tmp 0
execute if score @s skill.pistol_mag matches ..7 store result score #loaded skill.pistol_tmp run clear @s minecraft:iron_nugget[minecraft:custom_data~{ammo:1}] 1
execute if score #loaded skill.pistol_tmp matches 1.. run scoreboard players add @s skill.pistol_mag 1
