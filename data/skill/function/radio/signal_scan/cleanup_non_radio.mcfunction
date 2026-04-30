advancement revoke @s only skill:radio/signal_scan/use
clear @s minecraft:compass[minecraft:custom_data~{skill:"radio_signal_scan"}]
scoreboard players set @s skill.signal_scan_cd 0
scoreboard players set @s skill.signal_scan_item 0
scoreboard players set @s skill.signal_scan_state 0
scoreboard players set @s skill.signal_scan_sec 0
scoreboard players set @s skill.signal_scan_last_sec 0
scoreboard players set @s skill.signal_scan_time 0
tag @s remove skill.radio.viewer
tag @s remove skill.radio.reported
