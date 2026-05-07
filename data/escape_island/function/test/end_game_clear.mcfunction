function escape_island:dev/reset_runtime

scoreboard players set $game in_game 0
scoreboard players set $game cur_phase 0
scoreboard players set $game phase_timer 0
scoreboard players set $game dawn_timer 0
scoreboard players set $game dawn_active 0
scoreboard players set $game signal_progress 0
scoreboard players set $game signal_done 0
scoreboard players set $game gen_done 0
scoreboard players set $game gen_state 0
scoreboard players set $game gen_countdown 0
scoreboard players set $game gen_overload 0
scoreboard players set $game ship_progress 0
scoreboard players set $game ship_bonus_tick 0
scoreboard players set $game ship_countdown 0
scoreboard players set $game lab_cards 0
scoreboard players set $game sub_countdown 0
scoreboard players set $game bomb_armed 0
scoreboard players set $game bomb_countdown 0
scoreboard players set $game ending_triggered 0
scoreboard players set $game heli_countdown 0
scoreboard players set $game heli_motion 0
scoreboard players set $game escaped_count 0
scoreboard players set $game infected_dead 0
scoreboard players set $game mother_dead 0
scoreboard players set $game player_count 0
scoreboard players set $game infected_count 0
scoreboard players set $tick cycle20 0
scoreboard players set $tick cycle5 0
scoreboard players set $tick decay_cycle 0
scoreboard players set $event event_timer 0
scoreboard players set $event event_threshold 0
scoreboard players set $event event_roll 0
scoreboard players set #lxj play_sound 0
function escape_island:task/ship_reset_parts

execute as @a run function escape_island:test/_clear_player_state

scoreboard players set @e[type=minecraft:marker,tag=marker.generator] gen_progress 0
scoreboard players set @e[type=minecraft:marker,tag=marker.generator] gen_state 0
scoreboard players set @e[type=minecraft:marker,tag=marker.generator] gen_countdown 0
scoreboard players set @e[type=minecraft:marker,tag=marker.generator] gen_overload 0

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

schedule clear escape_island:game/end_mutate
schedule clear escape_island:game/end_all_infected_finish
schedule clear escape_island:event/_blackout_end
schedule clear escape_island:event/_storm_end
schedule clear escape_island:event/_static_end
schedule clear escape_island:escape/_helicopter_depart
schedule clear escape_island:escape/_disguise_scan_complete
schedule clear escape_island:escape/_ship_go
schedule clear escape_island:util/lxj_sound
schedule clear skill:mother/_disguise_expire
schedule clear escape_island:infection/_remove_resist

function escape_island:escape/helicopter_cleanup
function skill:mother/eat/clear_storage
tag @e[type=minecraft:marker,tag=marker.heli_pad] remove heli.selected_pad
kill @e[type=minecraft:interaction,tag=entity.generator_interaction]
kill @e[type=minecraft:interaction,tag=entity.ship_door]
kill @e[tag=entity.ship_door_hint]
kill @e[type=minecraft:interaction,tag=entity.helicopter_boarding]
kill @e[tag=entity.helicopter_boarding_hint]
kill @e[type=minecraft:interaction,tag=entity.sub_door]
kill @e[tag=entity.sub_door_hint]
kill @e[tag=test.dummy]
kill @e[tag=dev.mother_sim]
kill @e[tag=entity.researcher]
kill @e[tag=entity.chef_stew_pot]
kill @e[tag=entity.engineer_battery]
kill @e[tag=entity.mechanic_trap]
kill @e[tag=entity.downed_anchor]
kill @e[tag=entity.dead_anchor]
kill @e[tag=display.infection_vignette]
kill @e[type=minecraft:silverfish,tag=skill.slide.vehicle]

weather clear 600
title @a title {"text":"测试状态已清空","color":"gold"}
title @a subtitle {"text":"地图 marker 已保留，可直接重新开局或继续自测","color":"gray"}
tellraw @a [{"text":"[自测] 一键结束游戏完成：玩家状态、背包、技能冷却、队伍、bossbar、倒计时和临时实体已清空。","color":"gold"},{"text":" 地图 marker 未删除；需要删除临时 marker 请点 [清理开发沙盒]。","color":"gray"}]
