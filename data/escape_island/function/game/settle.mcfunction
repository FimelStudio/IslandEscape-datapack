function escape_island:ui/show_v01_result
scoreboard players set $game final_pressure 0

gamemode spectator @a[tag=state.escaped]
gamemode adventure @a[tag=!state.escaped]
effect clear @a
execute as @a run attribute @s minecraft:movement_speed base set 0.1
execute as @a run attribute @s minecraft:max_health base set 20
execute as @a run attribute @s minecraft:attack_damage base set 1
execute as @a run attribute @s minecraft:attack_speed base set 4
execute as @a run function escape_island:visual/clear_head
execute as @a run function escape_island:ui/spore_bar/clear

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

function escape_island:escape/helicopter_cleanup
kill @e[tag=entity.engineer_battery]
kill @e[tag=entity.mechanic_trap]
kill @e[tag=entity.chef_stew_pot]
kill @e[tag=dev.marker_vis]
kill @e[tag=entity.downed_anchor]
kill @e[tag=entity.dead_anchor]
kill @e[type=minecraft:marker,tag=entity.clicker_spore]
kill @e[type=minecraft:marker,tag=entity.clicker_spore_pending]

tag @a remove team.human
tag @a remove team.infected
tag @a remove team.human
tag @a remove team.infected
tag @a remove infected.mother
tag @a remove infected.common
tag @a remove infected.secondary_mother
tag @a remove infected.special
tag @a remove infected.licker
tag @a remove mother.passive.target
tag @a remove infected.clicker
tag @a remove infected.runner
tag @a remove infected.tank
tag @a remove infected.spitter
tag @a remove role.doctor
tag @a remove role.captain
tag @a remove role.engineer
tag @a remove role.marine
tag @a remove role.chef
tag @a remove role.radio
tag @a remove role.virologist
tag @a remove role.mechanic
tag @a remove role.priest
tag @a remove role.athlete
tag @a remove state.latent_host
tag @a remove skill.mother.eating
tag @a remove skill.mother.eat.fired
tag @a remove skill.mother.eat.absorbing
tag @a remove skill.mother.eat.target
tag @a remove skill.clicker_spore.detected
tag @a remove skill.clicker_spore.caster
tag @a remove skill.clicker_spore.dead
tag @a remove skill.clicker_spore.active
tag @a remove skill.clicker_spore.target
tag @a remove skill.adrenaline.active
tag @a remove skill.slide.active
tag @a remove skill.slide.locked
tag @a remove state.infected_period
tag @a remove state.sporifying
tag @a remove state.dead
tag @a remove state.boarding
tag @a remove state.boarding.heli
tag @a remove state.boarding.ship
tag @a remove state.boarding.sub
tag @a remove state.escaped
tag @a remove state.spectator
tag @a remove state.disguised
tag @a remove state.disguise_scanning
tag @a remove state.infection_resist
tag @a remove state.berserk
tag @a remove state.infect_immune
tag @a remove state.attack_slowed
tag @a remove state.mutated
tag @a remove mother.passive.fire
tag @a remove flag.first_attack
tag @a remove flag.has_inject
tag @a remove flag.has_keynote
tag @a remove flag.has_promfile
tag @a remove flag.has_disguise
tag @a remove flag.tutorial_seen
tag @a remove retained.doctor
tag @a remove retained.captain
tag @a remove retained.engineer
tag @a remove retained.marine
tag @a remove retained.chef
tag @a remove retained.radio
tag @a remove retained.virologist
tag @a remove retained.mechanic
tag @a remove retained.athlete
tag @a remove retained.priest
tag @a remove skill.antidote.user
tag @a remove skill.antidote.target
tag @a remove skill.battery.recalled
tag @a remove skill.gun_mastery.hit

scoreboard players reset @a spore_load
scoreboard players reset @a spore_decay_cd
scoreboard players reset @a infect_time
scoreboard players reset @a sporify_timer
scoreboard players reset @a mother_respawn
scoreboard players reset @a is_mother
scoreboard players reset @a mother_hp
scoreboard players reset @a mother_last_hp
scoreboard players reset @a mother_regen_cd
scoreboard players reset @a mother_hit_cd
scoreboard players reset @a mother_phase
scoreboard players reset @a mother_phase_timer
scoreboard players reset @a mother_passive_stick
scoreboard players reset @a cd_mother_rotsense
scoreboard players reset @a cd_mother_howl
scoreboard players reset @a cd_mother_lunge
scoreboard players reset @a cd_mother_hunt
scoreboard players reset @a cd_mother_mutate
scoreboard players reset @a cd_mother_passive_spore
scoreboard players reset @a cd_aura_heartbeat
scoreboard players reset @a skill.mutate_sec
scoreboard players reset @a skill.mutate_last
scoreboard players reset @a skill.clicker_cd
scoreboard players reset @a skill.clicker_sec
scoreboard players reset @a skill.clicker_last_sec
scoreboard players reset @a skill.clicker_state
scoreboard players reset @a skill.clicker_id
scoreboard players reset @a skill.clicker_target_id
scoreboard players reset @a skill.clicker_spore_delay
scoreboard players set #next_target skill.clicker_cfg 0
scoreboard players reset @a death_count
scoreboard players reset @a hb_phase
scoreboard players reset @a gen_interact_cd
scoreboard players operation @a used_firework_last = @a used_firework
execute as @a run function skill:radio/cleanup_non_radio
execute as @a run function skill:virologist/cleanup_non_virologist
execute as @a run function skill:priest/cleanup_non_priest
function skill:mother/eat/clear_storage

clear @a
team leave @a
team modify survivors friendlyFire false
team modify mother_hidden friendlyFire false
team modify mother friendlyFire false
team modify infected_period friendlyFire false
team modify infected friendlyFire false
team modify spectator friendlyFire false

scoreboard players set $game in_game 0
gamerule natural_health_regeneration true

tellraw @a {"text":"─────────────────────────────","color":"gray"}
function escape_island:career/settle
tellraw @a {"text":"状态已清除。输入 /function escape_island:game/start 再来一局。","color":"gold"}
