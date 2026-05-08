
function skill:common/cooldown_tick
execute if entity @e[tag=entity.mechanic_trap,limit=1] run function skill:mechanic/trap_tick
execute if entity @e[tag=entity.chef_stew_pot,limit=1] run function skill:chef/stew_tick

effect give @a[tag=!state.dead,tag=!state.spectator] minecraft:regeneration 3 0 true
effect give @a[tag=!state.dead,tag=!state.spectator,tag=!state.escaped] minecraft:saturation 3 0 true

function escape_island:infection/tick_infected_state
function escape_island:infection/spore_load_decay
function escape_island:talent/tick
execute as @a[scores={cd_aura_heartbeat=1..}] run scoreboard players remove @s cd_aura_heartbeat 1
execute as @a[scores={cd_aura_notice=1..}] run scoreboard players remove @s cd_aura_notice 1

execute if entity @a[tag=event.blackout,limit=1] as @a[tag=!state.dead] at @s if items entity @s weapon.mainhand minecraft:lantern[minecraft:custom_data~{item:"flashlight"}] run effect give @a[distance=..3] minecraft:night_vision 3 0 true
execute if entity @a[tag=event.blackout,limit=1] as @a[tag=!state.dead] at @s if items entity @s weapon.offhand minecraft:lantern[minecraft:custom_data~{item:"flashlight"}] run effect give @a[distance=..3] minecraft:night_vision 3 0 true

# 防毒面具可戴在头上，也可放在背包；兼容早期皮革头盔和当前锁链头盔两种载体。
tag @a remove has_gas_mask
execute as @a[tag=!state.dead] if items entity @s armor.head minecraft:chainmail_helmet[minecraft:custom_data~{item:"gas_mask"}] run tag @s add has_gas_mask
execute as @a[tag=!state.dead] if items entity @s armor.head minecraft:leather_helmet[minecraft:custom_data~{item:"gas_mask"}] run tag @s add has_gas_mask
execute as @a[tag=!state.dead] if items entity @s container.* minecraft:chainmail_helmet[minecraft:custom_data~{item:"gas_mask"}] run tag @s add has_gas_mask
execute as @a[tag=!state.dead] if items entity @s container.* minecraft:leather_helmet[minecraft:custom_data~{item:"gas_mask"}] run tag @s add has_gas_mask

execute as @a[tag=team.human,tag=!state.infected_period,scores={spore_load=50..}] at @s run function escape_island:infection/spore_load_warn

execute as @a[tag=state.sporifying] at @s run function escape_island:infection/sporify_tick
function escape_island:infection/respawn_tick

execute as @a[tag=infected.mother,tag=!state.dead,scores={cd_mother_lunge=..0}] if score @s used_firework > @s used_firework_last run function skill:mother/lunge
execute as @a[tag=infected.mother] run scoreboard players operation @s used_firework_last = @s used_firework

execute as @a[tag=infected.mother] at @s run function escape_island:role/tick_mother
execute as @a[tag=role.doctor] at @s run function escape_island:role/tick_doctor
execute as @a[tag=role.captain] at @s run function escape_island:role/tick_captain
execute as @a[tag=role.engineer] at @s run function escape_island:role/tick_engineer
execute as @a[tag=role.marine] at @s run function escape_island:role/tick_marine
execute as @a[tag=role.chef] at @s run function escape_island:role/tick_chef
execute as @a[tag=role.radio] at @s run function escape_island:role/tick_radio
execute as @a[tag=role.virologist] at @s run function escape_island:role/tick_virologist
execute as @a[tag=role.mechanic] at @s run function escape_island:role/tick_mechanic
execute as @a[tag=role.athlete] at @s run function escape_island:role/tick_athlete
execute as @a[tag=role.priest] at @s run function escape_island:role/tick_priest

function escape_island:task/signal_tower_tick
function escape_island:task/generator_tick
function escape_island:task/scan_station_tick
function escape_island:task/ship_dock_tick
execute if score $game bomb_armed matches 1 run function escape_island:task/bomb_tick
execute if score $game sub_countdown matches 1.. run function escape_island:escape/sub_tick

execute if score $game mother_dead matches 1 if score $game in_game matches 1 unless entity @a[tag=infected.common,tag=!state.dead] run function escape_island:game/end_purge
execute if score $game in_game matches 1 unless entity @a[tag=team.human] run function escape_island:game/end_all_infected

execute if score $game cur_phase matches 4 run function escape_island:escape/helicopter_tick
execute if score $game cur_phase matches 4 if score $game ship_countdown matches 1.. run function escape_island:escape/ship_boarding_tick
execute if score $game gs_active matches 1 run function escape_island:gunfight/combat_tick
execute if score $game gs_active matches 1 run function escape_island:gunfight/supply_tick

execute if score $game p2_ambient_cd matches 1 run function escape_island:game/p2_ambient_event
execute if score $game p2_ambient_cd matches 1.. run scoreboard players remove $game p2_ambient_cd 1

execute if score $game phase_timer matches 1.. run function escape_island:event/pick_event
execute as @a[tag=event.storm] at @s run function escape_island:event/storm_tick
