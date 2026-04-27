# escape_island:infection/survivor_death  —  triggered on any survivor death
# Starts 15-second sporification countdown before converting to infected.
# Called from advancement: interaction/hit_player (on death) or generic death event.

execute if entity @s[tag=state.sporifying] run return 0
execute if entity @s[tag=role.priest,tag=flag.cross_intact] run function escape_island:skill/priest_cross_intercept
execute if entity @s[tag=flag.cross_intercepted] run return run tag @s remove flag.cross_intercepted
function escape_island:infection/_sporify_start
