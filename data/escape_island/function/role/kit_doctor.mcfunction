# 船医 kit: 解毒针 ×3
give @s minecraft:carrot_on_a_stick[minecraft:custom_data={role_item:"doctor.inject",uses:3},minecraft:custom_name={"text":"解毒针 [3]","italic":false,"color":"aqua"},minecraft:lore=[{"text":"右键队友（5格内）→ 治愈感染期","color":"gray","italic":false},{"text":"右键自身（感染期中）→ 自救（每期限1次）","color":"gray","italic":false},{"text":"冷却: 90秒","color":"dark_gray","italic":false}]] 1
tag @s add flag.has_inject
tellraw @s {"text":"§b[船医]§r 解毒针: 治愈队友感染期。§e自身孢子阈值 130（+30）。","color":"gray"}
