# escape_island:infection/add_spore_load  —  macro: add pollution to @s
# Called with: function escape_island:infection/add_spore_load {amount:<n>}
# Halve amount if target has infection_resist tag.

$scoreboard players add @s spore_load $(amount)

# Halve for infection_resist (subtract half back)
execute if entity @s[tag=state.infection_resist] run function escape_island:infection/_resist_reduce

# Reset decay cooldown: common infection tick runs once per second
scoreboard players set @s spore_decay_cd 15

# Check threshold (reads from tunable scoreboard so /reload changes take effect)
execute if entity @s[tag=role.doctor] if score @s spore_load >= Tunable tunable.doctor_spore_threshold run function escape_island:infection/_enter_period
execute unless entity @s[tag=role.doctor] if score @s spore_load >= Tunable tunable.spore_threshold run function escape_island:infection/_enter_period
