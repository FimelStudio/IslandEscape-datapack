function skill:priest/init
function skill:priest/cross/item_ready
tag @s add cross_active
tag @s add flag.cross_intact
tellraw @s {"text":"§f§l[神父]§r 十字架: 阻断一次死亡或感染转化。余烬效果: +10秒复活冷却+抗性II+速度I。","color":"gray"}
