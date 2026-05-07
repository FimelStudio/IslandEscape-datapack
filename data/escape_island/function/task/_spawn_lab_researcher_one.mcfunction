summon minecraft:zombie ~ ~ ~ {Tags:["entity.researcher","mob.lab_researcher"],CustomName:{"text":"感染研究员","color":"dark_purple","italic":true},CustomNameVisible:1b,Attributes:[{Name:"minecraft:max_health",Base:30f},{Name:"minecraft:attack_damage",Base:5f},{Name:"minecraft:movement_speed",Base:0.23f}],Health:30f,HandItems:[{id:"minecraft:iron_sword",count:1}],ArmorItems:[{},{},{},{id:"minecraft:chainmail_helmet",count:1}],PersistenceRequired:1b,CanBreakDoors:0b,IsBaby:0b}
tag @s add lab.spawn_used
scoreboard players remove $lab lab_spawn_left 1
scoreboard players add $lab_spawned test_count 1
