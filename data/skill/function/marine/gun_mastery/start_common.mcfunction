scoreboard players set @s skill.gm_runtime 1
scoreboard players set @s skill.pistol_mag 0
function skill:weapon/pistol/update_item
title @s actionbar {"text":"枪械精通：快速连射","color":"gold"}
playsound minecraft:item.crossbow.quick_charge_3 player @s ~ ~ ~ 0.8 1.6
