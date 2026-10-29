# 自动生成：tools/state_contract.json；请通过 python tools/generate_state.py 更新。
# 执行者 @s 是待重置玩家；只清理本模块拥有的临时状态。
tag @s remove mother.passive.fire
tag @s remove mother.passive.target
tag @s remove state.attack_slowed
tag @s remove state.berserk
tag @s remove state.boarding
tag @s remove state.boarding.heli
tag @s remove state.boarding.ship
tag @s remove state.boarding.sub
tag @s remove state.dead
tag @s remove state.disguise_scanning
tag @s remove state.disguised
tag @s remove state.escaped
tag @s remove state.hunting
tag @s remove state.infect_immune
tag @s remove state.infected_period
tag @s remove state.infection_resist
tag @s remove state.latent_host
tag @s remove state.mutated
tag @s remove state.spectator
tag @s remove state.sporifying
scoreboard players set @s death_count 0
scoreboard players set @s hb_phase 0
scoreboard players set @s ie.disguise_left 0
scoreboard players set @s ie.resist_left 0
scoreboard players set @s ie.scan_left 0
scoreboard players set @s infect_time 0
scoreboard players set @s mother_hit_cd 0
scoreboard players set @s mother_hp 0
scoreboard players set @s mother_last_hp 0
scoreboard players set @s mother_passive_stick 0
scoreboard players set @s mother_phase 0
scoreboard players set @s mother_phase_timer 0
scoreboard players set @s mother_regen_cd 0
scoreboard players set @s mother_respawn 0
scoreboard players set @s spore_decay_cd 0
scoreboard players set @s spore_load 0
scoreboard players set @s sporify_timer 0
