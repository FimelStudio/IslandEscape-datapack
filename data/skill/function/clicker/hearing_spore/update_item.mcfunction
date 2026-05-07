clear @s minecraft:echo_shard[minecraft:custom_data={skill:"clicker_hearing_spore"}]
execute store result storage skill:clicker.hearing_spore item.sec int 1 run scoreboard players get @s skill.clicker_cd
scoreboard players operation @s skill.clicker_sec = @s skill.clicker_cd
scoreboard players operation @s skill.clicker_sec /= #twenty skill.clicker_cfg
execute store result storage skill:clicker.hearing_spore item.sec int 1 run scoreboard players get @s skill.clicker_sec

execute if score @s skill.clicker_cd matches 1.. run scoreboard players set @s skill.clicker_state 2
execute if score @s skill.clicker_cd matches 1.. run function skill:clicker/hearing_spore/item_cooldown with storage skill:clicker.hearing_spore item
execute unless score @s skill.clicker_cd matches 1.. run scoreboard players set @s skill.clicker_state 1
execute unless score @s skill.clicker_cd matches 1.. run function skill:clicker/hearing_spore/item_ready
