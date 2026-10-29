execute unless score $game in_game matches 1 unless entity @s[tag=ie.active] run function escape_island:training/clear_role
function skill:weapon/sniper/give
give @s minecraft:arrow[minecraft:custom_data={ammo:"sniper_round"},minecraft:custom_name={text:"狙击弹",color:"aqua",italic:false}] 10
