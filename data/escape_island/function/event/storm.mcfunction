# 风暴事件: 90s 户外扣血 0.5心/5s（修复点区域豁免）
weather thunder 1800
tag @a add event.storm
tellraw @a {"text":"§9[事件] 风暴来袭！寻找室内掩蔽。","color":"blue"}
schedule function escape_island:event/_storm_end 1800t
