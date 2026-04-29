advancement revoke @s only skill:radio/signal_scan/use
clear @s minecraft:compass[minecraft:custom_data~{role_item:"radio.sweep"}]
execute unless items entity @s hotbar.6 minecraft:compass[minecraft:custom_data~{skill:"radio_signal_scan"}] run function skill:radio/signal_scan/update_item
