function escape_island:dev/start
scoreboard players set $game gen_progress 0
scoreboard players set $game gen_state 0
scoreboard players set $game gen_hold_time 0
scoreboard players set $game gen_hold_seen 0
scoreboard players set $game gen_hold_lock 0
scoreboard players set $game gen_done 0
bossbar set escape_island:gen visible false
clear @s *[custom_data~{item:"fuel_cell"}]
give @s minecraft:gold_ingot[custom_data={item:"fuel_cell"},custom_name={text:"燃料电池",color:"gold",bold:true,italic:false},lore=[{text:"在发电机旁长按右键投入燃料",color:"gray",italic:false}],consumable={animation:"spyglass",consume_seconds:999,has_consume_particles:false,sound:{sound_id:""}},use_cooldown={seconds:0.1,cooldown_group:"escape_island:generator_use"}] 3
execute unless entity @e[type=minecraft:marker,tag=marker.generator] run summon marker ~ ~ ~ {Tags:["marker.generator"]}
scoreboard players set $game in_game 1
execute at @e[type=minecraft:marker,tag=marker.generator,sort=nearest,limit=1] run tp @s ~ ~ ~
kill @e[type=armor_stand,tag=dev_gen_vis]
execute at @e[type=minecraft:marker,tag=marker.generator,sort=nearest,limit=1] run summon armor_stand ~ ~ ~ {Tags:["dev_gen_vis"],Invisible:0b,CustomNameVisible:1b,CustomName:'{"text":"发电机在这！","color":"gold"}',Glowing:1b,NoGravity:1b}
tellraw @s {"text":"[Batch 7B] 发电机测试已准备：站在发电机旁，手持燃料电池长按右键 3 次；第 3 次会启动发电机。","color":"gold"}