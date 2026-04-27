# escape_island:event/pick_event  —  check if an environment event should trigger
# Fires roughly every 2 minutes (tunable.environment_event_minutes)
# Use a timer: increment every second, trigger at threshold

scoreboard players add $event event_timer 1

# Convert tunable minutes to seconds
execute store result score $event event_threshold run scoreboard players get Tunable tunable.environment_event_minutes
scoreboard players operation $event event_threshold *= $const_60 event_threshold

execute unless score $event event_timer >= $event event_threshold run return 0
scoreboard players set $event event_timer 0

# Only trigger in phase 3+
execute if score $game cur_phase matches ..2 run return 0

# Random event selection (rough: use phase_timer mod 4)
execute store result score $event event_roll run random value 0..3
execute if score $event event_roll matches 0 run function escape_island:event/blackout
execute if score $event event_roll matches 1 run function escape_island:event/radio_static
execute if score $event event_roll matches 2 run function escape_island:event/storm
execute if score $event event_roll matches 3 run function escape_island:event/spore_burst
