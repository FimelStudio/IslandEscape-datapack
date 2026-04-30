execute unless entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,scores={gen_state=2..3},limit=1] run title @s actionbar {"text":"发电机无需维修","color":"gray"}
execute unless entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,scores={gen_state=2..3},limit=1] run return 0

execute if entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,scores={gen_state=2,gen_overload=0},limit=1] run title @s actionbar {"text":"发电机运行正常","color":"green"}
execute if entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,scores={gen_state=2,gen_overload=0},limit=1] run return 0

title @s actionbar {"text":"手持发电机交互器，对准发电机按住右键维修","color":"green"}
