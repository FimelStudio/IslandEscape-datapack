# 断电事件: 60s 黑暗（手电筒持有者及周围获得夜视）
tag @a add event.blackout
effect give @a[tag=!event.has_flashlight] minecraft:blindness 60 0 true
tellraw @a {"text":"§8[事件] 断电！某些区域陷入黑暗。","color":"dark_gray"}
schedule function escape_island:event/_blackout_end 1200t
