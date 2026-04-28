
scoreboard objectives add in_game dummy
scoreboard objectives add play_sound dummy
scoreboard objectives add phase_timer dummy
scoreboard objectives add cur_phase dummy
scoreboard objectives add dawn_timer dummy
scoreboard objectives add dawn_active dummy
scoreboard objectives add role dummy
scoreboard objectives add infect_time dummy
scoreboard objectives add spore_load dummy
scoreboard objectives add spore_decay_cd dummy
scoreboard objectives add is_mother dummy
scoreboard objectives add mother_hp dummy
scoreboard objectives add mother_respawn dummy
scoreboard objectives add cd_doctor dummy
scoreboard objectives add cd_marine dummy
scoreboard objectives add cd_chef dummy
scoreboard objectives add cd_radio dummy
scoreboard objectives add cd_virologist dummy
scoreboard objectives add cd_mechanic dummy
scoreboard objectives add cd_priest dummy
scoreboard objectives add cd_mother_lunge dummy
scoreboard objectives add cd_mother_rotsense dummy
scoreboard objectives add cd_mother_howl dummy
scoreboard objectives add kit_remaining dummy
scoreboard objectives add signal_progress dummy
scoreboard objectives add gen_progress dummy
scoreboard objectives add ship_progress dummy
scoreboard objectives add ship_parts dummy
scoreboard objectives add lab_cards dummy
scoreboard objectives add bomb_armed dummy
scoreboard objectives add bomb_countdown dummy
scoreboard objectives add heli_countdown dummy
scoreboard objectives add ship_countdown dummy
scoreboard objectives add sub_countdown dummy
scoreboard objectives add escaped_count dummy
scoreboard objectives add infected_dead dummy
scoreboard objectives add sporify_timer dummy
scoreboard objectives add player_count dummy
scoreboard objectives add infected_count dummy
scoreboard objectives add death_count deathCount
scoreboard objectives add cycle20 dummy
scoreboard objectives add cycle5 dummy
scoreboard objectives add decay_cycle dummy
scoreboard objectives add event_timer dummy
scoreboard objectives add event_threshold dummy
scoreboard objectives add event_roll dummy
scoreboard objectives add dev_mode dummy
scoreboard objectives add dev_count dummy
scoreboard objectives add tunable.mother_hp dummy
scoreboard objectives add tunable.infection_seconds dummy
scoreboard objectives add tunable.spore_threshold dummy
scoreboard objectives add tunable.doctor_spore_threshold dummy
scoreboard objectives add tunable.mother_spore_hit dummy
scoreboard objectives add tunable.infected_spore_hit dummy
scoreboard objectives add tunable.signal_stages dummy
scoreboard objectives add tunable.helicopter_countdown dummy
scoreboard objectives add tunable.dawn_transition_seconds dummy
scoreboard objectives add tunable.death_sporify_seconds dummy
scoreboard objectives add tunable.spore_respawn_seconds dummy
scoreboard objectives add tunable.mother_respawn_seconds dummy
scoreboard objectives add tunable.basic_loot_density dummy
scoreboard objectives add tunable.rare_loot_density dummy
scoreboard objectives add tunable.environment_event_minutes dummy
scoreboard objectives add tunable.debug dummy
scoreboard objectives add hb_phase dummy
scoreboard objectives add mother_last_hp dummy
scoreboard objectives add mother_regen_cd dummy
scoreboard objectives add used_firework minecraft.used:minecraft.firework_rocket
scoreboard objectives add used_firework_last dummy
scoreboard objectives add test_count dummy
scoreboard objectives add skill.mother_eat dummy
scoreboard objectives add skill.mother_eat_anim dummy
scoreboard objectives add ie.dialog trigger
scoreboard objectives add ie.eat_health trigger
scoreboard players enable @a ie.dialog
scoreboard players enable @a ie.eat_health

function escape_island:tunable

team add survivors {"text":"幸存者","color":"green"}
team modify survivors friendlyFire false
team modify survivors seeFriendlyInvisibles true
team add mother_hidden {"text":"母体（隐藏）","color":"green"}
team modify mother_hidden friendlyFire false
team add mother {"text":"母体","color":"dark_red"}
team modify mother friendlyFire false
team add infected_period {"text":"感染期","color":"gold"}
team modify infected_period friendlyFire false
team add infected {"text":"感染者","color":"red"}
team modify infected friendlyFire false
team add spectator {"text":"旁观者","color":"gray"}
team modify spectator friendlyFire false
team modify spectator nametagVisibility never

bossbar add escape_island:phase {"text":"阶段进度","color":"yellow"}
bossbar set escape_island:phase visible false
bossbar add escape_island:signal {"text":"信号塔修复进度","color":"green"}
bossbar set escape_island:signal visible false
bossbar add escape_island:gen {"text":"发电机维持时间","color":"green"}
bossbar set escape_island:gen visible false
bossbar add escape_island:heli {"text":"直升机倒计时","color":"gold"}
bossbar set escape_island:heli visible false
bossbar add escape_island:ship {"text":"轮船倒计时","color":"aqua"}
bossbar set escape_island:ship visible false
bossbar add escape_island:sub {"text":"潜艇倒计时","color":"aqua"}
bossbar set escape_island:sub visible false
bossbar add escape_island:bomb {"text":"自爆倒计时","color":"red"}
bossbar set escape_island:bomb visible false
bossbar add escape_island:infection {"text":"感染期","color":"red"}
bossbar set escape_island:infection visible false
bossbar add escape_island:disguise {"text":"伪装倒计时","color":"dark_purple"}
bossbar set escape_island:disguise visible false
bossbar add escape_island:mother_respawn {"text":"母体复活","color":"dark_red"}
bossbar set escape_island:mother_respawn visible false

scoreboard players set $game in_game 0
scoreboard players set $game dev_mode 0
scoreboard players set $tick cycle20 0
scoreboard players set $tick cycle5 0
scoreboard players set $tick decay_cycle 0
scoreboard players set $const_60 event_threshold 60
scoreboard players set $const_2 spore_load 2
scoreboard players set $const_4 infect_time 4

tellraw @a [{"text":"[孤岛逃生：黎明前夕] 数据包已加载。 ","color":"gold"},{"text":"[打开自测菜单]","color":"aqua","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/menu"}},{"text":" ","color":"white"},{"text":"[开始游戏]","color":"green","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:game/start"}}]
