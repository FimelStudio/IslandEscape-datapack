scoreboard players remove @s skill.adren_cd 1
execute if score @s skill.adren_cd matches 1.. run function skill:athlete/adrenaline/update_cooldown_second
execute if score @s skill.adren_cd matches ..0 unless entity @s[tag=skill.adrenaline.active] run function skill:athlete/adrenaline/cooldown_end
