execute if entity @s[tag=state.dead] if items entity @s weapon.offhand *[custom_data~{item:"generator_action"}] run item replace entity @s weapon.offhand with minecraft:air
execute if entity @s[tag=state.dead] run return 0
execute if entity @s[tag=state.spectator] if items entity @s weapon.offhand *[custom_data~{item:"generator_action"}] run item replace entity @s weapon.offhand with minecraft:air
execute if entity @s[tag=state.spectator] run return 0
execute if entity @s[tag=state.escaped] if items entity @s weapon.offhand *[custom_data~{item:"generator_action"}] run item replace entity @s weapon.offhand with minecraft:air
execute if entity @s[tag=state.escaped] run return 0

execute unless score $game in_game matches 1 if items entity @s weapon.offhand *[custom_data~{item:"generator_action"}] run item replace entity @s weapon.offhand with minecraft:air
execute unless score $game in_game matches 1 run return 0
execute unless score $game cur_phase matches 3..4 if items entity @s weapon.offhand *[custom_data~{item:"generator_action"}] run item replace entity @s weapon.offhand with minecraft:air
execute unless score $game cur_phase matches 3..4 run return 0

execute unless entity @e[type=minecraft:marker,tag=marker.generator,distance=..4,scores={gen_state=1..3},limit=1] if items entity @s weapon.offhand *[custom_data~{item:"generator_action"}] run item replace entity @s weapon.offhand with minecraft:air
execute unless entity @e[type=minecraft:marker,tag=marker.generator,distance=..4,scores={gen_state=1..3},limit=1] run return 0
execute if items entity @s weapon.offhand *[custom_data~{item:"generator_action"}] run return 0
execute if items entity @s weapon.offhand * run title @s actionbar {"text":"副手腾空可操作发电机","color":"yellow"}
execute if items entity @s weapon.offhand * run return 0

function escape_island:task/give_generator_action
