clear @s minecraft:echo_shard[minecraft:custom_data={skill:"clicker_hearing_spore"}]
clear @s minecraft:sugar[minecraft:custom_data={skill:"clicker_hearing_spore_used"}]
tag @s remove skill.clicker_spore.detected
tag @s remove skill.clicker_spore.caster
tag @s remove skill.clicker_spore.active
tag @s remove skill.clicker_spore.target
scoreboard players set @s skill.clicker_cd 0
scoreboard players set @s skill.clicker_state 0
