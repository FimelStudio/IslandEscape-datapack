tag @s add skill.pistol_xp
experience set @s 1 levels
execute if score @s skill.pistol_mag matches ..0 run experience set @s 0 points
execute if score @s skill.pistol_mag matches 1 run experience set @s 1 points
execute if score @s skill.pistol_mag matches 2 run experience set @s 2 points
execute if score @s skill.pistol_mag matches 3 run experience set @s 3 points
execute if score @s skill.pistol_mag matches 4 run experience set @s 4 points
execute if score @s skill.pistol_mag matches 5 run experience set @s 5 points
execute if score @s skill.pistol_mag matches 6 run experience set @s 6 points
execute if score @s skill.pistol_mag matches 7 run experience set @s 7 points
execute if score @s skill.pistol_mag matches 8.. run experience set @s 8 points
