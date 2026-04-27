tag @s add athlete
give @s minecraft:iron_sword[minecraft:custom_data={role_item:"athlete.sword"},minecraft:custom_name={"text":"运动短刀","italic":false}] 1
function skill:athlete/adrenaline/item_ready
tellraw @s {"text":"§f[运动员]§r 肾上腺素: 10秒速度提升，冷却120秒。滑铲: 疾跑+前进+潜行触发，消耗体力。","color":"gray"}
