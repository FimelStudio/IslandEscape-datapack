execute if entity @s[tag=state.dead] run return 0
tag @s add state.dead
execute at @s run summon minecraft:marker ~ ~ ~ {Tags:["entity.dead_anchor"]}
gamemode adventure @s
attribute @s minecraft:movement_speed base set 0
effect give @s minecraft:invisibility 999 0 true
effect give @s minecraft:darkness 999 0 true
effect give @s minecraft:resistance 999 255 true

execute if entity @e[tag=infected.mother,tag=!state.dead] unless score $game mother_dead matches 1 run scoreboard players operation @s mother_respawn = Tunable tunable.spore_respawn_seconds
execute if entity @e[tag=infected.mother,tag=!state.dead] unless score $game mother_dead matches 1 if entity @s[tag=retained.priest] run scoreboard players add @s mother_respawn 10
execute if entity @e[tag=infected.mother,tag=!state.dead] unless score $game mother_dead matches 1 run title @s title {"text":"§4倒下","bold":true}
execute if entity @e[tag=infected.mother,tag=!state.dead] unless score $game mother_dead matches 1 run title @s subtitle [{"text":"感染者复活倒计时: ","color":"red"},{"score":{"name":"@s","objective":"mother_respawn"}},{"text":"秒","color":"red"}]

execute unless entity @e[tag=infected.mother,tag=!state.dead] run scoreboard players set @s mother_respawn -1
execute if score $game mother_dead matches 1 run scoreboard players set @s mother_respawn -1

execute unless entity @e[tag=infected.mother,tag=!state.dead] run title @s title {"text":"§8永久倒下","bold":true}
execute if score $game mother_dead matches 1 run title @s title {"text":"§8永久倒下","bold":true}

execute unless entity @e[tag=infected.mother,tag=!state.dead] run title @s subtitle {"text":"§7母体已消亡，你也随之沉寂。","italic":true}
execute if score $game mother_dead matches 1 run title @s subtitle {"text":"§7母体已消亡，你也随之沉寂。","italic":true}
