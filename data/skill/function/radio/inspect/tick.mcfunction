tag @s add skill.radio_inspector
tag @e[tag=skill.radio_inspect_target] remove skill.radio_inspect_target
tag @s remove skill.radio_role_found

execute anchored eyes positioned ^ ^ ^1 unless entity @e[tag=skill.radio_inspect_target,limit=1] as @a[tag=!skill.radio_inspector,tag=!state.dead,distance=..0.75,sort=nearest,limit=1] run tag @s add skill.radio_inspect_target
execute anchored eyes positioned ^ ^ ^2 unless entity @e[tag=skill.radio_inspect_target,limit=1] as @a[tag=!skill.radio_inspector,tag=!state.dead,distance=..0.8,sort=nearest,limit=1] run tag @s add skill.radio_inspect_target
execute anchored eyes positioned ^ ^ ^3 unless entity @e[tag=skill.radio_inspect_target,limit=1] as @a[tag=!skill.radio_inspector,tag=!state.dead,distance=..0.9,sort=nearest,limit=1] run tag @s add skill.radio_inspect_target
execute anchored eyes positioned ^ ^ ^4 unless entity @e[tag=skill.radio_inspect_target,limit=1] as @a[tag=!skill.radio_inspector,tag=!state.dead,distance=..1.0,sort=nearest,limit=1] run tag @s add skill.radio_inspect_target
execute anchored eyes positioned ^ ^ ^5 unless entity @e[tag=skill.radio_inspect_target,limit=1] as @a[tag=!skill.radio_inspector,tag=!state.dead,distance=..1.1,sort=nearest,limit=1] run tag @s add skill.radio_inspect_target

execute anchored eyes positioned ^ ^ ^1 unless entity @e[tag=skill.radio_inspect_target,limit=1] as @e[tag=test.dummy,distance=..0.75,sort=nearest,limit=1] run tag @s add skill.radio_inspect_target
execute anchored eyes positioned ^ ^ ^2 unless entity @e[tag=skill.radio_inspect_target,limit=1] as @e[tag=test.dummy,distance=..0.8,sort=nearest,limit=1] run tag @s add skill.radio_inspect_target
execute anchored eyes positioned ^ ^ ^3 unless entity @e[tag=skill.radio_inspect_target,limit=1] as @e[tag=test.dummy,distance=..0.9,sort=nearest,limit=1] run tag @s add skill.radio_inspect_target
execute anchored eyes positioned ^ ^ ^4 unless entity @e[tag=skill.radio_inspect_target,limit=1] as @e[tag=test.dummy,distance=..1.0,sort=nearest,limit=1] run tag @s add skill.radio_inspect_target
execute anchored eyes positioned ^ ^ ^5 unless entity @e[tag=skill.radio_inspect_target,limit=1] as @e[tag=test.dummy,distance=..1.1,sort=nearest,limit=1] run tag @s add skill.radio_inspect_target

execute if entity @e[tag=skill.radio_inspect_target,limit=1] run function skill:radio/inspect/show

tag @s remove skill.radio_inspector
tag @e[tag=skill.radio_inspect_target] remove skill.radio_inspect_target
tag @a[tag=skill.radio_role_found] remove skill.radio_role_found
