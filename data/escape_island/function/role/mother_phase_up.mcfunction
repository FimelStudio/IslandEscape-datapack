scoreboard players add @s mother_phase 1
scoreboard players set @s mother_phase_timer 0

execute if score @s mother_phase matches 2 if score Tunable tunable.mother_hp matches 60 run attribute @s minecraft:max_health base set 65
execute if score @s mother_phase matches 2 if score Tunable tunable.mother_hp matches 70 run attribute @s minecraft:max_health base set 75
execute if score @s mother_phase matches 2 unless score Tunable tunable.mother_hp matches 60 unless score Tunable tunable.mother_hp matches 70 run attribute @s minecraft:max_health base set 65
execute if score @s mother_phase matches 2 if score Tunable tunable.mother_hp matches 60 run scoreboard players set @s mother_hp 65
execute if score @s mother_phase matches 2 if score Tunable tunable.mother_hp matches 70 run scoreboard players set @s mother_hp 75
execute if score @s mother_phase matches 2 unless score Tunable tunable.mother_hp matches 60 unless score Tunable tunable.mother_hp matches 70 run scoreboard players set @s mother_hp 65
execute if score @s mother_phase matches 2 run scoreboard players operation @s mother_last_hp = @s mother_hp
execute if score @s mother_phase matches 2 run effect give @s minecraft:instant_health 1 10 true
execute if score @s mother_phase matches 2 run title @s actionbar {"text":"§4▲ 力量在增长 §8(+5 HP / 感知冷却缩短)","color":"dark_red"}
execute if score @s mother_phase matches 2 run playsound minecraft:ambient.cave player @s ~ ~ ~ 0.6 0.8

execute if score @s mother_phase matches 3 run title @s actionbar {"text":"§4▲ 爪牙更加锋利 §8(攻击加速 / 嚎叫增强)","color":"dark_red"}
execute if score @s mother_phase matches 3 run playsound minecraft:ambient.cave player @s ~ ~ ~ 0.6 0.8

execute if score @s mother_phase matches 4 if score Tunable tunable.mother_hp matches 60 run attribute @s minecraft:max_health base set 75
execute if score @s mother_phase matches 4 if score Tunable tunable.mother_hp matches 70 run attribute @s minecraft:max_health base set 85
execute if score @s mother_phase matches 4 unless score Tunable tunable.mother_hp matches 60 unless score Tunable tunable.mother_hp matches 70 run attribute @s minecraft:max_health base set 75
execute if score @s mother_phase matches 4 if score Tunable tunable.mother_hp matches 60 run scoreboard players set @s mother_hp 75
execute if score @s mother_phase matches 4 if score Tunable tunable.mother_hp matches 70 run scoreboard players set @s mother_hp 85
execute if score @s mother_phase matches 4 unless score Tunable tunable.mother_hp matches 60 unless score Tunable tunable.mother_hp matches 70 run scoreboard players set @s mother_hp 75
execute if score @s mother_phase matches 4 run scoreboard players operation @s mother_last_hp = @s mother_hp
execute if score @s mother_phase matches 4 run effect give @s minecraft:instant_health 1 10 true
execute if score @s mother_phase matches 4 run title @s actionbar {"text":"§4▲ 完全进化 §8(+10 HP / 感染者脉冲)","color":"dark_red"}
execute if score @s mother_phase matches 4 run playsound minecraft:entity.wither.ambient player @s ~ ~ ~ 0.8 0.7
execute if score @s mother_phase matches 4 run tellraw @a {"text":"§4那东西……已经彻底醒过来了。","color":"dark_red","italic":true}
