tag @s remove skill.clicker_spore.new
scoreboard players operation @s skill.clicker_target_id = #spawn_target skill.clicker_cfg
scoreboard players operation @s skill.clicker_spore_hp = #spore_health skill.clicker_cfg
scoreboard players operation @s skill.clicker_spore_life = #spore_life skill.clicker_cfg
execute as @a[tag=team.human,tag=!state.dead,tag=!state.escaped,tag=!state.spectator,distance=..96] if score @s skill.clicker_id = #spawn_target skill.clicker_cfg run tag @s add skill.clicker_spore.target
execute if entity @a[tag=skill.clicker_spore.target,distance=..96,limit=1] run tp @s ~ ~ ~ facing entity @a[tag=skill.clicker_spore.target,distance=..96,limit=1] eyes
tag @a remove skill.clicker_spore.target
particle minecraft:dust{color:[0.0,0.75,0.25],scale:0.9} ~ ~ ~ 0.12 0.12 0.12 0.01 8 force @a[distance=..24]
