execute unless score $game in_game matches 1 unless entity @s[tag=ie.active] run function escape_island:training/clear_role
give @s minecraft:chainmail_helmet[minecraft:custom_data={item:"gas_mask"},minecraft:custom_name={"text":"防毒面具","color":"green","bold":true,"italic":false},minecraft:lore=[{"text":"戴在头上或放在背包：实验室孢子免疫","color":"gray","italic":false}],minecraft:item_model="ie:item/gas_mask"] 1
tellraw @s {"text":"获取防毒面具，戴在头上或放在物品栏内皆可生效！","color":"green"}
