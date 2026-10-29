# 世界运行状态清理；保留地图 marker、结算快照和长期记录。
scoreboard players set $game cur_phase 0
scoreboard players set $game ie.humans 0
scoreboard players set $game ie.players 0
scoreboard players set $game ie.online 0
scoreboard players set $game phase_timer 0
scoreboard players set $game final_pressure 0
scoreboard players set $game signal_progress 0
scoreboard players set $game signal_done 0
scoreboard players set $game gen_done 0
scoreboard players set $game power_buff 0
scoreboard players set $game power_buff_acc 0
scoreboard players set $game ship_aura_acc 0
scoreboard players set $game gen_state 0
scoreboard players set $game gen_countdown 0
scoreboard players set $game gen_overload 0
scoreboard players set $game gen_hold_time 0
scoreboard players set $game gen_hold_seen 0
scoreboard players set $game gen_hold_lock 0
scoreboard players set $game gen_interact_cd 0
scoreboard players set $game dawn_active 0
scoreboard players set $game heli_countdown 0
scoreboard players set $game heli_motion 0
scoreboard players set $game bomb_armed 0
scoreboard players set $game ship_progress 0
scoreboard players set $game ship_bonus_tick 0
function escape_island:task/ship_reset_parts
scoreboard players set $game ship_countdown 0
scoreboard players set $game ship_hold_time 0
scoreboard players set $game ship_hold_seen 0
scoreboard players set $game lab_cards 0
scoreboard players set $event event_timer 0
scoreboard players set $blackout ie.event 0
scoreboard players set $storm ie.event 0
scoreboard players set $event event_threshold 0
scoreboard players set $event event_roll 0
scoreboard players set $tick cycle20 0
scoreboard players set $tick cycle5 0
scoreboard players set @e[type=minecraft:marker,tag=marker.generator] gen_progress 0
scoreboard players set @e[type=minecraft:marker,tag=marker.generator] gen_state 0
scoreboard players set @e[type=minecraft:marker,tag=marker.generator] gen_countdown 0
scoreboard players set @e[type=minecraft:marker,tag=marker.generator] gen_overload 0
scoreboard players set @e[type=minecraft:marker,tag=marker.signal_tower] signal_local 0
scoreboard players set @e[type=minecraft:marker,tag=marker.signal_tower] signal_repair_acc 0
tag @e[tag=marker.signal_done] remove marker.signal_done
bossbar set escape_island:phase visible false
bossbar set escape_island:signal visible false
bossbar set escape_island:gen visible false
bossbar set escape_island:heli visible false
bossbar set escape_island:ship visible false
bossbar set escape_island:sub visible false
bossbar set escape_island:bomb visible false
bossbar set escape_island:infection visible false
bossbar set escape_island:disguise visible false
bossbar set escape_island:mother_respawn visible false
weather clear 600
function escape_island:escape/helicopter_cleanup
tag @e[type=minecraft:marker,tag=marker.heli_pad] remove heli.selected_pad
kill @e[type=minecraft:interaction,tag=entity.ship_door]
kill @e[tag=entity.ship_door_hint]
kill @e[type=minecraft:marker,tag=entity.clicker_spore]
kill @e[type=minecraft:marker,tag=entity.clicker_spore_pending]
scoreboard players set #next_target skill.clicker_cfg 0
scoreboard players set $game dawn_timer 0
scoreboard players set $game p2_ambient_cd 0
scoreboard players set $game sub_countdown 0
scoreboard players set $game bomb_countdown 0
scoreboard players set $game ie.mutate_left 0
scoreboard players set $game ie.finish_left 0
scoreboard players set $game ie.evac_ready 0
scoreboard players set $game ie.pending_kind 0
scoreboard players set $game ie.mode 0
scoreboard players set $forger signal_forger_active 0
scoreboard players set $forger signal_forger_offset 0
scoreboard players set #lxj play_sound 0

kill @e[tag=entity.sub_door]
kill @e[tag=entity.sub_door_hint]
kill @e[tag=entity.generator_interaction]
kill @e[tag=entity.researcher]
kill @e[tag=entity.engineer_battery]
kill @e[tag=entity.mechanic_trap]
kill @e[tag=entity.chef_stew_pot]
kill @e[tag=entity.downed_anchor]
kill @e[tag=entity.dead_anchor]
kill @e[tag=display.infection_vignette]
kill @e[tag=skill.slide.vehicle]
kill @e[tag=test.dummy]
kill @e[tag=dev.mother_sim]
kill @e[tag=test.boarding_kick_marker]
function skill:mother/eat/clear_storage
function escape_island:range/cleanup
function escape_island:gunfight/cleanup

scoreboard players set $game mother_dead 0
scoreboard players set $game infected_dead 0
scoreboard players set $tick decay_cycle 0
scoreboard players set $training cycle20 0
scoreboard players set $training cycle5 0

bossbar set escape_island:scan visible false
scoreboard players set @e[type=minecraft:marker] scan_active 0
scoreboard players set @e[type=minecraft:marker] scan_time 0
scoreboard players set @e[type=minecraft:marker] scan_station_cd 0
scoreboard players set @e[type=minecraft:marker] scan_result 0

kill @e[tag=ie.owned]
