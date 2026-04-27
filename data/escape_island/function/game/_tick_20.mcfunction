# escape_island:game/_tick_20  —  systems that run every 20 ticks (1 second)

# Cooldown ticks
function escape_island:skill/cooldown_tick
execute if entity @e[tag=entity.engineer_battery,limit=1] run function escape_island:skill/engineer_battery_tick
execute if entity @e[tag=entity.mechanic_trap,limit=1] run function escape_island:skill/mechanic_trap_tick
execute if entity @e[tag=entity.chef_stew_pot,limit=1] run function escape_island:skill/chef_stew_tick

# Infection state
function escape_island:infection/tick_infected_state
function escape_island:infection/spore_load_decay

# Spore load warning (≥50, only visible to that player)
execute as @a[tag=role.survivor,tag=!state.infected_period,scores={spore_load=50..}] at @s run function escape_island:infection/spore_load_warn

# Respawn checks
execute as @a[tag=state.sporifying] at @s run function escape_island:infection/sporify_tick
function escape_island:infection/respawn_tick

# Mother lunge: scoreboard fallback trigger (firework rocket used, catches cases where using_item advancement misses)
execute as @a[tag=role.mother,tag=!state.dead,scores={cd_mother_lunge=..0}] if score @s used_firework > @s used_firework_last run function escape_island:skill/mother_lunge
execute as @a[tag=role.mother] run scoreboard players operation @s used_firework_last = @s used_firework

# Role passives
execute as @a[tag=role.mother] at @s run function escape_island:role/tick_mother
execute as @a[tag=role.doctor] at @s run function escape_island:role/tick_doctor
execute as @a[tag=role.captain] at @s run function escape_island:role/tick_captain
execute as @a[tag=role.engineer] at @s run function escape_island:role/tick_engineer
execute as @a[tag=role.marine] at @s run function escape_island:role/tick_marine
execute as @a[tag=role.chef] at @s run function escape_island:role/tick_chef
execute as @a[tag=role.radio] at @s run function escape_island:role/tick_radio
execute as @a[tag=role.virologist] at @s run function escape_island:role/tick_virologist
execute as @a[tag=role.mechanic] at @s run function escape_island:role/tick_mechanic
execute as @a[tag=role.sailor] at @s run function escape_island:role/tick_sailor
execute as @a[tag=role.priest] at @s run function escape_island:role/tick_priest

# Task ticks
function escape_island:task/signal_tower_tick
function escape_island:task/generator_tick
function escape_island:task/ship_dock_tick
execute if score $game bomb_armed matches 1 run function escape_island:task/bomb_tick

# Escape ticks
execute if score $game cur_phase matches 4 run function escape_island:escape/helicopter_tick

# Environment events (every 2 min = 2400 ticks, checked each second)
execute if score $game phase_timer matches 1.. run function escape_island:event/pick_event
