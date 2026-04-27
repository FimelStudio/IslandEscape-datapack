# 机修工 kit: 机关陷阱 ×3
give @s minecraft:tripwire_hook[minecraft:custom_data={role_item:"mechanic.trap"},minecraft:custom_name={"text":"机关陷阱","italic":false,"color":"gray"},minecraft:lore=[{"text":"放置 → 触发缓慢II 4秒+标记30秒","color":"gray","italic":false},{"text":"场上上限: 3 | 冷却: 90秒","color":"dark_gray","italic":false}]] 3
tellraw @s {"text":"§7[机修工]§r 被动: 修复速度×1.2。机关陷阱: 触发缓速+暴露。","color":"gray"}
