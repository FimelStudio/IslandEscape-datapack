# 神父 kit: 十字架（一次性被动）
give @s minecraft:nautilus_shell[minecraft:custom_data={role_item:"priest.cross",uses:1},minecraft:custom_name={"text":"十字架","italic":false,"color":"white"},minecraft:lore=[{"text":"被动: 阻断致死伤害 或 清除感染期（1次）","color":"gray","italic":false},{"text":"用完后消失","color":"dark_gray","italic":false}]] 1
tag @s add flag.cross_intact
tellraw @s {"text":"§f§l[神父]§r 十字架: 阻断一次死亡或感染转化。余烬效果: +10秒复活冷却+抗性II+速度I。","color":"gray"}
