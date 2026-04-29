kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:crossbow",components:{"minecraft:custom_data":{skill:"marine_suppress"}}}}]

scoreboard players remove @a[tag=marine,scores={skill.suppress_cd=1..}] skill.suppress_cd 1

execute as @a[tag=marine,scores={skill.suppress_cd=0,skill.suppress_state=2}] run function skill:marine/suppress/update_item
execute as @a[tag=marine,scores={skill.suppress_cd=1..}] run function skill:marine/suppress/cooldown_tick
execute as @a[tag=marine] run function skill:marine/suppress/ensure_item
