kill @e[type=minecraft:interaction,tag=entity.helicopter_door]
kill @e[tag=entity.helicopter_door_hint]

execute at @e[tag=entity.helicopter,sort=nearest,limit=1] positioned ^-3 ^-3.8 ^-5.5 run summon minecraft:interaction ~ ~ ~ {Tags:["entity.helicopter_door"],width:2.0f,height:2.4f,response:1b}
execute at @e[tag=entity.helicopter,sort=nearest,limit=1] positioned ^-3 ^-3.8 ^-5.5 run summon minecraft:text_display ~ ~2.6 ~ {Tags:["entity.helicopter_door_hint"],billboard:"center",see_through:1b,text:{"text":"右键登机","color":"gold","bold":true}}
