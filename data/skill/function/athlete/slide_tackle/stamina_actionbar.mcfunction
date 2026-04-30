scoreboard players operation @s skill.stamina_bar = @s skill.stamina
scoreboard players operation @s skill.stamina_bar *= #bar_parts skill.stamina_cfg
scoreboard players operation @s skill.stamina_bar /= #max skill.stamina_cfg
execute if score @s skill.stamina_bar matches ..-1 run scoreboard players set @s skill.stamina_bar 0
execute if score @s skill.stamina_bar > #bar_parts skill.stamina_cfg run scoreboard players operation @s skill.stamina_bar = #bar_parts skill.stamina_cfg
scoreboard players operation #low skill.stamina_cfg = @s skill.slide_cost
scoreboard players operation #low skill.stamina_cfg *= #two skill.stamina_cfg
scoreboard players set @s skill.stamina_color 0
execute if score @s skill.stamina < #low skill.stamina_cfg run scoreboard players set @s skill.stamina_color 1
execute if score @s skill.stamina < @s skill.slide_cost run scoreboard players set @s skill.stamina_color 2
execute if score @s skill.stamina_warn matches 1.. run scoreboard players set @s skill.stamina_color 2

execute unless score @s skill.stamina = #max skill.stamina_cfg run tag @s add skill.slide.stamina.showing
execute if score @s skill.stamina_warn matches 1.. run tag @s add skill.slide.stamina.showing

execute if entity @s[tag=skill.slide.stamina.showing] unless score @s skill.stamina = #max skill.stamina_cfg run function skill:athlete/slide_tackle/stamina_actionbar_render
execute if score @s skill.stamina = #max skill.stamina_cfg if score @s skill.stamina_warn matches 1.. run function skill:athlete/slide_tackle/stamina_actionbar_render
execute if score @s skill.stamina = #max skill.stamina_cfg unless score @s skill.stamina_warn matches 1.. if entity @s[tag=skill.slide.stamina.showing] run title @s actionbar {"text":""}
execute if score @s skill.stamina = #max skill.stamina_cfg unless score @s skill.stamina_warn matches 1.. run tag @s remove skill.slide.stamina.showing

execute if score @s skill.stamina_warn matches 1.. run scoreboard players remove @s skill.stamina_warn 1
