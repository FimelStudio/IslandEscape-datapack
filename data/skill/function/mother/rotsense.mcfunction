clear @s minecraft:gunpowder[minecraft:custom_data={skill:"mother/rotsense_used"}] 1
advancement revoke @s only skill:mother/rotsense

execute if score @s cd_mother_rotsense matches 1.. run return 0

scoreboard players operation @s cd_mother_rotsense = Tunable tunable.rotsense_cd

execute at @a[tag=team.human,distance=..40] run particle minecraft:dust{color:[0.9,0.1,0.1],scale:3} ~ ~1.5 ~ 0.6 0.4 0.6 0.01 10 force @a[tag=infected.mother,distance=..60]
execute at @a[tag=team.human,distance=..40] run particle minecraft:dust{color:[0.6,0.1,0.1],scale:2} ~ ~0.5 ~ 0.4 0.2 0.4 0.01 6 force @a[tag=infected.mother,distance=..60]

playsound minecraft:entity.spider.ambient master @a ~ ~ ~ 0.5 0.3
tellraw @a {"text":"§7一股腐臭的气息弥漫开来……有人在附近留下了痕迹。","color":"gray","italic":true}
