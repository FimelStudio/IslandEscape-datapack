clear @s
clear @s minecraft:crossbow[minecraft:custom_data~{weapon:"pistol"}]
clear @s minecraft:sugar[minecraft:custom_data~{weapon:"pistol"}]
function skill:weapon/pistol/clear_state
tag @s add state.training
tag @s remove role.survivor
tag @s remove role.doctor
tag @s remove doctor
tag @s remove role.captain
tag @s remove captain
tag @s remove role.engineer
tag @s remove engineer
tag @s remove role.marine
tag @s remove marine
tag @s remove role.chef
tag @s remove chef
tag @s remove role.radio
tag @s remove radio
tag @s remove role.virologist
tag @s remove virologist
tag @s remove role.mechanic
tag @s remove role.sailor
tag @s remove role.athlete
tag @s remove athlete
tag @s remove role.priest
tag @s remove role.mother
tag @s remove role.infected
tag @s remove adren_active
tag @s remove sliding
tag @s remove slide_locked
tag @s remove flag.cross_intact
tag @s remove flag.has_inject
tag @s remove flag.self_injected_this_period
tag @s remove skill.antidote_user
tag @s remove skill.antidote_target
tag @s remove skill.battery_recalled
function skill:radio/cleanup_non_radio
function skill:virologist/cleanup_non_virologist
scoreboard players set @s role 0
scoreboard players set @s cd_doctor 0
scoreboard players set @s skill.antidote_charges 0
scoreboard players set @s skill.antidote_cd 0
scoreboard players set @s skill.antidote_regen_cd 0
scoreboard players set @s skill.antidote_item 0
scoreboard players set @s skill.antidote_state 0
scoreboard players set @s skill.whistle_cd 0
scoreboard players set @s skill.whistle_item 0
scoreboard players set @s skill.whistle_state 0
scoreboard players set @s skill.battery_cd 0
scoreboard players set @s skill.battery_item 0
scoreboard players set @s skill.battery_state 0
scoreboard players set @s skill.suppress_cd 0
scoreboard players set @s skill.suppress_item 0
scoreboard players set @s skill.suppress_state 0
scoreboard players set @s skill.gm_burst 0
scoreboard players set @s skill.gm_delay 0
scoreboard players set @s skill.gm_input_cd 0
scoreboard players set @s skill.soup_cd 0
scoreboard players set @s skill.soup_item 0
scoreboard players set @s skill.soup_state 0
scoreboard players set @s skill.soup_sec 0
scoreboard players set @s skill.soup_last_sec 0
scoreboard players set @s skill.adren_time 0
scoreboard players set @s skill.adren_cd 0
scoreboard players set @s skill.slide_time 0
scoreboard players set @s skill.slide_cd 0
effect clear @s
attribute @s minecraft:movement_speed base set 0.1
effect give @s minecraft:saturation 1 20 true
