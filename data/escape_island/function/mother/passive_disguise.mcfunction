execute unless entity @s[tag=infected.mother,tag=!state.dead,tag=!state.mutated,tag=!state.disguised] run return 0

tag @s remove mother.passive.fire
execute unless entity @a[tag=team.human,tag=!state.dead,tag=!state.escaped,tag=!state.spectator,tag=!state.infected_period,distance=..4,sort=nearest,limit=1] run scoreboard players set @s mother_passive_stick 0
execute unless entity @a[tag=team.human,tag=!state.dead,tag=!state.escaped,tag=!state.spectator,tag=!state.infected_period,distance=..4,sort=nearest,limit=1] run scoreboard players set @s cd_mother_passive_spore 0
execute unless entity @a[tag=team.human,tag=!state.dead,tag=!state.escaped,tag=!state.spectator,tag=!state.infected_period,distance=..4,sort=nearest,limit=1] run return 0

scoreboard players add @s mother_passive_stick 1
execute if score @s cd_mother_passive_spore matches 1.. run scoreboard players remove @s cd_mother_passive_spore 1
execute if score @s mother_passive_stick >= Tunable tunable.mother_passive_stick_seconds if score @s cd_mother_passive_spore matches ..0 run tag @s add mother.passive.fire
execute if entity @s[tag=mother.passive.fire] run scoreboard players operation @s cd_mother_passive_spore = Tunable tunable.mother_passive_pulse_seconds
execute if entity @s[tag=mother.passive.fire] at @s as @a[tag=team.human,tag=!state.dead,tag=!state.escaped,tag=!state.spectator,tag=!state.infected_period,distance=..4,sort=nearest,limit=1] run function escape_island:mother/passive_disguise/apply_spore
tag @s remove mother.passive.fire
