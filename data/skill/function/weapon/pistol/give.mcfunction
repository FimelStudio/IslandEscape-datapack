scoreboard players set @s skill.pistol_mag 8
scoreboard players set @s skill.pistol_fire_cd 0
scoreboard players set @s skill.pistol_reload 0
scoreboard players set @s skill.pistol_swap 0
tag @s remove skill.pistol.reloading
give @s minecraft:sugar[minecraft:max_stack_size=1,minecraft:custom_data={weapon:"pistol",mag:8,role_item:"survivor.pistol"},minecraft:custom_name={text:"格洛克手枪 [8/8]",color:"gray",bold:true,italic:false},minecraft:lore=[{text:"右键射击 | F键换弹",color:"gray",italic:false},{text:"海军: 潜行右键快速连射",color:"gold",italic:false},{text:"弹匣: 8/8 | 使用 9mm 弹药",color:"dark_gray",italic:false}],minecraft:consumable={animation:"spyglass",consume_seconds:0,has_consume_particles:false,sound:{sound_id:""}},minecraft:use_remainder={id:"minecraft:sugar",count:1,components:{"minecraft:custom_data":{weapon:"pistol_used",mag:8},"minecraft:item_model":"ie:glock_gun"}},minecraft:use_cooldown={seconds:0.2,cooldown_group:"weapon:pistol"},minecraft:item_model="ie:glock_gun"] 1
