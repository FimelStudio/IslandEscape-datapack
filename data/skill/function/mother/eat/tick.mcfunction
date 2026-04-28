kill @e[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{skill:"mother/eat"}}}}]
kill @e[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{skill:"mother/eat_release"}}}}]
kill @e[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{skill:"mother/zombie_editor"}}}}]

execute as @a[tag=!role.mother] run function skill:mother/eat/cleanup_non_mother
execute as @a[tag=role.mother,tag=!mother_eating] run function skill:mother/eat/ensure_ready
execute as @a[tag=role.mother,tag=mother_eating] unless entity @a[tag=eaten_zombie,limit=1] run function skill:mother/eat/reset_state
execute as @a[tag=eaten_zombie,tag=mother_eat_absorbing] at @s run function skill:mother/eat/absorb_tick
execute as @a[tag=role.mother,tag=mother_eating] unless entity @a[tag=eaten_zombie,tag=mother_eat_absorbing,limit=1] run function skill:mother/eat/ensure_eating_items
