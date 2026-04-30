kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:mushroom_stew",components:{"minecraft:custom_data":{skill:"cook_soup"}}}}]
kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:sugar",components:{"minecraft:custom_data":{skill:"cook_soup"}}}}]

scoreboard players remove @a[tag=role.chef,scores={skill.soup_cd=1..}] skill.soup_cd 1

execute as @a[tag=role.chef,scores={skill.soup_cd=0,skill.soup_state=2}] run function skill:chef/hot_soup/update_item
execute as @a[tag=role.chef,scores={skill.soup_cd=1..}] run function skill:chef/hot_soup/cooldown_tick
execute as @a[tag=role.chef] run function skill:chef/hot_soup/ensure_item
