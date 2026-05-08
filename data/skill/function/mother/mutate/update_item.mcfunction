clear @s minecraft:phantom_membrane[minecraft:custom_data={skill:"mother/mutate"}]
clear @s minecraft:gray_dye[minecraft:custom_data={skill:"mother/mutate_cd"}]
clear @s minecraft:red_dye[minecraft:custom_data={skill:"mother/mutate_hunt"}]

execute store result storage skill:mother.mutate item.sec int 1 run scoreboard players get @s skill.mutate_sec

execute if entity @s[tag=state.hunting] run function skill:mother/mutate/item_hunt with storage skill:mother.mutate item
execute unless entity @s[tag=state.hunting] if score @s cd_mother_mutate matches 1.. run function skill:mother/mutate/item_cooldown with storage skill:mother.mutate item
execute unless entity @s[tag=state.hunting] unless score @s cd_mother_mutate matches 1.. run function skill:mother/mutate_item
