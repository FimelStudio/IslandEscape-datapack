execute as @a[tag=zombie_mom,limit=1] run title @s actionbar {text:"范围内无目标",color:"green"}

execute as @a[tag=zombie_mom,limit=1] run advancement revoke @s only skill:eat_entity

execute as @a[tag=zombie_mom,limit=1] run item replace entity @s hotbar.4 with minecraft:red_dye[custom_data={skill:eat_entity},custom_name={color:"red",bold:true,text:"吞噬"},consumable={animation:"spyglass",consume_seconds:0,has_consume_particles:false,sound:{sound_id:""}},use_cooldown={seconds:0.5,cooldown_group:"minecraft"}] 1

