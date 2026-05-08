execute unless score $game gs_active matches 1 run return 0
execute at @e[type=minecraft:marker,tag=marker.gs_supply_1] run particle minecraft:happy_villager ~ ~1 ~ 0.5 0.5 0.5 0.02 6 force @a[tag=gs.player,distance=..8]
execute at @e[type=minecraft:marker,tag=marker.gs_supply_1] as @a[tag=gs.player,distance=..2] run give @s minecraft:iron_nugget[minecraft:custom_data={ammo:1},minecraft:item_name={text:"9mm 弹药",italic:false,color:"gray"}] 8
