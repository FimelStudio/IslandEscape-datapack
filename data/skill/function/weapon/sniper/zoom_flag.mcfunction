advancement revoke @s only skill:weapon/sniper/zoom
scoreboard players set @s skill.sniper_zoom_flag 1
tag @s add sniper.zooming
execute if predicate skill:is_sneak if score @s skill.sniper_cd matches ..0 if score @s skill.sniper_mag matches 1.. run function skill:weapon/sniper/fire
