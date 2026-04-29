clear @s minecraft:compass[minecraft:custom_data~{skill:"radio_signal_scan"}]
scoreboard players operation @s skill.signal_scan_sec = @s skill.signal_scan_cd
scoreboard players operation @s skill.signal_scan_sec /= #twenty skill.signal_scan_cfg
execute store result storage skill:radio.signal_scan item.sec int 1 run scoreboard players get @s skill.signal_scan_sec

execute if score @s skill.signal_scan_cd matches 1.. run scoreboard players set @s skill.signal_scan_state 2
execute if score @s skill.signal_scan_cd matches 1.. run function skill:radio/signal_scan/item_cooldown with storage skill:radio.signal_scan item
execute unless score @s skill.signal_scan_cd matches 1.. run scoreboard players set @s skill.signal_scan_state 1
execute unless score @s skill.signal_scan_cd matches 1.. run function skill:radio/signal_scan/item_ready
