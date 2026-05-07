execute as @a[tag=skill.soup.target,limit=1] run effect give @s minecraft:instant_health 1 3 true
execute as @a[tag=skill.soup.target,limit=1] run effect give @s minecraft:saturation 2 1 true
execute as @a[tag=skill.soup.target,tag=state.infected_period,limit=1] run scoreboard players operation @s infect_time += #infect_pause skill.soup_cfg
execute as @a[tag=skill.soup.target,tag=state.infected_period,limit=1] if score @s infect_time > Tunable tunable.infection_seconds run scoreboard players operation @s infect_time = Tunable tunable.infection_seconds
execute as @a[tag=skill.soup.target,limit=1] at @s run playsound minecraft:entity.generic.drink player @s ~ ~ ~ 0.9 1.2 1
execute as @a[tag=skill.soup.target,limit=1] at @s run particle minecraft:heart ~ ~1.2 ~ 0.35 0.35 0.35 0.02 8 force @s
execute as @a[tag=skill.soup.target,limit=1] at @s run particle minecraft:happy_villager ~ ~1 ~ 0.45 0.35 0.45 0.04 18 force @s

execute if entity @a[tag=skill.soup.target,tag=skill.soup.user,limit=1] run tellraw @s {"text":"§a热汤生效：回复4心。","color":"green"}
execute if entity @a[tag=skill.soup.target,tag=state.infected_period,tag=skill.soup.user,limit=1] run tellraw @s {"text":"§e感染期缓冲 +8 秒。","color":"yellow"}
execute unless entity @a[tag=skill.soup.target,tag=skill.soup.user,limit=1] run tellraw @s {"text":"§a你把热汤递给了附近队友。","color":"green"}
execute unless entity @a[tag=skill.soup.target,tag=skill.soup.user,limit=1] as @a[tag=skill.soup.target,limit=1] run tellraw @s {"text":"§a队友给你热汤：回复4心。","color":"green"}
execute unless entity @a[tag=skill.soup.target,tag=skill.soup.user,limit=1] as @a[tag=skill.soup.target,tag=state.infected_period,limit=1] run tellraw @s {"text":"§e感染期缓冲 +8 秒。","color":"yellow"}

scoreboard players operation @s skill.soup_cd = #cooldown skill.soup_cfg
function skill:chef/hot_soup/update_item
