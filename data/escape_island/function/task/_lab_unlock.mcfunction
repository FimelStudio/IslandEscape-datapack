# Synthesize submarine access pass
give @s minecraft:paper[minecraft:custom_data={item:"sub_pass"},minecraft:custom_name={"text":"潜艇通行证","italic":false,"color":"dark_purple"}] 1
tellraw @s {"text":"§5通行证已合成。前往潜艇撤离点。","color":"dark_purple"}
function escape_island:escape/submarine_depart
