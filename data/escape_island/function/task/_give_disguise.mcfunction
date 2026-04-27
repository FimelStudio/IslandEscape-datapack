give @s minecraft:potion[minecraft:custom_data={role_item:"mother.disguise"},minecraft:custom_name={"text":"X-7 伪装试剂","italic":false,"color":"dark_purple"},minecraft:potion_contents={custom_color:8388736}] 1
tag @s add flag.has_disguise
tellraw @s {"text":"§5X-7 试剂获取成功。服用后伪装成幸存者 90 秒。","color":"dark_purple"}
