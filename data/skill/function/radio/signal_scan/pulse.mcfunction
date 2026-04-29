tag @s add skill.radio_viewer
execute at @a[tag=role.survivor,tag=!state.dead] run particle minecraft:dust{color:[0.0,0.85,1.0],scale:1.1} ~ ~2.1 ~ 0.28 0.42 0.28 0.01 10 force @a[tag=skill.radio_viewer]
execute at @a[tag=role.mother,tag=state.disguised,tag=!state.dead] run particle minecraft:dust{color:[0.0,0.85,1.0],scale:1.1} ~ ~2.1 ~ 0.28 0.42 0.28 0.01 10 force @a[tag=skill.radio_viewer]
execute at @a[tag=role.survivor,tag=!state.dead] run particle minecraft:sonic_boom ~ ~1.2 ~ 0 0 0 0 1 force @a[tag=skill.radio_viewer]
execute at @a[tag=role.mother,tag=state.disguised,tag=!state.dead] run particle minecraft:sonic_boom ~ ~1.2 ~ 0 0 0 0 1 force @a[tag=skill.radio_viewer]
tag @s remove skill.radio_viewer
