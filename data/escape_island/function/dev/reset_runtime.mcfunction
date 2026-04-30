scoreboard players set $game in_game 0
scoreboard players set $game cur_phase 0
scoreboard players set $game phase_timer 0
scoreboard players set $game signal_progress 0
scoreboard players set $game signal_done 0
scoreboard players set $game gen_done 0
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
scoreboard players set $game escaped_count 0
scoreboard players set $game bomb_armed 0
scoreboard players set $game ship_progress 0
scoreboard players set $game ship_parts 0
scoreboard players set $game ship_countdown 0
scoreboard players set $game lab_cards 0
scoreboard players set $event event_timer 0
scoreboard players set $event event_threshold 0
scoreboard players set $event event_roll 0
scoreboard players set $tick cycle20 0
scoreboard players set $tick cycle5 0

scoreboard players set @e[type=minecraft:marker,tag=marker.generator] gen_progress 0
scoreboard players set @e[type=minecraft:marker,tag=marker.generator] gen_state 0
scoreboard players set @e[type=minecraft:marker,tag=marker.generator] gen_countdown 0
scoreboard players set @e[type=minecraft:marker,tag=marker.generator] gen_overload 0
scoreboard players set @a gen_hold_time 0
scoreboard players set @a gen_hold_seen 0
scoreboard players set @a gen_hold_lock 0
scoreboard players set @a gen_interact_cd 0
scoreboard players set @a signal_repair_time 0
scoreboard players set @a signal_repair_seen 0

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

tag @a remove event.blackout
tag @a remove event.storm
tag @a remove event.has_flashlight
tag @a remove gen.channel.sabotage
tag @a remove gen.channel.repair
tag @a remove state.boarding
tag @a remove state.disguise_scanning
effect clear @a minecraft:blindness
effect clear @a minecraft:nausea
weather clear 600
clear @a *[custom_data~{item:"generator_action"}]
function escape_island:escape/helicopter_cleanup
tag @e[type=minecraft:marker,tag=marker.heli_pad] remove heli.selected_pad

schedule clear escape_island:event/_blackout_end
schedule clear escape_island:event/_storm_end
schedule clear escape_island:event/_static_end
schedule clear escape_island:escape/_helicopter_depart
schedule clear escape_island:escape/_disguise_scan_complete
schedule clear escape_island:escape/_ship_go

title @a actionbar ""
