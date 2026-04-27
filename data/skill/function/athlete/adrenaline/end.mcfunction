tag @s remove adren_active
scoreboard players set @s skill.adren_time 0
execute unless score @s skill.adren_cd matches 1.. run function skill:athlete/adrenaline/cooldown_end
