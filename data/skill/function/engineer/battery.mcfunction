advancement revoke @s only skill:engineer/battery
execute if score @s cd_engineer matches 1.. run return 0
execute if entity @e[tag=entity.engineer_battery,limit=1] run tellraw @s {"text":"§c电池已在场上，请先回收。","color":"red"}
execute if entity @e[tag=entity.engineer_battery,limit=1] run return 0

scoreboard players set @s cd_engineer 60

execute at @s run summon minecraft:marker ~ ~ ~ {Tags:["entity.engineer_battery"],data:{owner_cd:"cd_engineer"}}
scoreboard players set $battery_timer gen_progress 1200

tellraw @s {"text":"§6电池已部署，60秒内修复速度+200%。","color":"yellow"}
