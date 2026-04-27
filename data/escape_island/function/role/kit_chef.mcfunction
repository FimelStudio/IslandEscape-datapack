# 厨师 kit: 热汤 + 额外食物
give @s minecraft:mushroom_stew[minecraft:custom_data={role_item:"chef.stew"},minecraft:custom_name={"text":"热汤","italic":false,"color":"green"},minecraft:lore=[{"text":"放置 → 5分钟饮用锅（4心回血）","color":"gray","italic":false},{"text":"冷却: 180秒","color":"dark_gray","italic":false}]] 1
give @s minecraft:cooked_porkchop 5
tellraw @s {"text":"§a[厨师]§r 热汤: 放置汤锅供队友饮用。被动: 5格内队友回血 +20%。","color":"gray"}
