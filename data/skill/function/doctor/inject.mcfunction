advancement revoke @s only skill:doctor/inject

execute if score @s cd_doctor matches 1.. run tellraw @s {"text":"§c解毒针冷却中。","color":"red"}
execute if score @s cd_doctor matches 1.. run return 0

execute unless entity @s[tag=flag.has_inject] run return 0

execute as @p[tag=state.infected_period,tag=!role.doctor,distance=..5,sort=nearest,limit=1] run function skill:doctor/_inject_target

scoreboard players set @s cd_doctor 90
