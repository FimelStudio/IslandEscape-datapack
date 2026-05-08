execute unless entity @s[tag=range.active] run function escape_island:range/enter
scoreboard players set @s range_mode 2
scoreboard players set @s range_score 0
scoreboard players set @s range_combo 0
scoreboard players set @s range_shots 0
scoreboard players set @s range_hits 0
scoreboard players set @s range_timer 600
scoreboard players set @s range_seq 1
scoreboard players set @s range_wave 1
kill @e[tag=range.target]
function escape_island:range/spawn_targets
give @s minecraft:iron_nugget[minecraft:custom_data={ammo:1},minecraft:item_name={text:"9mm 弹药",italic:false,color:"gray"}] 256
give @s minecraft:iron_nugget[minecraft:custom_data={ammo:"7.62"},minecraft:item_name={text:"7.62 弹药",italic:false,color:"gray"}] 512
bossbar set escape_island:range_timer max 600
bossbar set escape_island:range_timer value 600
bossbar set escape_island:range_timer players @s
bossbar set escape_island:range_timer visible true
tellraw @s {"text":"[限时挑战] 30 秒内尽量得分，弹药不限。","color":"yellow"}
