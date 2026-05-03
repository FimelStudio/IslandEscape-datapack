execute if entity @s[tag=infected.mother] run function escape_island:infection/mother_death

kill @e[tag=dev.mother_sim]

scoreboard players set $game mother_dead 1
tellraw @a {"text":"⚡ 母巢崩坏（测试模拟）— 母体已消亡，感染者将失去复活能力。","color":"dark_red","bold":true}
tellraw @a[tag=team.human] {"text":"⚡ 核心母体已消亡！猎杀所有感染者以获胜！","color":"gold"}
playsound minecraft:entity.warden.death master @a ~ ~ ~ 1 0.7
