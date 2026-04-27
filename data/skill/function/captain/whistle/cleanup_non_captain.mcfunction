advancement revoke @s only skill:captain/whistle/use
clear @s minecraft:goat_horn[custom_data={skill:"captain_whistle"}]
clear @s minecraft:sugar[custom_data={skill:"captain_whistle"}]
scoreboard players set @s skill.whistle_cd 0
scoreboard players set @s skill.whistle_item 0
scoreboard players set @s skill.whistle_state 0
scoreboard players set @s skill.whistle_sec 0
scoreboard players set @s skill.whistle_last_sec 0
