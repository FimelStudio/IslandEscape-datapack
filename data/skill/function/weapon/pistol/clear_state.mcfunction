advancement revoke @s only skill:weapon/pistol/use
clear @s minecraft:paper[minecraft:custom_data~{weapon:"pistol_used"}]
tag @s remove skill.pistol.reloading
tag @s remove skill.pistol.holding
tag @s remove skill.pistol.xp
scoreboard players set @s skill.pistol_mag 0
scoreboard players set @s skill.pistol_fire_cd 0
scoreboard players set @s skill.pistol_reload 0
scoreboard players set @s skill.pistol_swap 0
experience set @s 0 levels
experience set @s 0 points
