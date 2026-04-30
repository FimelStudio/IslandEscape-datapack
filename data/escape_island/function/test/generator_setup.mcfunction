function escape_island:dev/start
scoreboard players set $game cur_phase 3
scoreboard players set $game phase_timer 0
scoreboard players set $tick cycle20 0
scoreboard players set $tick cycle5 0
scoreboard players set $game player_count 8
scoreboard players set $game gen_done 0
scoreboard players set @e[type=minecraft:marker,tag=marker.generator] gen_progress 0
scoreboard players set @e[type=minecraft:marker,tag=marker.generator] gen_state 0
scoreboard players set @e[type=minecraft:marker,tag=marker.generator] gen_countdown 0
scoreboard players set @e[type=minecraft:marker,tag=marker.generator] gen_overload 0
scoreboard players set @s gen_hold_time 0
scoreboard players set @s gen_hold_seen 0
scoreboard players set @s gen_hold_lock 0
scoreboard players set @s gen_interact_cd 0
tag @s remove gen.channel.sabotage
tag @s remove gen.channel.repair
tag @s add team.human
tag @s remove team.infected
tag @s remove infected.common
tag @s remove infected.mother
bossbar set escape_island:gen visible false
clear @s *[custom_data~{item:"fuel_cell"}]
clear @s *[custom_data~{item:"generator_action"}]
give @s minecraft:gold_ingot[custom_data={item:"fuel_cell"},custom_name={text:"燃料电池",color:"gold",bold:true,italic:false},lore=[{text:"对着发电机右键投入燃料",color:"gray",italic:false}],consumable={animation:"spyglass",consume_seconds:999,has_consume_particles:false,sound:{sound_id:""}},use_cooldown={seconds:0.1,cooldown_group:"escape_island:generator_use"}] 3
execute unless entity @e[type=minecraft:marker,tag=marker.generator] run summon marker ~ ~ ~ {Tags:["marker.generator"]}
function escape_island:task/generator_attach_interactions
scoreboard players set $game in_game 1
gamemode adventure @s
execute at @e[type=minecraft:marker,tag=marker.generator,sort=nearest,limit=1] run tp @s ~ ~ ~
kill @e[type=armor_stand,tag=dev_gen_vis]
execute at @e[type=minecraft:marker,tag=marker.generator,sort=nearest,limit=1] run summon armor_stand ~ ~ ~ {Tags:["dev.marker","dev_gen_vis"],Invisible:0b,Marker:1b,Invulnerable:1b,CustomNameVisible:1b,CustomName:{"text":"发电机在这！","color":"gold"},Glowing:1b,NoGravity:1b}
tellraw @s {"text":"[Batch 7B] 发电机测试已准备：燃料电池按住右键投入燃料；启动后靠近发电机会在副手临时出现交互器。","color":"gold"}
tellraw @s [{"text":"[模拟感染者破坏]","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/generator_as_infected"}},{"text":" "},{"text":"[切回幸存者维修]","color":"green","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/generator_as_survivor"}},{"text":" "},{"text":"[重置发电机测试]","color":"yellow","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/generator_setup"}}]
