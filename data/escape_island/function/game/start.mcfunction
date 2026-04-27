
function escape_island:util/recount_players
execute if score $game player_count matches ..3 run tellraw @a {"text":"[孤岛逃生] 至少需要 4 名玩家才能开始。","color":"red"}
execute if score $game player_count matches ..3 run return 0

gamerule immediate_respawn true
kill @e[tag=entity.downed_anchor]
kill @e[tag=entity.dead_anchor]
scoreboard players set $game in_game 1
scoreboard players set $game cur_phase 1
scoreboard players set $game phase_timer 0
scoreboard players set $game escaped_count 0
scoreboard players set $game infected_dead 0
scoreboard players set $game bomb_armed 0
scoreboard players set $game dawn_active 0
scoreboard players set $game signal_progress 0
scoreboard players set $game ship_progress 0
scoreboard players set $game ship_parts 0
scoreboard players set $game lab_cards 0

tag @a remove role.survivor
tag @a remove role.mother
tag @a remove role.infected
tag @a remove doctor
tag @a remove role.latent_host
tag @a remove role.secondary_mother
tag @a remove role.athlete
tag @a remove athlete
tag @a remove adren_active
tag @a remove sliding
tag @a remove slide_locked
tag @a remove state.infected_period
tag @a remove state.boarding
tag @a remove state.escaped
tag @a remove state.sporifying
tag @a remove state.dead
tag @a remove state.spectator
tag @a remove state.disguised
tag @a remove state.disguise_scanning
tag @a remove state.infection_resist
tag @a remove state.berserk
tag @a remove state.infect_immune
tag @a remove retained.doctor
tag @a remove retained.captain
tag @a remove retained.engineer
tag @a remove retained.marine
tag @a remove retained.chef
tag @a remove retained.radio
tag @a remove retained.virologist
tag @a remove retained.mechanic
tag @a remove retained.sailor
tag @a remove retained.athlete
tag @a remove retained.priest
tag @a remove flag.has_inject
tag @a remove flag.has_keynote
tag @a remove flag.has_promfile
tag @a remove flag.has_disguise
tag @a remove flag.tutorial_seen
tag @a remove flag.first_attack
tag @a remove skill.antidote_user
tag @a remove skill.antidote_target

scoreboard players reset @a spore_load
scoreboard players reset @a spore_decay_cd
scoreboard players reset @a infect_time
scoreboard players reset @a sporify_timer
scoreboard players reset @a is_mother
scoreboard players reset @a mother_hp
scoreboard players reset @a mother_respawn
scoreboard players reset @a cd_doctor
scoreboard players reset @a skill.antidote_charges
scoreboard players reset @a skill.antidote_cd
scoreboard players reset @a skill.antidote_regen_cd
scoreboard players reset @a skill.antidote_item
scoreboard players reset @a skill.antidote_state
scoreboard players reset @a skill.antidote_sec
scoreboard players reset @a skill.antidote_last_sec
scoreboard players reset @a cd_captain
scoreboard players reset @a cd_engineer
scoreboard players reset @a cd_marine
scoreboard players reset @a cd_chef
scoreboard players reset @a cd_radio
scoreboard players reset @a cd_virologist
scoreboard players reset @a cd_mechanic
scoreboard players reset @a cd_priest
scoreboard players reset @a skill.adren_time
scoreboard players reset @a skill.adren_cd
scoreboard players reset @a skill.slide_time
scoreboard players reset @a skill.slide_cd
scoreboard players reset @a skill.stamina_warn
scoreboard players reset @a cd_mother_lunge
scoreboard players reset @a cd_mother_rotsense
scoreboard players reset @a cd_mother_howl
scoreboard players reset @a death_count
scoreboard players reset @a hb_phase
scoreboard players reset @a mother_last_hp
scoreboard players reset @a mother_regen_cd
scoreboard players operation @a used_firework_last = @a used_firework

team join survivors @a
clear @a
gamemode survival @a
effect clear @a
execute as @a run attribute @s minecraft:movement_speed base set 0.1
effect give @a minecraft:saturation 1 20 true

function escape_island:game/phase_1_load
