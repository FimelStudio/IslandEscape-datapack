tag @s add chef
effect give @s minecraft:night_vision 3 0 true
# 厨师被动: 5格内队友获得热餐护盾
execute as @a[tag=role.survivor,tag=!role.chef,distance=..5] run effect give @s minecraft:absorption 3 0 true
