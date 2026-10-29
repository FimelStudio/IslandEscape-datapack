clear @s paper[minecraft:equippable={damage_on_hurt:false,slot:head,camera_overlay:"ie:misc/red"},item_model="ie:empty",minecraft:custom_name=""]
function escape_island:ui/spore_bar/clear
team join infected @s
function escape_island:visual/infected_common

execute if entity @s[tag=role.athlete] at @s run function skill:athlete/slide_tackle/cleanup_non_athlete
function escape_island:role/retain_on_infection

function escape_island:game/human/leave
tag @s remove state.infected_period
tag @s remove state.infection_resist
scoreboard players set @s ie.resist_left 0
tag @s remove skill.adrenaline.active
tag @s remove skill.slide.active
tag @s remove skill.slide.locked
tag @s add team.infected
tag @s add infected.common
execute as @a[tag=infected.mother,tag=!state.dead,tag=!state.spectator,limit=1] run scoreboard players add @s match_infect 25
function skill:radio/cleanup_non_radio
function skill:virologist/cleanup_non_virologist
function skill:mechanic/cleanup_non_mechanic
function skill:priest/cleanup_non_priest
scoreboard players set @s role 12
scoreboard players set @s skill.antidote_charges 0
scoreboard players set @s skill.antidote_cd 0
scoreboard players set @s skill.antidote_regen_cd 0
scoreboard players set @s skill.antidote_state 0
scoreboard players set @s skill.whistle_cd 0
scoreboard players set @s skill.whistle_state 0
scoreboard players set @s skill.battery_cd 0
scoreboard players set @s skill.battery_state 0
scoreboard players set @s skill.suppress_cd 0
scoreboard players set @s skill.suppress_state 0
scoreboard players set @s skill.gm_burst 0
scoreboard players set @s skill.gm_delay 0
scoreboard players set @s skill.gm_input_cd 0
scoreboard players set @s skill.soup_cd 0
scoreboard players set @s skill.soup_item 0
scoreboard players set @s skill.soup_state 0
scoreboard players set @s skill.soup_sec 0
scoreboard players set @s skill.soup_last_sec 0
scoreboard players set @s skill.trap_cd 0
scoreboard players set @s skill.trap_state 0
scoreboard players set @s skill.trap_place_cd 0

attribute @s minecraft:attack_damage base set 4

clear @s #skill:role_items
clear @s minecraft:iron_axe

execute if entity @s[tag=retained.mechanic] run function skill:mechanic/trap/config
execute if entity @s[tag=retained.mechanic] run scoreboard players operation @s skill.trap_charges = #max_traps skill.trap_cfg
execute if entity @s[tag=retained.mechanic] run function skill:mechanic/trap/update_item

title @s title {"text":"§4感染","bold":true}
title @s subtitle {"text":"§c你已被同化。扩散孢子。"}
playsound minecraft:entity.witch.celebrate master @s ~ ~ ~ 1 0.5
tellraw @s [{"text":"[感染者目标] ","color":"dark_red","bold":true},{"text":"追击幸存者，保护母体，阻止他们修信号塔或登上直升机。死亡后会尝试在母体附近复活。","color":"red"}]

function escape_island:util/recount_infected
execute if score $tmp infected_count matches 1 as @a[tag=infected.mother,tag=!state.dead,tag=!state.spectator] run function escape_island:mother/milestone_first_infect
execute if score $tmp infected_count matches 3 as @a[tag=infected.mother,tag=!state.dead,tag=!state.spectator] run function escape_island:mother/milestone_third_infect
tellraw @a[tag=!infected.mother] {"text":"§c岛上有人倒下了……","color":"dark_red","italic":true}
tellraw @a[tag=infected.mother,tag=!state.dead,tag=!state.spectator] [{"text":"§4+1 感染者已就位。总计: "},{"score":{"name":"$tmp","objective":"infected_count"}}]
execute if entity @a[tag=infected.mother,tag=!state.dead,tag=!state.spectator,limit=1] run tellraw @s [{"text":"§4[感染链] 核心母体: ","color":"dark_red"},{"selector":"@a[tag=infected.mother,tag=!state.dead,tag=!state.spectator,limit=1]","color":"red"},{"text":"。死亡后你将在母体附近复活。","color":"dark_red"}]
execute unless entity @a[tag=infected.mother,tag=!state.dead,tag=!state.spectator,limit=1] run tellraw @s {"text":"§8[感染链] 母体信号消失。你无法再依靠母体复活。","color":"dark_gray"}
