kill @e[type=minecraft:interaction,tag=entity.helicopter_door]
kill @e[tag=entity.helicopter_door_hint]
kill @e[type=minecraft:interaction,tag=entity.helicopter_boarding]
kill @e[tag=entity.helicopter_boarding_hint]

execute at @e[tag=entity.helicopter,sort=nearest,limit=1] run summon minecraft:interaction ~ ~ ~ {Tags:["entity.helicopter_boarding"],width:7.0f,height:4.0f,response:1b}
execute at @e[tag=entity.helicopter,sort=nearest,limit=1] run summon minecraft:text_display ~ ~3 ~ {Tags:["entity.helicopter_boarding_hint"],billboard:"center",see_through:1b,text:{"text":"右键直升机登机","color":"gold","bold":true},line_width:120}
