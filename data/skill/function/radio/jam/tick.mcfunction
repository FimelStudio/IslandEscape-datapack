kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:echo_shard",components:{"minecraft:custom_data":{skill:"radio_jam"}}}}]
kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:sugar",components:{"minecraft:custom_data":{skill:"radio_jam_used"}}}}]

scoreboard players remove @a[tag=retained.radio,tag=infected.common,tag=!state.dead,scores={skill.radio_jam_cd=1..}] skill.radio_jam_cd 1
execute as @a[tag=retained.radio,tag=infected.common,tag=!state.dead,scores={skill.radio_jam_cd=0,skill.radio_jam_state=2}] run function skill:radio/jam/update_item
execute as @a[tag=retained.radio,tag=infected.common,tag=!state.dead,scores={skill.radio_jam_cd=1..}] run function skill:radio/jam/update_item
execute as @a[tag=retained.radio,tag=infected.common,tag=!state.dead] run function skill:radio/jam/ensure_item
