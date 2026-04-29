scoreboard players set @s skill.pistol_swap 0

execute if entity @s[tag=role.infected] run return 0
execute if entity @s[tag=role.mother] run return 0
execute if entity @s[tag=skill.pistol_reloading] run return 0

execute if items entity @s weapon.mainhand minecraft:sugar[minecraft:custom_data~{weapon:"pistol"}] run function skill:weapon/pistol/reload_start
execute if items entity @s weapon.offhand minecraft:sugar[minecraft:custom_data~{weapon:"pistol"}] if items entity @s weapon.mainhand * run title @s actionbar {"text":"F键换弹需要副手为空","color":"yellow"}
execute if items entity @s weapon.offhand minecraft:sugar[minecraft:custom_data~{weapon:"pistol"}] if items entity @s weapon.mainhand * run return 0
execute if items entity @s weapon.offhand minecraft:sugar[minecraft:custom_data~{weapon:"pistol"}] unless items entity @s weapon.mainhand * run function skill:weapon/pistol/reload_from_offhand
