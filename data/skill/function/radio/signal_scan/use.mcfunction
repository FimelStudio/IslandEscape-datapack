advancement revoke @s only skill:radio/signal_scan/use
clear @s minecraft:sugar[custom_data={skill:"radio_signal_scan_used"}]

execute unless entity @s[tag=role.radio] run function skill:radio/signal_scan/cleanup_non_radio
execute unless entity @s[tag=role.radio] run return 0

execute if score @s skill.signal_scan_cd matches 1.. run title @s actionbar {"text":"信号扫描冷却中","color":"yellow"}
execute if score @s skill.signal_scan_cd matches 1.. run function skill:radio/signal_scan/update_item
execute if score @s skill.signal_scan_cd matches 1.. run return 0

function skill:radio/signal_scan/start
