kill @e[tag=test.dummy]
function escape_island:dev/as_survivor
tag @s add role.radio
function skill:radio/signal_scan/config
scoreboard players set @s skill.signal_scan_cd 0
scoreboard players set @s skill.signal_scan_state 0
function skill:radio/signal_scan/update_item
tellraw @s {"text":"[TEST] 隐藏母体扫描：下方应显示“未发现异常信号”，不应出现母体异常行。","color":"gold"}
execute at @s run summon minecraft:marker ~3 ~ ~ {Tags:["test.dummy","test.radio_scan_mother","infected.mother"]}
function skill:radio/signal_scan/start
kill @e[tag=test.radio_scan_mother]
scoreboard players set @s skill.signal_scan_cd 0
tellraw @s {"text":"[TEST] 猎手母体扫描：下方应出现一条“异常”距离报告。","color":"gold"}
execute at @s run summon minecraft:marker ~3 ~ ~ {Tags:["test.dummy","test.radio_scan_mother","infected.mother","state.mutated"]}
function skill:radio/signal_scan/start
kill @e[tag=test.radio_scan_mother]
scoreboard players set @s skill.signal_scan_cd 0
function skill:radio/signal_scan/update_item
tellraw @s [{"text":"[返回感染测试菜单]","color":"dark_red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:dev/infection_menu"}}]
