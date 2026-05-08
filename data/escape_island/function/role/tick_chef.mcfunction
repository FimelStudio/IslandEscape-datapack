tag @s add role.chef
effect give @s minecraft:night_vision 3 0 true
# 厨师被动：8 格内队友获得热餐护盾，每 5 秒刷新一次
execute if score @s cd_chef matches ..0 as @a[tag=team.human,tag=!role.chef,distance=..8] run effect give @s minecraft:absorption 6 0 true
execute if score @s cd_chef matches ..0 run scoreboard players set @s cd_chef 5
