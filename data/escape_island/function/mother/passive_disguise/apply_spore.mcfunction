scoreboard players operation @s spore_load += Tunable tunable.mother_passive_pulse_dmg
execute if entity @s[tag=state.infection_resist] run function escape_island:infection/_resist_reduce
scoreboard players set @s spore_decay_cd 15
execute if entity @s[tag=role.doctor] if score @s spore_load >= Tunable tunable.doctor_spore_threshold run function escape_island:infection/_enter_period
execute unless entity @s[tag=role.doctor] if score @s spore_load >= Tunable tunable.spore_threshold run function escape_island:infection/_enter_period
execute if score @s cd_aura_heartbeat matches ..0 run playsound minecraft:entity.warden.heartbeat player @s ~ ~ ~ 0.15 0.8 1
execute if score @s cd_aura_heartbeat matches ..0 run title @s actionbar {"text":"§8心口像被潮湿的雾压了一下。","color":"dark_gray"}
execute if score @s cd_aura_heartbeat matches ..0 run scoreboard players set @s cd_aura_heartbeat 4
