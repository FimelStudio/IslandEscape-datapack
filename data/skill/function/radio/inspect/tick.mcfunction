tag @s add skill.radio.inspector
tag @e[tag=skill.radio.inspect.target] remove skill.radio.inspect.target
tag @s remove skill.radio.role.found

execute anchored eyes positioned ^ ^ ^1 unless entity @e[tag=skill.radio.inspect.target,limit=1] as @a[tag=!skill.radio.inspector,tag=!state.dead,distance=..0.75,sort=nearest,limit=1] run tag @s add skill.radio.inspect.target
execute anchored eyes positioned ^ ^ ^2 unless entity @e[tag=skill.radio.inspect.target,limit=1] as @a[tag=!skill.radio.inspector,tag=!state.dead,distance=..0.8,sort=nearest,limit=1] run tag @s add skill.radio.inspect.target
execute anchored eyes positioned ^ ^ ^3 unless entity @e[tag=skill.radio.inspect.target,limit=1] as @a[tag=!skill.radio.inspector,tag=!state.dead,distance=..0.9,sort=nearest,limit=1] run tag @s add skill.radio.inspect.target
execute anchored eyes positioned ^ ^ ^4 unless entity @e[tag=skill.radio.inspect.target,limit=1] as @a[tag=!skill.radio.inspector,tag=!state.dead,distance=..1.0,sort=nearest,limit=1] run tag @s add skill.radio.inspect.target
execute anchored eyes positioned ^ ^ ^5 unless entity @e[tag=skill.radio.inspect.target,limit=1] as @a[tag=!skill.radio.inspector,tag=!state.dead,distance=..1.1,sort=nearest,limit=1] run tag @s add skill.radio.inspect.target

execute anchored eyes positioned ^ ^ ^1 unless entity @e[tag=skill.radio.inspect.target,limit=1] as @e[tag=test.dummy,distance=..0.75,sort=nearest,limit=1] run tag @s add skill.radio.inspect.target
execute anchored eyes positioned ^ ^ ^2 unless entity @e[tag=skill.radio.inspect.target,limit=1] as @e[tag=test.dummy,distance=..0.8,sort=nearest,limit=1] run tag @s add skill.radio.inspect.target
execute anchored eyes positioned ^ ^ ^3 unless entity @e[tag=skill.radio.inspect.target,limit=1] as @e[tag=test.dummy,distance=..0.9,sort=nearest,limit=1] run tag @s add skill.radio.inspect.target
execute anchored eyes positioned ^ ^ ^4 unless entity @e[tag=skill.radio.inspect.target,limit=1] as @e[tag=test.dummy,distance=..1.0,sort=nearest,limit=1] run tag @s add skill.radio.inspect.target
execute anchored eyes positioned ^ ^ ^5 unless entity @e[tag=skill.radio.inspect.target,limit=1] as @e[tag=test.dummy,distance=..1.1,sort=nearest,limit=1] run tag @s add skill.radio.inspect.target

execute if entity @e[tag=skill.radio.inspect.target,limit=1] run function skill:radio/inspect/show

tag @s remove skill.radio.inspector
tag @e[tag=skill.radio.inspect.target] remove skill.radio.inspect.target
tag @a[tag=skill.radio.role.found] remove skill.radio.role.found
