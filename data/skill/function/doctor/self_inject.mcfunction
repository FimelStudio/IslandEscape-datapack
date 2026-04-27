advancement revoke @s only skill:doctor/inject

execute unless entity @s[tag=state.infected_period] run return 0
execute if entity @s[tag=flag.self_injected_this_period] run tellraw @s {"text":"§c每个感染期只能自救一次。","color":"red"}
execute if entity @s[tag=flag.self_injected_this_period] run return 0

tag @s add flag.self_injected_this_period
function escape_island:infection/cure

scoreboard players set @s cd_doctor 90
