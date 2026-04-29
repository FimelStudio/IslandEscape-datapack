scoreboard players operation @s skill.signal_scan_sec = @s skill.signal_scan_cd
scoreboard players operation @s skill.signal_scan_sec /= #twenty skill.signal_scan_cfg
execute unless score @s skill.signal_scan_sec = @s skill.signal_scan_last_sec run function skill:radio/signal_scan/update_item
scoreboard players operation @s skill.signal_scan_last_sec = @s skill.signal_scan_sec
