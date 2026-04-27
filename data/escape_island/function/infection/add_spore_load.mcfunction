
$scoreboard players add @s spore_load $(amount)

execute if entity @s[tag=state.infection_resist] run function escape_island:infection/_resist_reduce

scoreboard players set @s spore_decay_cd 15

execute if entity @s[tag=role.doctor] if score @s spore_load >= Tunable tunable.doctor_spore_threshold run function escape_island:infection/_enter_period
execute unless entity @s[tag=role.doctor] if score @s spore_load >= Tunable tunable.spore_threshold run function escape_island:infection/_enter_period
