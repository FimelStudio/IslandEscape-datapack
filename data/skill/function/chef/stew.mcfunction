advancement revoke @s only skill:chef/stew
execute if score @s cd_chef matches 1.. run return 0

scoreboard players set @s cd_chef 180
execute at @s run summon minecraft:armor_stand ~ ~ ~ {Tags:["entity.chef_stew_pot"],NoGravity:1b,Invisible:1b,Marker:1b,CustomName:{"text":"热汤（可饮用）","color":"green"},CustomNameVisible:1b}
tellraw @s {"text":"§a热汤已放置，5分钟内有效。队友右键饮用可回4心。","color":"green"}
