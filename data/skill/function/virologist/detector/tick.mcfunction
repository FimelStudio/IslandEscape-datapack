kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:potion",components:{"minecraft:custom_data":{skill:"viro_detector"}}}}]
kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:glass_bottle",components:{"minecraft:custom_data":{skill:"viro_detector"}}}}]
kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:sugar",components:{"minecraft:custom_data":{skill:"viro_detector_used"}}}}]

scoreboard players remove @a[tag=role.virologist,scores={skill.detector_cd=1..}] skill.detector_cd 1
execute as @a[tag=role.virologist,scores={skill.detector_cd=0,skill.detector_state=2}] run function skill:virologist/detector/update_item
execute as @a[tag=role.virologist,scores={skill.detector_cd=1..}] run function skill:virologist/detector/cooldown_tick
execute as @a[tag=role.virologist] run function skill:virologist/detector/ensure_item
