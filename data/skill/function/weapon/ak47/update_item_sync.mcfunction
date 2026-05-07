scoreboard players add @s skill.ak47_mag 0
execute if score @s skill.ak47_mag matches ..-1 run scoreboard players set @s skill.ak47_mag 0
execute if score @s skill.ak47_mag matches 31.. run scoreboard players set @s skill.ak47_mag 30

execute store result storage skill:weapon.ak47 item.mag int 1 run scoreboard players get @s skill.ak47_mag
execute if entity @s[tag=skill.ak47.reloading] run function skill:weapon/ak47/item_reloading with storage skill:weapon.ak47 item
execute unless entity @s[tag=skill.ak47.reloading] run function skill:weapon/ak47/item with storage skill:weapon.ak47 item
function skill:weapon/ak47/render_xp
