# 通讯员 kit: 信号扫描仪
give @s minecraft:compass[minecraft:custom_data={role_item:"radio.sweep"},minecraft:custom_name={"text":"信号扫描仪","italic":false,"color":"aqua"},minecraft:lore=[{"text":"右键 → 全图幸存者高亮5秒","color":"gray","italic":false},{"text":"冷却: 120秒","color":"dark_gray","italic":false}]] 1
tellraw @s {"text":"§3[通讯员]§r 信号扫描: 高亮所有幸存者（含伪装母体）。","color":"gray"}
