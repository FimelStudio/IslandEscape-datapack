advancement revoke @s only skill:clicker/hearing_spore/use
execute unless items entity @s hotbar.4 minecraft:echo_shard[minecraft:custom_data~{skill:"clicker_hearing_spore"}] run function skill:clicker/hearing_spore/update_item
