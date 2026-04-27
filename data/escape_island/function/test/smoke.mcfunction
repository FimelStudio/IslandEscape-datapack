# escape_island:test/smoke  —  non-destructive framework smoke check
tellraw @s {"text":"\n[SELFTEST] 开始一键体检。","color":"aqua","bold":true}
scoreboard players set $selftest test_count 1
execute if score $selftest test_count matches 1 run tellraw @s {"text":"[OK] load 已注册 test_count 计分板。","color":"green"}
execute if entity @e[type=minecraft:marker,tag=marker.spawn_island,limit=1] run function escape_island:debug/validate_map
execute unless entity @e[type=minecraft:marker,tag=marker.spawn_island,limit=1] run tellraw @s [{"text":"[INFO] 当前没有正式地图 marker。","color":"aqua"},{"text":" [创建开发沙盒]","color":"aqua","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:dev/start"}}]
function escape_island:debug/show_state
tellraw @s {"text":"[SELFTEST] 体检完成。若上面没有红色 MISS，基础框架可以继续进训练/正式局测试。","color":"aqua"}
function escape_island:test/menu
