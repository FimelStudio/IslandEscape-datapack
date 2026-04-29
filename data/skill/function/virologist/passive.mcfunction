tag @s add skill.viro_viewer
scoreboard players set @s skill.viro_passive_cd 10
execute as @a[tag=role.mother,tag=!state.dead,distance=5..8] at @s run particle minecraft:dust{color:[1.0,0.84,0.0],scale:0.5} ~ ~1 ~ 0.4 0.3 0.4 0.01 2 force @a[tag=skill.viro_viewer,limit=1]
execute as @a[tag=role.mother,tag=!state.dead,distance=..4] at @s run particle minecraft:dust{color:[1.0,0.84,0.0],scale:1.0} ~ ~1 ~ 0.45 0.35 0.45 0.01 10 force @a[tag=skill.viro_viewer,limit=1]
execute as @e[tag=test.dummy,tag=role.mother,distance=5..8] at @s run particle minecraft:dust{color:[1.0,0.84,0.0],scale:0.5} ~ ~1 ~ 0.4 0.3 0.4 0.01 2 force @a[tag=skill.viro_viewer,limit=1]
execute as @e[tag=test.dummy,tag=role.mother,distance=..4] at @s run particle minecraft:dust{color:[1.0,0.84,0.0],scale:1.0} ~ ~1 ~ 0.45 0.35 0.45 0.01 10 force @a[tag=skill.viro_viewer,limit=1]
execute if entity @a[tag=role.mother,tag=!state.dead,distance=..4] run playsound minecraft:block.beacon.ambient player @s ~ ~ ~ 0.3 0.5
execute if entity @e[tag=test.dummy,tag=role.mother,distance=..4] run playsound minecraft:block.beacon.ambient player @s ~ ~ ~ 0.3 0.5
tag @s remove skill.viro_viewer
