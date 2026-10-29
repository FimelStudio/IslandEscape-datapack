# 自动生成：tools/state_contract.json；请通过 python tools/generate_state.py 更新。
# 执行者 @s 是待重置玩家；只清理本模块拥有的临时状态。
tag @s remove flag.cross_intact
tag @s remove flag.cross_intercepted
tag @s remove flag.first_attack
tag @s remove flag.has_disguise
tag @s remove flag.has_inject
tag @s remove flag.has_keynote
tag @s remove flag.has_promfile
tag @s remove flag.self_injected_this_period
tag @s remove flag.tutorial_seen
tag @s remove skill.adrenaline.active
tag @s remove skill.ak47.holding
tag @s remove skill.ak47.reloading
tag @s remove skill.ak47.shooter
tag @s remove skill.ak47.xp
tag @s remove skill.antidote.target
tag @s remove skill.antidote.user
tag @s remove skill.battery.recalled
tag @s remove skill.clicker_spore.active
tag @s remove skill.clicker_spore.caster
tag @s remove skill.clicker_spore.dead
tag @s remove skill.clicker_spore.detected
tag @s remove skill.clicker_spore.new
tag @s remove skill.clicker_spore.target
tag @s remove skill.gun_mastery.hit
tag @s remove skill.mother.eat.absorbing
tag @s remove skill.mother.eat.fired
tag @s remove skill.mother.eat.target
tag @s remove skill.mother.eating
tag @s remove skill.pistol.holding
tag @s remove skill.pistol.reloading
tag @s remove skill.pistol.shooter
tag @s remove skill.pistol.xp
tag @s remove skill.priest.cross.active
tag @s remove skill.radio.inspect.target
tag @s remove skill.radio.inspecting
tag @s remove skill.radio.inspector
tag @s remove skill.radio.reported
tag @s remove skill.radio.role.found
tag @s remove skill.radio.viewer
tag @s remove skill.shotgun.reloading
tag @s remove skill.slide.active
tag @s remove skill.slide.blocked
tag @s remove skill.slide.cleanup
tag @s remove skill.slide.drop_008
tag @s remove skill.slide.drop_015
tag @s remove skill.slide.drop_030
tag @s remove skill.slide.drop_044
tag @s remove skill.slide.drop_064
tag @s remove skill.slide.drop_083
tag @s remove skill.slide.drop_100
tag @s remove skill.slide.drop_113
tag @s remove skill.slide.falling
tag @s remove skill.slide.falling_small
tag @s remove skill.slide.locked
tag @s remove skill.slide.moved
tag @s remove skill.slide.stamina.init
tag @s remove skill.slide.stamina.showing
tag @s remove skill.sniper.reloading
tag @s remove skill.soup.target
tag @s remove skill.soup.user
tag @s remove skill.trap.recalled
tag @s remove skill.virologist.hit
tag @s remove skill.virologist.viewer
tag @s remove sniper.bolting
tag @s remove sniper.zooming
tag @s remove state.scatter.target
scoreboard players set @s cd_aura_heartbeat 0
scoreboard players set @s cd_aura_notice 0
scoreboard players set @s cd_chef 0
scoreboard players set @s cd_doctor 0
scoreboard players set @s cd_marine 0
scoreboard players set @s cd_mechanic 0
scoreboard players set @s cd_mother_howl 0
scoreboard players set @s cd_mother_hunt 0
scoreboard players set @s cd_mother_lunge 0
scoreboard players set @s cd_mother_mutate 0
scoreboard players set @s cd_mother_passive_spore 0
scoreboard players set @s cd_mother_rotsense 0
scoreboard players set @s cd_priest 0
scoreboard players set @s cd_radio 0
scoreboard players set @s cd_virologist 0
scoreboard players set @s skill.adren_cd 0
scoreboard players set @s skill.adren_item 0
scoreboard players set @s skill.adren_last_sec 0
scoreboard players set @s skill.adren_sec 0
scoreboard players set @s skill.adren_time 0
scoreboard players set @s skill.ak47_fire_cd 0
scoreboard players set @s skill.ak47_mag 0
scoreboard players set @s skill.ak47_reload 0
scoreboard players set @s skill.ak47_reload_cs 0
scoreboard players set @s skill.ak47_reload_frac 0
scoreboard players set @s skill.ak47_reload_sec 0
scoreboard players set @s skill.ak47_swap 0
scoreboard players set @s skill.ak47_tmp 0
scoreboard players set @s skill.antidote_cd 0
scoreboard players set @s skill.antidote_charges 0
scoreboard players set @s skill.antidote_item 0
scoreboard players set @s skill.antidote_last_sec 0
scoreboard players set @s skill.antidote_regen_cd 0
scoreboard players set @s skill.antidote_sec 0
scoreboard players set @s skill.antidote_state 0
scoreboard players set @s skill.battery_cd 0
scoreboard players set @s skill.battery_item 0
scoreboard players set @s skill.battery_last_sec 0
scoreboard players set @s skill.battery_sec 0
scoreboard players set @s skill.battery_state 0
scoreboard players set @s skill.battery_timer 0
scoreboard players set @s skill.clicker_cd 0
scoreboard players set @s skill.clicker_id 0
scoreboard players set @s skill.clicker_last_sec 0
scoreboard players set @s skill.clicker_sec 0
scoreboard players set @s skill.clicker_spore_delay 0
scoreboard players set @s skill.clicker_spore_hp 0
scoreboard players set @s skill.clicker_spore_life 0
scoreboard players set @s skill.clicker_state 0
scoreboard players set @s skill.clicker_target_id 0
scoreboard players set @s skill.detector_cd 0
scoreboard players set @s skill.detector_item 0
scoreboard players set @s skill.detector_last_sec 0
scoreboard players set @s skill.detector_sec 0
scoreboard players set @s skill.detector_state 0
scoreboard players set @s skill.forger_passive_cd 0
scoreboard players set @s skill.forger_uses 0
scoreboard players set @s skill.gm_burst 0
scoreboard players set @s skill.gm_delay 0
scoreboard players set @s skill.gm_input_cd 0
scoreboard players set @s skill.gm_runtime 0
scoreboard players set @s skill.howl_last 0
scoreboard players set @s skill.howl_sec 0
scoreboard players set @s skill.mother_eat_anim 0
scoreboard players set @s skill.mutate_last 0
scoreboard players set @s skill.mutate_sec 0
scoreboard players set @s skill.pistol_fire_cd 0
scoreboard players set @s skill.pistol_mag 0
scoreboard players set @s skill.pistol_reload 0
scoreboard players set @s skill.pistol_reload_cs 0
scoreboard players set @s skill.pistol_reload_frac 0
scoreboard players set @s skill.pistol_reload_sec 0
scoreboard players set @s skill.pistol_swap 0
scoreboard players set @s skill.pistol_tmp 0
scoreboard players set @s skill.radio_jam_cd 0
scoreboard players set @s skill.radio_jam_sec 0
scoreboard players set @s skill.radio_jam_state 0
scoreboard players set @s skill.rotsense_last 0
scoreboard players set @s skill.rotsense_sec 0
scoreboard players set @s skill.shotgun_cd 0
scoreboard players set @s skill.shotgun_mag 0
scoreboard players set @s skill.shotgun_reload 0
scoreboard players set @s skill.signal_scan_cd 0
scoreboard players set @s skill.signal_scan_item 0
scoreboard players set @s skill.signal_scan_last_sec 0
scoreboard players set @s skill.signal_scan_sec 0
scoreboard players set @s skill.signal_scan_state 0
scoreboard players set @s skill.signal_scan_time 0
scoreboard players set @s skill.slide_cd 0
scoreboard players set @s skill.slide_cost 0
scoreboard players set @s skill.slide_fall 0
scoreboard players set @s skill.slide_ok 0
scoreboard players set @s skill.slide_sprint 0
scoreboard players set @s skill.slide_time 0
scoreboard players set @s skill.sniper_bolt 0
scoreboard players set @s skill.sniper_cd 0
scoreboard players set @s skill.sniper_mag 0
scoreboard players set @s skill.sniper_reload 0
scoreboard players set @s skill.sniper_zoom_flag 0
scoreboard players set @s skill.soup_cd 0
scoreboard players set @s skill.soup_item 0
scoreboard players set @s skill.soup_last_sec 0
scoreboard players set @s skill.soup_sec 0
scoreboard players set @s skill.soup_state 0
scoreboard players set @s skill.stamina 0
scoreboard players set @s skill.stamina_bar 0
scoreboard players set @s skill.stamina_color 0
scoreboard players set @s skill.stamina_warn 0
scoreboard players set @s skill.suppress_cd 0
scoreboard players set @s skill.suppress_item 0
scoreboard players set @s skill.suppress_last_sec 0
scoreboard players set @s skill.suppress_sec 0
scoreboard players set @s skill.suppress_state 0
scoreboard players set @s skill.trap_cd 0
scoreboard players set @s skill.trap_charges 0
scoreboard players set @s skill.trap_item 0
scoreboard players set @s skill.trap_place_cd 0
scoreboard players set @s skill.trap_sec 0
scoreboard players set @s skill.trap_state 0
scoreboard players set @s skill.viro_passive_cd 0
scoreboard players set @s skill.whistle_cd 0
scoreboard players set @s skill.whistle_item 0
scoreboard players set @s skill.whistle_last_sec 0
scoreboard players set @s skill.whistle_sec 0
scoreboard players set @s skill.whistle_state 0
scoreboard players set @s talent_exhaustion 0
scoreboard players set @s talent_focus_time 0
scoreboard players set @s talent_info_cd 0
scoreboard players set @s talent_rescue_cd 0
execute unless score @s used_firework matches 0.. run scoreboard players set @s used_firework 0
scoreboard players operation @s used_firework_last = @s used_firework
