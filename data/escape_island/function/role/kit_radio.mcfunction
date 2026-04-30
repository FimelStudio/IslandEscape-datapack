tag @s add role.radio
function skill:radio/signal_scan/config
scoreboard players set @s skill.signal_scan_cd 0
scoreboard players set @s skill.signal_scan_state 0
function skill:radio/signal_scan/update_item
tellraw @s {"text":"§3[通讯员]§r 信号扫描: 私有显示异常信号距离报告。被动: 近距离准心识别公开职业。","color":"gray"}
