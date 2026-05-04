kill @e[type=minecraft:interaction,tag=entity.sub_door]
kill @e[tag=entity.sub_door_hint]

execute at @e[tag=marker.lab_sub,limit=1] run summon minecraft:interaction ~ ~ ~ {Tags:["entity.sub_door"],width:4.0f,height:4.0f,response:1b}
execute at @e[tag=marker.lab_sub,limit=1] run summon minecraft:text_display ~ ~3 ~ {Tags:["entity.sub_door_hint"],billboard:"center",see_through:1b,text:{"text":"右键登艇","color":"dark_purple","bold":true},line_width:80}
