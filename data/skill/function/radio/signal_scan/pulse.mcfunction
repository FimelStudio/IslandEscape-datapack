tag @s add skill.radio.viewer
execute at @a[tag=team.human,tag=!state.dead] run particle minecraft:dust{color:[0.0,0.85,1.0],scale:1.1} ~ ~2.1 ~ 0.28 0.42 0.28 0.01 10 force @a[tag=skill.radio.viewer]
execute at @a[tag=infected.mother,tag=state.disguised,tag=!state.dead] run particle minecraft:dust{color:[0.0,0.85,1.0],scale:1.1} ~ ~2.1 ~ 0.28 0.42 0.28 0.01 10 force @a[tag=skill.radio.viewer]
execute at @a[tag=team.human,tag=!state.dead] run particle minecraft:sonic_boom ~ ~1.2 ~ 0 0 0 0 1 force @a[tag=skill.radio.viewer]
execute at @a[tag=infected.mother,tag=state.disguised,tag=!state.dead] run particle minecraft:sonic_boom ~ ~1.2 ~ 0 0 0 0 1 force @a[tag=skill.radio.viewer]
tag @s remove skill.radio.viewer
