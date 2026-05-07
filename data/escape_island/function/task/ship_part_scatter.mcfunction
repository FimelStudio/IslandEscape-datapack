tag @e[type=minecraft:marker,tag=marker.ship_part_slot] remove marker.ship_part_slot
tag @e[type=minecraft:marker,tag=marker.ship_slot_1] remove marker.ship_slot_1
tag @e[type=minecraft:marker,tag=marker.ship_slot_2] remove marker.ship_slot_2
tag @e[type=minecraft:marker,tag=marker.ship_slot_3] remove marker.ship_slot_3
tag @e[type=minecraft:marker,tag=marker.ship_slot_4] remove marker.ship_slot_4
tag @e[type=minecraft:marker,tag=marker.ship_slot_5] remove marker.ship_slot_5

execute as @e[type=minecraft:marker,tag=marker.loot_basic,tag=!marker.ship_part_slot,sort=random,limit=1] run tag @s add marker.ship_slot_1
execute as @e[type=minecraft:marker,tag=marker.ship_slot_1] run tag @s add marker.ship_part_slot
execute as @e[type=minecraft:marker,tag=marker.loot_basic,tag=!marker.ship_part_slot,sort=random,limit=1] run tag @s add marker.ship_slot_2
execute as @e[type=minecraft:marker,tag=marker.ship_slot_2] run tag @s add marker.ship_part_slot
execute as @e[type=minecraft:marker,tag=marker.loot_basic,tag=!marker.ship_part_slot,sort=random,limit=1] run tag @s add marker.ship_slot_3
execute as @e[type=minecraft:marker,tag=marker.ship_slot_3] run tag @s add marker.ship_part_slot
execute if score Tunable tunable.ship_parts_required matches 4.. as @e[type=minecraft:marker,tag=marker.loot_basic,tag=!marker.ship_part_slot,sort=random,limit=1] run tag @s add marker.ship_slot_4
execute as @e[type=minecraft:marker,tag=marker.ship_slot_4] run tag @s add marker.ship_part_slot
execute if score Tunable tunable.ship_parts_required matches 5.. as @e[type=minecraft:marker,tag=marker.loot_basic,tag=!marker.ship_part_slot,sort=random,limit=1] run tag @s add marker.ship_slot_5
execute as @e[type=minecraft:marker,tag=marker.ship_slot_5] run tag @s add marker.ship_part_slot

execute as @e[type=minecraft:marker,tag=marker.ship_slot_1] at @s run item replace block ~ ~ ~ container.0 with minecraft:iron_ingot[custom_data={item:"ship_part",part:"propeller"},custom_name={text:"船舶部件：螺旋桨",color:"aqua",bold:true,italic:false},lore=[{text:"在船坞附近长按约 1 秒投入",color:"gray",italic:false}],item_model="ie:ship_part_propeller",consumable={animation:"spyglass",consume_seconds:999,has_consume_particles:false,sound:{sound_id:""}},use_cooldown={seconds:0.1,cooldown_group:"escape_island:ship_part"}] 1
execute as @e[type=minecraft:marker,tag=marker.ship_slot_2] at @s run item replace block ~ ~ ~ container.0 with minecraft:copper_ingot[custom_data={item:"ship_part",part:"fuel_pump"},custom_name={text:"船舶部件：燃油泵",color:"aqua",bold:true,italic:false},lore=[{text:"在船坞附近长按约 1 秒投入",color:"gray",italic:false}],item_model="ie:ship_part_fuel_pump",consumable={animation:"spyglass",consume_seconds:999,has_consume_particles:false,sound:{sound_id:""}},use_cooldown={seconds:0.1,cooldown_group:"escape_island:ship_part"}] 1
execute as @e[type=minecraft:marker,tag=marker.ship_slot_3] at @s run item replace block ~ ~ ~ container.0 with minecraft:stick[custom_data={item:"ship_part",part:"steering_linkage"},custom_name={text:"船舶部件：舵机连杆",color:"aqua",bold:true,italic:false},lore=[{text:"在船坞附近长按约 1 秒投入",color:"gray",italic:false}],item_model="ie:ship_part_steering_linkage",consumable={animation:"spyglass",consume_seconds:999,has_consume_particles:false,sound:{sound_id:""}},use_cooldown={seconds:0.1,cooldown_group:"escape_island:ship_part"}] 1
execute if score Tunable tunable.ship_parts_required matches 4.. as @e[type=minecraft:marker,tag=marker.ship_slot_4] at @s run item replace block ~ ~ ~ container.0 with minecraft:redstone[custom_data={item:"ship_part",part:"starter_battery"},custom_name={text:"船舶部件：启动电瓶",color:"aqua",bold:true,italic:false},lore=[{text:"在船坞附近长按约 1 秒投入",color:"gray",italic:false}],item_model="ie:ship_part_starter_battery",consumable={animation:"spyglass",consume_seconds:999,has_consume_particles:false,sound:{sound_id:""}},use_cooldown={seconds:0.1,cooldown_group:"escape_island:ship_part"}] 1
execute if score Tunable tunable.ship_parts_required matches 5.. as @e[type=minecraft:marker,tag=marker.ship_slot_5] at @s run item replace block ~ ~ ~ container.0 with minecraft:iron_bars[custom_data={item:"ship_part",part:"anchor_winch"},custom_name={text:"船舶部件：锚机绞盘",color:"aqua",bold:true,italic:false},lore=[{text:"在船坞附近长按约 1 秒投入",color:"gray",italic:false}],item_model="ie:ship_part_anchor_winch",consumable={animation:"spyglass",consume_seconds:999,has_consume_particles:false,sound:{sound_id:""}},use_cooldown={seconds:0.1,cooldown_group:"escape_island:ship_part"}] 1

execute if score Tunable tunable.ship_parts_required matches 3 run tellraw @a {"text":"[轮船] 本局船舶部件已分散到 3 个普通物资点。","color":"aqua"}
execute if score Tunable tunable.ship_parts_required matches 4 run tellraw @a {"text":"[轮船] 本局船舶部件已分散到 4 个普通物资点。","color":"aqua"}
execute if score Tunable tunable.ship_parts_required matches 5.. run tellraw @a {"text":"[轮船] 本局船舶部件已分散到 5 个普通物资点。","color":"aqua"}

# 记录分散槽数量到调试计数器，便于自测脚本读取
scoreboard players set $ship_slots test_count 0
execute as @e[type=minecraft:marker,tag=marker.ship_part_slot] run scoreboard players add $ship_slots test_count 1
