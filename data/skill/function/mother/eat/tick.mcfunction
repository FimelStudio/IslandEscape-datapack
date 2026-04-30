kill @e[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{skill:"mother/eat"}}}}]
kill @e[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{skill:"mother/eat_release"}}}}]
kill @e[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{skill:"mother/zombie_editor"}}}}]

execute as @a[tag=!infected.mother] run function skill:mother/eat/cleanup_non_mother
execute as @a[tag=infected.mother,tag=!skill.mother.eating] run function skill:mother/eat/ensure_ready
execute as @a[tag=infected.mother,tag=skill.mother.eating] unless entity @a[tag=skill.mother.eat.target,limit=1] run function skill:mother/eat/reset_state
execute as @a[tag=skill.mother.eat.target,tag=skill.mother.eat.absorbing] at @s run function skill:mother/eat/absorb_tick
execute as @a[tag=infected.mother,tag=skill.mother.eating] unless entity @a[tag=skill.mother.eat.target,tag=skill.mother.eat.absorbing,limit=1] run function skill:mother/eat/ensure_eating_items
