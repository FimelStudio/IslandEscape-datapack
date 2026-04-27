
execute if entity @s[tag=state.sporifying] run return 0
execute if entity @s[tag=role.priest,tag=flag.cross_intact] run function skill:priest/cross_intercept
execute if entity @s[tag=flag.cross_intercepted] run return run tag @s remove flag.cross_intercepted
function escape_island:infection/_sporify_start
