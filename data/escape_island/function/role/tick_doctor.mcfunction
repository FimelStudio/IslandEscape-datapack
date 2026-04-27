# 船医被动: 5格内队友回血+50%; 自身孢子阈值130
# Heal boost: give regen I to nearby survivors every second
execute as @a[tag=role.survivor,tag=!role.doctor,distance=..5] run effect give @s minecraft:regeneration 2 0 true

# Ensure Doctor's personal spore threshold is 130 (checked in add_spore_load via tag)
# No per-tick scoreboard write needed; add_spore_load reads the tag directly.
