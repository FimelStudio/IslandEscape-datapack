advancement revoke @s only skill:weapon/ak47/use
clear @s minecraft:paper[minecraft:custom_data~{weapon:"ak47_used"}]
tag @s remove skill.ak47.reloading
tag @s remove skill.ak47.holding
tag @s remove skill.ak47.xp
scoreboard players set @s skill.ak47_mag 0
scoreboard players set @s skill.ak47_fire_cd 0
scoreboard players set @s skill.ak47_reload 0
scoreboard players set @s skill.ak47_reload_sec 0
scoreboard players set @s skill.ak47_reload_cs 0
scoreboard players set @s skill.ak47_reload_frac 0
scoreboard players set @s skill.ak47_swap 0
experience set @s 0 levels
experience set @s 0 points
