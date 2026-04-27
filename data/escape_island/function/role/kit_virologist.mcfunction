# 病毒学家 kit: 检测剂
give @s minecraft:glass_bottle[minecraft:custom_data={role_item:"virologist.reagent"},minecraft:custom_name={"text":"检测剂","italic":false,"color":"green"},minecraft:lore=[{"text":"右键 → 检测6格内感染者/母体","color":"gray","italic":false},{"text":"反馈: 屏幕红泛+bell，无具体方位","color":"gray","italic":false},{"text":"冷却: 45秒","color":"dark_gray","italic":false}]] 1
tellraw @s {"text":"§2[病毒学家]§r 被动: 8格内母体可见金色粒子。检测剂: 近距离探测感染体。","color":"gray"}
