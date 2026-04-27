scoreboard players operation @s skill.whistle_sec = @s skill.whistle_cd
scoreboard players operation @s skill.whistle_sec /= #twenty skill.whistle_cfg
execute store result storage skill:captain.whistle item.sec int 1 run scoreboard players get @s skill.whistle_sec

execute if score @s skill.whistle_cd matches 1.. run scoreboard players set @s skill.whistle_state 2
execute if score @s skill.whistle_cd matches 1.. run function skill:captain/whistle/item_cooldown with storage skill:captain.whistle item
execute unless score @s skill.whistle_cd matches 1.. run scoreboard players set @s skill.whistle_state 1
execute unless score @s skill.whistle_cd matches 1.. run function skill:captain/whistle/item_ready
