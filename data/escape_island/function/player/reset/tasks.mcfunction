# 自动生成：tools/state_contract.json；请通过 python tools/generate_state.py 更新。
# 执行者 @s 是待重置玩家；只清理本模块拥有的临时状态。
tag @s remove event.blackout
tag @s remove event.has_flashlight
tag @s remove event.storm
tag @s remove gen.channel.repair
tag @s remove gen.channel.sabotage
tag @s remove has_gas_mask
scoreboard players set @s bomb_file_count 0
scoreboard players set @s bomb_repair_time 0
scoreboard players set @s gen_hold_lock 0
scoreboard players set @s gen_hold_seen 0
scoreboard players set @s gen_hold_time 0
scoreboard players set @s gen_interact_cd 0
scoreboard players set @s scan_active 0
scoreboard players set @s scan_result 0
scoreboard players set @s scan_time 0
scoreboard players set @s ship_hold_seen 0
scoreboard players set @s ship_hold_time 0
scoreboard players set @s signal_repair_seen 0
scoreboard players set @s signal_repair_time 0
