# 模块注册完成后恢复到空闲；只有真实运行状态需要退出，空闲重载不清玩家物品。
scoreboard players set $reload ie.test_value 0
execute if score $game in_game matches 1 run scoreboard players set $reload ie.test_value 1
execute if score $game ie.mode matches 4 run scoreboard players set $reload ie.test_value 1
execute if score $training ie.rules_saved matches 1 run scoreboard players set $reload ie.test_value 1
execute if entity @a[tag=ie.active] run scoreboard players set $reload ie.test_value 1
execute if entity @a[tag=ie.participant] run scoreboard players set $reload ie.test_value 1
execute if entity @a[tag=state.training] run scoreboard players set $reload ie.test_value 1
execute if entity @a[tag=team.human] run scoreboard players set $reload ie.test_value 1
execute if entity @a[tag=team.infected] run scoreboard players set $reload ie.test_value 1
execute if score $reload ie.test_value matches 1 run function escape_island:game/cleanup
function escape_island:game/cancel_schedules
# 加载时统一清理旧实体；技能注册本身不触碰运行状态。
kill @e[type=minecraft:marker,tag=entity.clicker_spore]
kill @e[type=minecraft:marker,tag=entity.clicker_spore_pending]
kill @e[tag=skill.slide.vehicle]
kill @e[tag=entity.engineer_battery]
scoreboard players set $game in_game 0
scoreboard players set $game ie.mode 0
scoreboard players set $game ending_triggered 1
scoreboard players set $game dev_mode 0
tellraw @a {"text":"[海岛逃生] 模块注册完成，当前为空闲状态。","color":"gray"}
