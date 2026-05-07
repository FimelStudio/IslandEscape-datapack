scoreboard players set @s skill.ak47_swap 0

execute if entity @s[tag=infected.common] run return 0
execute if entity @s[tag=infected.mother] run return 0
execute if entity @s[tag=skill.ak47.reloading] run return 0

execute if items entity @s weapon.mainhand minecraft:sugar[minecraft:custom_data~{weapon:"ak47"}] run function skill:weapon/ak47/reload_start
execute if items entity @s weapon.offhand minecraft:sugar[minecraft:custom_data~{weapon:"ak47"}] if items entity @s weapon.mainhand * run title @s actionbar {"text":"F键换弹需要副手为空","color":"yellow"}
execute if items entity @s weapon.offhand minecraft:sugar[minecraft:custom_data~{weapon:"ak47"}] if items entity @s weapon.mainhand * run return 0
execute if items entity @s weapon.offhand minecraft:sugar[minecraft:custom_data~{weapon:"ak47"}] unless items entity @s weapon.mainhand * run function skill:weapon/ak47/reload_from_offhand
