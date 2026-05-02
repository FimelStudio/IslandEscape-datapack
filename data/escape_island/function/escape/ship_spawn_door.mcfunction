kill @e[type=minecraft:interaction,tag=entity.ship_door]
kill @e[tag=entity.ship_door_hint]
execute at @e[type=minecraft:marker,tag=marker.ship_dock,sort=nearest,limit=1] positioned ~ ~1 ~ run summon minecraft:interaction ~ ~ ~ {Tags:["entity.ship_door"],width:2.5f,height:2.5f,response:1b}
execute at @e[type=minecraft:marker,tag=marker.ship_dock,sort=nearest,limit=1] positioned ~ ~2.2 ~ run summon minecraft:text_display ~ ~ ~ {Tags:["entity.ship_door_hint"],billboard:"center",text:{"text":"右键登船","color":"aqua","bold":true},background:0,see_through:1b}
