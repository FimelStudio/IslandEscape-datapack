tag @s add role.engineer
scoreboard players set @s skill.battery_cd 0
function skill:engineer/battery/update_item
tellraw @s {"text":"§6[工程师]§r 被动: 信号塔修复效率 +25%，受团队上限约束。微型电池: 加速修复区域。","color":"gray"}
