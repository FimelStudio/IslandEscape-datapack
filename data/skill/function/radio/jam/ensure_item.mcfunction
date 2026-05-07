advancement revoke @s only skill:radio/jam/use
clear @s minecraft:echo_shard[minecraft:custom_data~{role_item:"radio.jam"}]
execute unless items entity @s hotbar.6 minecraft:echo_shard[minecraft:custom_data~{skill:"radio_jam"}] run function skill:radio/jam/update_item
