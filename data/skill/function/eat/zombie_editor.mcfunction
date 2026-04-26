give @a structure_void[custom_data={skill:zombie_editor},custom_name={text:"编辑当前吞噬的感染体属性",color:"gray"},consumable={animation:"spyglass",consume_seconds:0,has_consume_particles:false,sound:{sound_id:""}},use_cooldown={seconds:0.5,cooldown_group:"minecraft"}] 1

execute store result storage zombie:eated max_health double 1 run attribute @a[tag=eated_zombie,limit=1] max_health base get

function skill:eat/zombie_editor_dialog with storage zombie:eated

advancement revoke @s only skill:use_zombie_editor

tellraw @a {storage:"zombie:eated",nbt:"player_name"}