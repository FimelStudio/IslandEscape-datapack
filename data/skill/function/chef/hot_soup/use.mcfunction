advancement revoke @s only skill:chef/hot_soup/use
clear @s minecraft:sugar[custom_data={skill:"cook_soup_used"}]

execute unless entity @s[tag=role.chef] run function skill:chef/hot_soup/cleanup_non_chef
execute unless entity @s[tag=role.chef] run return 0

execute if score @s skill.soup_cd matches 1.. run title @s actionbar {"text":"热汤冷却中","color":"yellow"}
execute if score @s skill.soup_cd matches 1.. run function skill:chef/hot_soup/update_item
execute if score @s skill.soup_cd matches 1.. run return 0

tag @a[tag=ie.active] remove skill.soup.target
tag @a[tag=ie.active] remove skill.soup.user
execute at @s as @a[tag=ie.active,tag=team.human,tag=!state.dead,tag=!state.escaped,tag=!state.spectator,distance=..8] store result score @s hp_current run data get entity @s Health 1

tag @s add skill.soup.user
execute at @s as @a[tag=ie.active,tag=team.human,tag=state.infected_period,tag=!state.dead,tag=!state.escaped,tag=!state.spectator,tag=!skill.soup.user,distance=..5,sort=nearest,limit=1] run tag @s add skill.soup.target
execute unless entity @a[tag=ie.active,tag=skill.soup.target,limit=1] at @s as @a[tag=ie.active,tag=team.human,tag=!state.dead,tag=!state.escaped,tag=!state.spectator,tag=!skill.soup.user,scores={hp_current=..8},distance=..5,sort=nearest,limit=1] run tag @s add skill.soup.target
execute unless entity @a[tag=ie.active,tag=skill.soup.target,limit=1] run tag @s add skill.soup.target

execute if entity @a[tag=ie.active,tag=skill.soup.target,limit=1] run function skill:chef/hot_soup/start

tag @s remove skill.soup.user
tag @a[tag=ie.active] remove skill.soup.target
