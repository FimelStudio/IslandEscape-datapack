scoreboard players remove @s skill.clicker_spore_life 1
execute if score @s skill.clicker_spore_life matches ..0 run return run function skill:clicker/hearing_spore/break

execute as @a[tag=ie.active,tag=team.human,tag=!state.dead,tag=!state.escaped,tag=!state.spectator,distance=..1.05,sort=nearest,limit=1] run function skill:clicker/hearing_spore/spore_hit with storage skill:clicker.hearing_spore config
execute if entity @s[tag=skill.clicker_spore.dead] run return run function skill:clicker/hearing_spore/break

tag @s add skill.clicker_spore.active
tag @a[tag=ie.active] remove skill.clicker_spore.target
execute as @a[tag=ie.active,tag=team.human,tag=!state.dead,tag=!state.escaped,tag=!state.spectator,distance=..96] if score @s skill.clicker_id = @e[type=minecraft:marker,tag=skill.clicker_spore.active,limit=1] skill.clicker_target_id run tag @s add skill.clicker_spore.target
execute if entity @a[tag=skill.clicker_spore.target,distance=..96,limit=1] run tp @s ~ ~ ~ facing entity @a[tag=skill.clicker_spore.target,distance=..96,limit=1] eyes
execute unless entity @a[tag=skill.clicker_spore.target,distance=..96,limit=1] if entity @a[tag=team.human,tag=!state.dead,tag=!state.escaped,tag=!state.spectator,distance=..72,limit=1] run tp @s ~ ~ ~ facing entity @a[tag=team.human,tag=!state.dead,tag=!state.escaped,tag=!state.spectator,distance=..72,sort=nearest,limit=1] eyes
execute if block ~ ~ ~ #skill:bullet_passable run function skill:clicker/hearing_spore/move_free with storage skill:clicker.hearing_spore config
execute unless block ~ ~ ~ #skill:bullet_passable run function skill:clicker/hearing_spore/move_wall with storage skill:clicker.hearing_spore config

execute if block ~ ~ ~ #skill:bullet_passable run particle minecraft:dust{color:[0.0,0.75,0.25],scale:0.55} ~ ~ ~ 0.08 0.08 0.08 0 2 force @a[distance=..32]
execute unless block ~ ~ ~ #skill:bullet_passable run particle minecraft:dust{color:[0.0,0.35,0.08],scale:0.45} ~ ~ ~ 0.04 0.04 0.04 0 1 force @a[distance=..32]
tag @s remove skill.clicker_spore.active
tag @a[tag=ie.active] remove skill.clicker_spore.target
