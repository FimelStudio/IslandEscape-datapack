# escape_island:skill/mother_lunge  —  猎食冲刺
advancement revoke @s only escape_island:skill/mother_lunge
execute if score @s cd_mother_lunge matches 1.. run return 0

scoreboard players set @s cd_mother_lunge 20
# Launch 8 blocks forward (boost velocity)
execute at @s run function escape_island:skill/_lunge_launch
