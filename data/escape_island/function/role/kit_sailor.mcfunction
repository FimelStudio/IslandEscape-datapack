# 水手 kit: 甲板冲刺羽毛 + 铁剑
give @s minecraft:feather[minecraft:custom_data={role_item:"sailor.dash"},minecraft:custom_name={"text":"甲板冲刺","italic":false,"color":"white"},minecraft:lore=[{"text":"右键 → 速度III 3秒","color":"gray","italic":false},{"text":"冷却: 30秒","color":"dark_gray","italic":false}]] 1
give @s minecraft:iron_sword[minecraft:custom_data={role_item:"sailor.sword"},minecraft:custom_name={"text":"水手刀","italic":false}] 1
tellraw @s {"text":"§f[水手]§r 甲板冲刺: 快速机动。被动: 轮船修复速度×1.5。","color":"gray"}
