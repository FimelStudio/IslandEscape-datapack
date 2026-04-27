execute if score @s skill.adren_time matches 21.. run function skill:athlete/adrenaline/effect
execute if score @s skill.adren_time matches 1.. run scoreboard players remove @s skill.adren_time 1
execute if score @s skill.adren_time matches ..0 run function skill:athlete/adrenaline/end
