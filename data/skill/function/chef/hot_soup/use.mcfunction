advancement revoke @s only skill:chef/hot_soup/use
clear @s minecraft:sugar[custom_data={skill:"cook_soup_used"}]

execute unless entity @s[tag=role.chef] run function skill:chef/hot_soup/cleanup_non_chef
execute unless entity @s[tag=role.chef] run return 0

execute if score @s skill.soup_cd matches 1.. run title @s actionbar {"text":"热汤冷却中","color":"yellow"}
execute if score @s skill.soup_cd matches 1.. run function skill:chef/hot_soup/update_item
execute if score @s skill.soup_cd matches 1.. run return 0

function skill:chef/hot_soup/start
