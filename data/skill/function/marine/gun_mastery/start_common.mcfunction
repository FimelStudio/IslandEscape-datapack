scoreboard players set @s skill.gm_runtime 1
item replace entity @s weapon.mainhand with minecraft:sugar[minecraft:custom_data={weapon:"pistol",mag:0,role_item:"survivor.pistol"},minecraft:custom_name={"text":"M-7 手枪 [0/8]","italic":false,"color":"gray"},minecraft:lore=[{"text":"弹匣已打空","color":"red","italic":false},{"text":"海军被动: 潜行右键快速射空弹匣","color":"dark_gray","italic":false}],minecraft:consumable={animation:"spyglass",consume_seconds:999,has_consume_particles:false,sound:{sound_id:""}},minecraft:use_cooldown={seconds:0.2,cooldown_group:"weapon:m7"},minecraft:item_model="ie:glock_gun"] 1
title @s actionbar {"text":"枪械精通：快速连射","color":"gold"}
playsound minecraft:item.crossbow.quick_charge_3 player @s ~ ~ ~ 0.8 1.6
