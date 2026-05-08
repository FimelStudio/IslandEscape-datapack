scoreboard players set @s skill.rifle_mag 30
scoreboard players set @s skill.rifle_fire_cd 0
scoreboard players set @s skill.rifle_reload 0
tag @s remove skill.rifle.reloading
give @s minecraft:sugar[minecraft:max_stack_size=1,minecraft:custom_data={weapon:"rifle",mag:30},minecraft:custom_name={text:"SR-17 步枪",color:"green",bold:true,italic:false},minecraft:lore=[{text:"右键连射 | Shift+右键换弹",color:"gray",italic:false},{text:"弹匣: 30 发 | 使用 9mm 弹药",color:"dark_gray",italic:false}],minecraft:consumable={animation:"spyglass",consume_seconds:0,has_consume_particles:false,sound:{sound_id:""}},minecraft:use_remainder={id:"minecraft:paper",count:1,components:{"minecraft:custom_data":{weapon:"rifle_used"},"minecraft:item_model":"ie:rifle"}},minecraft:use_cooldown={seconds:0.1,cooldown_group:"weapon:rifle"},minecraft:item_model="ie:rifle"] 1
tellraw @s {"text":"[武器] SR-17 步枪已发放。","color":"green"}
