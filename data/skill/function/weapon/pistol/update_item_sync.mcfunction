scoreboard players add @s skill.pistol_mag 0
execute if score @s skill.pistol_mag matches ..-1 run scoreboard players set @s skill.pistol_mag 0
execute if score @s skill.pistol_mag matches 9.. run scoreboard players set @s skill.pistol_mag 8

execute store result storage skill:weapon.pistol item.mag int 1 run scoreboard players get @s skill.pistol_mag
execute if entity @s[tag=skill.pistol.reloading] run function skill:weapon/pistol/item_reloading with storage skill:weapon.pistol item
execute unless entity @s[tag=skill.pistol.reloading] run function skill:weapon/pistol/item with storage skill:weapon.pistol item
function skill:weapon/pistol/render_xp
