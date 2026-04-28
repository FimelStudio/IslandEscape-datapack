execute if score @s ie.dialog matches 101 run tellraw @s {"text":"地图音乐设置暂未接入。","color":"gray"}
execute if score @s ie.dialog matches 102 run tellraw @s {"text":"地图音乐设置暂未接入。","color":"gray"}
execute if score @s ie.dialog matches 103 run tellraw @s {"text":"返回大厅功能暂未接入。","color":"gray"}

execute if score @s ie.dialog matches 301 run tellraw @s {"text":"潜伏宿主/次级母体: 高人数局的隐藏变体，觉醒前按幸存者行动。","color":"dark_purple"}
execute if score @s ie.dialog matches 302 run tellraw @s {"text":"特殊感染体介绍暂未接入。","color":"dark_red"}

scoreboard players reset @s ie.dialog
