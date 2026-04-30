kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:sugar",components:{"minecraft:custom_data":{skill:"captain_whistle"}}}}]
kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:goat_horn",components:{"minecraft:custom_data":{skill:"captain_whistle"}}}}]

execute as @a[tag=!role.captain] run function skill:captain/whistle/cleanup_non_captain

scoreboard players remove @a[tag=role.captain,scores={skill.whistle_cd=1..}] skill.whistle_cd 1

execute as @a[tag=role.captain,scores={skill.whistle_cd=0,skill.whistle_state=2}] run function skill:captain/whistle/update_item
execute as @a[tag=role.captain,scores={skill.whistle_cd=1..}] run function skill:captain/whistle/cooldown_tick
execute as @a[tag=role.captain] run function skill:captain/whistle/ensure_item
