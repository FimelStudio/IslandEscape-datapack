clear @s minecraft:echo_shard[minecraft:custom_data~{skill:"radio_jam"}]
scoreboard players operation @s skill.radio_jam_sec = @s skill.radio_jam_cd
scoreboard players operation @s skill.radio_jam_sec /= #twenty skill.radio_jam_cfg
execute store result storage skill:radio.jam item.sec int 1 run scoreboard players get @s skill.radio_jam_sec

execute if score @s skill.radio_jam_cd matches 1.. run scoreboard players set @s skill.radio_jam_state 2
execute if score @s skill.radio_jam_cd matches 1.. run function skill:radio/jam/item_cooldown with storage skill:radio.jam item
execute unless score @s skill.radio_jam_cd matches 1.. run scoreboard players set @s skill.radio_jam_state 1
execute unless score @s skill.radio_jam_cd matches 1.. run function skill:radio/jam/item_ready
