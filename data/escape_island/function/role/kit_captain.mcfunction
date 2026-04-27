# 船长 kit: 铁剑 + 哨子 + 皮革甲全套
give @s minecraft:iron_sword[minecraft:custom_data={role_item:"captain.sword"},minecraft:custom_name={"text":"指挥刀","italic":false}] 1
give @s minecraft:goat_horn[minecraft:custom_data={role_item:"captain.horn"},minecraft:custom_name={"text":"哨子","italic":false,"color":"yellow"},minecraft:lore=[{"text":"右键 → 8格内幸存者速度II+力量I 15秒","color":"gray","italic":false},{"text":"冷却: 120秒","color":"dark_gray","italic":false}]] 1
give @s minecraft:leather_helmet[minecraft:custom_name={"text":"皮帽","italic":false}] 1
give @s minecraft:leather_chestplate[minecraft:custom_name={"text":"皮甲","italic":false}] 1
give @s minecraft:leather_leggings[minecraft:custom_name={"text":"皮裤","italic":false}] 1
give @s minecraft:leather_boots[minecraft:custom_name={"text":"皮靴","italic":false}] 1
tellraw @s {"text":"§e[船长]§r 哨子: 8格内队友增益。","color":"gray"}
