execute unless entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,scores={gen_state=2},limit=1] run title @s actionbar {"text":"只能破坏正在稳定运行的发电机","color":"gray"}
execute unless entity @e[type=minecraft:marker,tag=marker.generator,tag=gen.aimed,distance=..3,scores={gen_state=2},limit=1] run return 0

title @s actionbar {"text":"手持发电机交互器，对准发电机按住右键破坏","color":"red"}
