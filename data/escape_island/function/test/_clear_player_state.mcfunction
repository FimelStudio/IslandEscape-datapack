function escape_island:dev/_reset_player_state
function skill:athlete/slide_tackle/cleanup_non_athlete
function skill:weapon/pistol/clear_state
function skill:weapon/pistol/clear_xp

tag @s remove state.training
tag @s remove state.boarding
tag @s remove state.escaped
tag @s remove state.spectator
tag @s remove state.disguise_scanning
tag @s remove state.berserk
tag @s remove state.infect_immune
tag @s remove retained.doctor
tag @s remove retained.captain
tag @s remove retained.engineer
tag @s remove retained.marine
tag @s remove retained.chef
tag @s remove retained.radio
tag @s remove retained.virologist
tag @s remove retained.mechanic
tag @s remove retained.athlete
tag @s remove retained.priest
tag @s remove flag.has_keynote
tag @s remove flag.has_promfile
tag @s remove flag.self_injected_this_period
tag @s remove event.blackout
tag @s remove event.storm
tag @s remove event.has_flashlight
tag @s remove skill.radio.viewer
tag @s remove skill.radio.inspecting
tag @s remove skill.virologist.hit
tag @s remove skill.virologist.viewer
tag @s remove skill.trap.recalled

scoreboard players set @s role 0
scoreboard players set @s hb_phase 0
scoreboard players set @s used_firework_last 0
scoreboard players set @s gen_hold_time 0
scoreboard players set @s gen_hold_seen 0
scoreboard players set @s gen_hold_lock 0
scoreboard players set @s gen_interact_cd 0
scoreboard players set @s signal_repair_time 0
scoreboard players set @s signal_repair_seen 0
scoreboard players set @s ship_hold_time 0
scoreboard players set @s ship_hold_seen 0
scoreboard players set @s bomb_repair_time 0
scoreboard players set @s bomb_file_count 0
scoreboard players set @s mother_hp 0
scoreboard players set @s cd_doctor 0
scoreboard players set @s cd_marine 0
scoreboard players set @s cd_chef 0
scoreboard players set @s cd_radio 0
scoreboard players set @s cd_virologist 0
scoreboard players set @s cd_mechanic 0
scoreboard players set @s cd_priest 0
scoreboard players set @s skill.detector_cd 0
scoreboard players set @s skill.detector_item 0
scoreboard players set @s skill.detector_state 0
scoreboard players set @s skill.detector_sec 0
scoreboard players set @s skill.detector_last_sec 0
scoreboard players set @s skill.viro_passive_cd 0
scoreboard players set @s skill.signal_scan_cd 0
scoreboard players set @s skill.signal_scan_item 0
scoreboard players set @s skill.signal_scan_state 0
scoreboard players set @s skill.signal_scan_sec 0
scoreboard players set @s skill.signal_scan_last_sec 0
scoreboard players set @s skill.signal_scan_time 0
scoreboard players set @s skill.trap_cd 0
scoreboard players set @s skill.trap_item 0
scoreboard players set @s skill.trap_state 0
scoreboard players set @s skill.trap_sec 0
scoreboard players set @s skill.trap_charges 0
scoreboard players set @s skill.trap_place_cd 0
scoreboard players set @s skill.adren_item 0
scoreboard players set @s skill.adren_sec 0
scoreboard players set @s skill.adren_last_sec 0
scoreboard players set @s skill.slide_ok 0
scoreboard players set @s skill.slide_fall 0
scoreboard players set @s skill.slide_cost 0
scoreboard players set @s skill.stamina 0
scoreboard players set @s skill.stamina_bar 0
scoreboard players set @s skill.stamina_color 0
scoreboard players set @s skill.pistol_mag 0
scoreboard players set @s skill.pistol_fire_cd 0
scoreboard players set @s skill.pistol_reload 0
scoreboard players set @s skill.pistol_reload_sec 0
scoreboard players set @s skill.pistol_tmp 0
scoreboard players set @s skill.pistol_swap 0
scoreboard players set @s skill.battery_timer 0
scoreboard players set @s skill.gm_runtime 0
scoreboard players reset @s ie.dialog
scoreboard players reset @s ie.eat_health

title @s title ""
title @s subtitle ""
title @s actionbar ""
