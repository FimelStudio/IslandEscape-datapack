clear @s
clear @s minecraft:crossbow[minecraft:custom_data~{weapon:"pistol"}]
clear @s minecraft:sugar[minecraft:custom_data~{weapon:"pistol"}]
function skill:weapon/pistol/clear_state
tag @s add state.training
tag @s remove team.human
tag @s remove team.infected
tag @s remove infected.secondary_mother
tag @s remove infected.special
tag @s remove infected.licker
tag @s remove infected.listener
tag @s remove infected.runner
tag @s remove infected.tank
tag @s remove infected.spitter
tag @s remove state.latent_host
tag @s remove role.doctor
tag @s remove role.captain
tag @s remove role.engineer
tag @s remove role.marine
tag @s remove role.chef
tag @s remove role.radio
tag @s remove role.virologist
tag @s remove role.mechanic
tag @s remove role.sailor
tag @s remove role.athlete
tag @s remove role.priest
tag @s remove skill.priest.cross.active
tag @s remove flag.cross_intact
tag @s remove infected.common
tag @s remove skill.adrenaline.active
tag @s remove skill.slide.active
tag @s remove skill.slide.locked
tag @s remove flag.cross_intact
tag @s remove flag.has_inject
tag @s remove flag.self_injected_this_period
tag @s remove skill.antidote.user
tag @s remove skill.antidote.target
tag @s remove skill.battery.recalled
function skill:radio/cleanup_non_radio
function skill:virologist/cleanup_non_virologist
function skill:mechanic/cleanup_non_mechanic
function skill:priest/cleanup_non_priest
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
scoreboard players set @s skill.trap_cd 0
scoreboard players set @s skill.trap_item 0
scoreboard players set @s skill.trap_state 0
scoreboard players set @s skill.trap_sec 0
scoreboard players set @s skill.trap_charges 0
scoreboard players set @s skill.trap_place_cd 0
scoreboard players set @s skill.adren_time 0
scoreboard players set @s skill.adren_cd 0
scoreboard players set @s skill.slide_time 0
scoreboard players set @s skill.slide_cd 0
scoreboard players set @s skill.slide_sprint 0
effect clear @s
attribute @s minecraft:movement_speed base set 0.1
effect give @s minecraft:saturation 1 20 true
