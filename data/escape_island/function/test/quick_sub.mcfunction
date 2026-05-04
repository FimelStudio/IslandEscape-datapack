function escape_island:test/reset_state
summon minecraft:marker ~ ~ ~ {Tags:["marker.lab_sub"]}
give @s minecraft:paper[minecraft:custom_data={item:"lab_key_card"},minecraft:custom_name={"text":"实验室钥匙卡","color":"aqua","bold":true,"italic":false},minecraft:lore=[{"text":"在潜艇旁右键使用","color":"gray","italic":false}],minecraft:consumable={animation:"spyglass",consume_seconds:0,has_consume_particles:false,sound:{sound_id:""}}] 1
tellraw @s {"text":"[测试] 脚下已放潜艇标记+钥匙卡，右键使用启动","color":"gold"}
