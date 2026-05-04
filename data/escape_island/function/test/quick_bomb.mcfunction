function escape_island:test/reset_state
scoreboard players set $game signal_done 1
summon minecraft:marker ~ ~ ~ {Tags:["marker.island_bomb"]}
give @s minecraft:paper[minecraft:custom_data={item:"prometheus_file"},minecraft:custom_name={"text":"普罗米修斯文件","color":"red","bold":true,"italic":false},minecraft:consumable={animation:"spyglass",consume_seconds:999,has_consume_particles:false,sound:{sound_id:""}}] 3
tellraw @s {"text":"[测试] 脚下已放炸弹标记+3份普罗米修斯文件，信号塔已修好","color":"gold"}
