advancement revoke @s only skill:marine/gun_mastery/use

execute unless entity @s[tag=role.marine] run return 0
execute unless items entity @s weapon.mainhand minecraft:sugar[minecraft:custom_data~{weapon:"pistol"}] run return 0
execute unless predicate skill:is_sneak run return 0

execute if score @s skill.gm_input_cd matches 1.. run return 0
scoreboard players set @s skill.gm_input_cd 8

execute if score @s skill.gm_burst matches 1.. run title @s actionbar {"text":"枪械精通连射中","color":"yellow"}
execute if score @s skill.gm_burst matches 1.. run return 0

scoreboard players set @s skill.gm_runtime 0
execute if score @s skill.gm_runtime matches 0 if score @s skill.pistol_mag matches 8 run function skill:marine/gun_mastery/start_8
execute if score @s skill.gm_runtime matches 0 if score @s skill.pistol_mag matches 7 run function skill:marine/gun_mastery/start_7
execute if score @s skill.gm_runtime matches 0 if score @s skill.pistol_mag matches 6 run function skill:marine/gun_mastery/start_6
execute if score @s skill.gm_runtime matches 0 if score @s skill.pistol_mag matches 5 run function skill:marine/gun_mastery/start_5
execute if score @s skill.gm_runtime matches 0 if score @s skill.pistol_mag matches 4 run function skill:marine/gun_mastery/start_4
execute if score @s skill.gm_runtime matches 0 if score @s skill.pistol_mag matches 3 run function skill:marine/gun_mastery/start_3
execute if score @s skill.gm_runtime matches 0 if score @s skill.pistol_mag matches 2 run function skill:marine/gun_mastery/start_2
execute if score @s skill.gm_runtime matches 0 if score @s skill.pistol_mag matches 1 run function skill:marine/gun_mastery/start_1
execute if score @s skill.gm_runtime matches 0 if score @s skill.pistol_mag matches ..0 run function skill:marine/gun_mastery/empty
