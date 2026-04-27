advancement revoke @s only skill:mechanic/trap

execute if entity @e[tag=entity.mechanic_trap,limit=3] run tellraw @s {"text":"§c陷阱数量已达上限（3）。","color":"red"}
execute if entity @e[tag=entity.mechanic_trap,limit=3] run return 0

scoreboard players set @s cd_mechanic 90
execute at @s run summon minecraft:marker ~ ~ ~ {Tags:["entity.mechanic_trap"]}
tellraw @s {"text":"§7机关陷阱已部署。","color":"gray"}
