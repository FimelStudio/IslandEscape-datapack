
clear @s minecraft:carved_pumpkin
function escape_island:ui/spore_bar/clear
team join infected @s

execute if entity @s[tag=role.doctor] run tag @s add retained.doctor
execute if entity @s[tag=role.captain] run tag @s add retained.captain
execute if entity @s[tag=role.engineer] run tag @s add retained.engineer
execute if entity @s[tag=role.marine] run tag @s add retained.marine
execute if entity @s[tag=role.chef] run tag @s add retained.chef
execute if entity @s[tag=role.radio] run tag @s add retained.radio
execute if entity @s[tag=role.virologist] run tag @s add retained.virologist
execute if entity @s[tag=role.mechanic] run tag @s add retained.mechanic
execute if entity @s[tag=role.athlete] run tag @s add retained.athlete
execute if entity @s[tag=role.priest] run tag @s add retained.priest

tag @s remove team.human
tag @s remove state.infected_period
tag @s remove role.doctor
tag @s remove role.captain
tag @s remove role.engineer
tag @s remove role.marine
tag @s remove role.chef
tag @s remove role.radio
tag @s remove role.virologist
tag @s remove role.mechanic
tag @s remove role.athlete
tag @s remove skill.adrenaline.active
tag @s remove skill.slide.active
tag @s remove skill.slide.locked
tag @s remove role.priest
tag @s add team.infected
tag @s add infected.common
execute as @a[tag=infected.mother,limit=1] run scoreboard players add @s match_infect 25
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

function escape_island:util/recount_infected
execute if score $tmp infected_count matches 1 as @a[tag=infected.mother,tag=!state.dead] run function escape_island:mother/milestone_first_infect
execute if score $tmp infected_count matches 3 as @a[tag=infected.mother,tag=!state.dead] run function escape_island:mother/milestone_third_infect
tellraw @a[tag=!infected.mother] {"text":"§c岛上有人倒下了……","color":"dark_red","italic":true}
tellraw @a[tag=infected.mother] [{"text":"§4+1 感染者已就位。总计: "},{"score":{"name":"$tmp","objective":"infected_count"}}]
execute if entity @a[tag=infected.mother,tag=!state.dead,limit=1] run tellraw @s [{"text":"§4[感染链] 核心母体: ","color":"dark_red"},{"selector":"@a[tag=infected.mother,tag=!state.dead,limit=1]","color":"red"},{"text":"。死亡后你将在母体附近复活。","color":"dark_red"}]
execute unless entity @a[tag=infected.mother,tag=!state.dead,limit=1] run tellraw @s {"text":"§8[感染链] 母体信号消失。你无法再依靠母体复活。","color":"dark_gray"}

execute if score $game in_game matches 1 unless entity @a[tag=team.human] run function escape_island:game/end_all_infected
