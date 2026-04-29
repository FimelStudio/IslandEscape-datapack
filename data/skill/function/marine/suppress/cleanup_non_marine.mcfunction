advancement revoke @s only skill:marine/suppress/use
clear @s minecraft:crossbow[minecraft:custom_data~{skill:"marine_suppress"}]
clear @s minecraft:crossbow[custom_data={role_item:"marine.suppress"}]
scoreboard players set @s skill.suppress_cd 0
scoreboard players set @s skill.suppress_item 0
scoreboard players set @s skill.suppress_state 0
