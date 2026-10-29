# 正式/测试局共享初始化；调用前已通过人数检查。
function escape_island:game/cleanup
execute as @a at @s run function escape_island:player/reset
scoreboard players set $game in_game 1
scoreboard players set $game ie.mode 1
scoreboard players set $game ie.ruleset 1
scoreboard players set $game ending_triggered 0
scoreboard players set $game cur_phase 1
scoreboard players set $game phase_timer 0
scoreboard players set $game escaped_count 0
scoreboard players set $game infected_dead 0
scoreboard players set $game mother_dead 0
scoreboard players set $game escape_route 0
scoreboard players set $game escape_result 0
scoreboard players set $game signal_progress 0
scoreboard players set $game signal_done 0
scoreboard players set $game ship_progress 0
scoreboard players set $game ship_bonus_tick 0
scoreboard players set $game lab_cards 0
scoreboard players set $game gen_state 0
scoreboard players set $game gen_countdown 0
scoreboard players set $game gen_overload 0
scoreboard players set $game gen_done 0
scoreboard players set $game power_buff 0
scoreboard players set $game power_buff_acc 0
scoreboard players set $game ship_aura_acc 0
execute store result score $game ie.prev_regen run gamerule natural_health_regeneration
execute store result score $game ie.prev_respawn run gamerule immediate_respawn
scoreboard players set $game ie.rules_saved 1
gamerule immediate_respawn true
gamerule natural_health_regeneration false
function escape_island:util/apply_scaling
scoreboard players set Tunable tunable.ship_parts_required 5
execute if score $game player_count matches 4 run scoreboard players set Tunable tunable.ship_parts_required 3
execute if score $game player_count matches 5..7 run scoreboard players set Tunable tunable.ship_parts_required 4
scoreboard players set @a match_repair 0
scoreboard players set @a match_rescue 0
scoreboard players set @a match_kite 0
scoreboard players set @a match_info 0
scoreboard players set @a match_infect 0
scoreboard players set @a match_escape 0
scoreboard players set @a match_objective 0
scoreboard players set @a mvp_score 0
tag @a add ie.participant
tag @a add ie.active
scoreboard players set $game ie.humans 0
execute as @a[tag=ie.participant] run scoreboard players add $game ie.humans 1
scoreboard players operation $game ie.players = $game ie.humans
scoreboard players operation @a ie.session = $game ie.match_id
scoreboard players set @e[type=minecraft:marker,tag=marker.signal_tower] signal_core_acc 0
function escape_island:task/generator_attach_interactions
function escape_island:game/randomize_match
function escape_island:task/place_loot_chests
function escape_island:task/ship_part_scatter
effect give @a minecraft:saturation 1 20 true
function escape_island:game/phase_1_load
