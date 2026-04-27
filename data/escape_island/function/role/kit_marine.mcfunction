# 海军陆战队员 kit: 铁剑 + 压制射击弩 + 24 发弹药（替换基础8发）
# Clear default pistol ammo, give marine's 24 ammo instead
clear @s minecraft:iron_nugget[minecraft:custom_data={ammo:1}]
give @s minecraft:iron_nugget[minecraft:custom_data={ammo:1},minecraft:custom_name={"text":"9mm 弹药","italic":false,"color":"gray"}] 24
give @s minecraft:iron_sword[minecraft:custom_data={role_item:"marine.sword"},minecraft:custom_name={"text":"战术刀","italic":false}] 1
give @s minecraft:crossbow[minecraft:custom_data={role_item:"marine.suppress"},minecraft:custom_name={"text":"压制射击（弩）","italic":false,"color":"red"},minecraft:lore=[{"text":"射击 → 45°锥形3格内缓慢III 6秒","color":"gray","italic":false},{"text":"冷却: 45秒","color":"dark_gray","italic":false}]] 1
tellraw @s {"text":"§c[海军陆战队员]§r 弹药x24。压制射击: 范围缓速。","color":"gray"}
