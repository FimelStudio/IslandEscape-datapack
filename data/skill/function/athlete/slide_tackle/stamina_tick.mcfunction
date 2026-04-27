execute unless entity @s[tag=slide_stamina_init] run function skill:athlete/slide_tackle/stamina_init_player
scoreboard players add @s skill.stamina 0
scoreboard players add @s skill.stamina_warn 0

execute if score @s skill.stamina < #max skill.stamina_cfg run scoreboard players operation @s skill.stamina += #regen skill.stamina_cfg
execute if score @s skill.stamina > #max skill.stamina_cfg run scoreboard players operation @s skill.stamina = #max skill.stamina_cfg
execute if score @s skill.stamina matches ..-1 run scoreboard players set @s skill.stamina 0
