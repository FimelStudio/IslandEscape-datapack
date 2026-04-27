advancement revoke @s only skill:mother/lunge
execute if score @s cd_mother_lunge matches 1.. run return 0

scoreboard players set @s cd_mother_lunge 20
execute at @s run function skill:mother/_lunge_launch
