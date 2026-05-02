function escape_island:dev/start

scoreboard players set $game in_game 1
scoreboard players set $game cur_phase 3
scoreboard players set $game phase_timer 0
scoreboard players set $tick cycle20 0
scoreboard players set $tick cycle5 0
scoreboard players set $game signal_progress 0
scoreboard players set $game signal_done 0
scoreboard players set $game gen_done 0
scoreboard players set Tunable tunable.ship_parts_required 5
function escape_island:task/ship_reset_parts
scoreboard players set $game ship_progress 0
scoreboard players set $game ship_bonus_tick 0
scoreboard players set $game ship_countdown 0
scoreboard players set $game heli_countdown 0
scoreboard players set $game escaped_count 0
scoreboard players set @s ship_hold_time 0
scoreboard players set @s ship_hold_seen 0
scoreboard players set @s gen_hold_time 0
scoreboard players set @s gen_hold_seen 0
scoreboard players set @s gen_hold_lock 0
scoreboard players set @s gen_interact_cd 0
scoreboard players set @e[type=minecraft:marker,tag=marker.generator] gen_progress 0
scoreboard players set @e[type=minecraft:marker,tag=marker.generator] gen_state 0
scoreboard players set @e[type=minecraft:marker,tag=marker.generator] gen_countdown 0
scoreboard players set @e[type=minecraft:marker,tag=marker.generator] gen_overload 0

gamemode adventure @s
tag @s add team.human
tag @s remove team.infected
tag @s remove infected.common
tag @s remove infected.mother
tag @s remove state.boarding
tag @s remove state.escaped

bossbar set escape_island:ship visible false
bossbar set escape_island:phase visible false
bossbar set escape_island:signal visible false
bossbar set escape_island:gen visible false
bossbar set escape_island:heli visible false
bossbar set escape_island:sub visible false
bossbar set escape_island:bomb visible false
bossbar set escape_island:infection visible false
bossbar set escape_island:disguise visible false
bossbar set escape_island:mother_respawn visible false
kill @e[type=minecraft:interaction,tag=entity.generator_interaction]
kill @e[type=minecraft:interaction,tag=entity.ship_door]
kill @e[tag=entity.ship_door_hint]
clear @s *[custom_data~{item:"ship_part"}]
clear @s *[custom_data~{item:"generator_action"}]
give @s minecraft:iron_ingot[custom_data={item:"ship_part",part:"propeller"},custom_name={text:"船舶部件：螺旋桨",color:"aqua",bold:true,italic:false},lore=[{text:"在船坞附近长按约 1 秒投入",color:"gray",italic:false}],item_model="ie:ship_part_propeller",consumable={animation:"spyglass",consume_seconds:999,has_consume_particles:false,sound:{sound_id:""}},use_cooldown={seconds:0.1,cooldown_group:"escape_island:ship_part"}]
give @s minecraft:copper_ingot[custom_data={item:"ship_part",part:"fuel_pump"},custom_name={text:"船舶部件：燃油泵",color:"aqua",bold:true,italic:false},lore=[{text:"在船坞附近长按约 1 秒投入",color:"gray",italic:false}],item_model="ie:ship_part_fuel_pump",consumable={animation:"spyglass",consume_seconds:999,has_consume_particles:false,sound:{sound_id:""}},use_cooldown={seconds:0.1,cooldown_group:"escape_island:ship_part"}]
give @s minecraft:stick[custom_data={item:"ship_part",part:"steering_linkage"},custom_name={text:"船舶部件：舵机连杆",color:"aqua",bold:true,italic:false},lore=[{text:"在船坞附近长按约 1 秒投入",color:"gray",italic:false}],item_model="ie:ship_part_steering_linkage",consumable={animation:"spyglass",consume_seconds:999,has_consume_particles:false,sound:{sound_id:""}},use_cooldown={seconds:0.1,cooldown_group:"escape_island:ship_part"}]
give @s minecraft:redstone[custom_data={item:"ship_part",part:"starter_battery"},custom_name={text:"船舶部件：启动电瓶",color:"aqua",bold:true,italic:false},lore=[{text:"在船坞附近长按约 1 秒投入",color:"gray",italic:false}],item_model="ie:ship_part_starter_battery",consumable={animation:"spyglass",consume_seconds:999,has_consume_particles:false,sound:{sound_id:""}},use_cooldown={seconds:0.1,cooldown_group:"escape_island:ship_part"}]
give @s minecraft:iron_bars[custom_data={item:"ship_part",part:"anchor_winch"},custom_name={text:"船舶部件：锚机绞盘",color:"aqua",bold:true,italic:false},lore=[{text:"在船坞附近长按约 1 秒投入",color:"gray",italic:false}],item_model="ie:ship_part_anchor_winch",consumable={animation:"spyglass",consume_seconds:999,has_consume_particles:false,sound:{sound_id:""}},use_cooldown={seconds:0.1,cooldown_group:"escape_island:ship_part"}]
execute unless entity @e[type=minecraft:marker,tag=marker.ship_dock] run summon marker ~ ~ ~ {Tags:["marker.ship_dock"]}
execute at @e[type=minecraft:marker,tag=marker.ship_dock,sort=nearest,limit=1] run tp @s ~ ~ ~
kill @e[type=armor_stand,tag=dev_ship_vis]
execute at @e[type=minecraft:marker,tag=marker.ship_dock,sort=nearest,limit=1] run summon armor_stand ~ ~ ~ {Tags:["dev.marker","dev_ship_vis"],Invisible:0b,Marker:1b,Invulnerable:1b,CustomNameVisible:1b,CustomName:{"text":"船坞在这！","color":"aqua"},Glowing:1b,NoGravity:1b}
tellraw @s {"text":"[Batch 9A] 轮船路线测试已准备：依次投入螺旋桨、燃油泵、舵机连杆、启动电瓶、锚机绞盘；之后站在船坞旁修复到 100。","color":"aqua"}
tellraw @s [{"text":"[快速到95进度]","color":"yellow","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/ship_route_fast_repair"}},{"text":" "},{"text":"[模拟感染者干扰]","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/ship_as_infected"}},{"text":" "},{"text":"[重置轮船测试]","color":"aqua","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/ship_route_setup"}}]
