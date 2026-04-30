kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:compass",components:{"minecraft:custom_data":{skill:"radio_signal_scan"}}}}]
kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:sugar",components:{"minecraft:custom_data":{skill:"radio_signal_scan_used"}}}}]

scoreboard players remove @a[tag=role.radio,scores={skill.signal_scan_cd=1..}] skill.signal_scan_cd 1
scoreboard players remove @a[tag=role.radio,scores={skill.signal_scan_time=1..}] skill.signal_scan_time 1

execute as @a[tag=role.radio,scores={skill.signal_scan_cd=0,skill.signal_scan_state=2}] run function skill:radio/signal_scan/update_item
execute as @a[tag=role.radio,scores={skill.signal_scan_cd=1..}] run function skill:radio/signal_scan/cooldown_tick
execute as @a[tag=role.radio] run function skill:radio/signal_scan/ensure_item
