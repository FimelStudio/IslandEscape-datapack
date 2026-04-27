# escape_island:infection/turn  —  convert @s from survivor to infected
# Called when infection period expires or HP reaches 0 during infection period.

clear @s minecraft:carved_pumpkin
team join infected @s

# Preserve role passive before clearing (retained.X tag drives infected passive effects)
execute if entity @s[tag=role.doctor] run tag @s add retained.doctor
execute if entity @s[tag=role.captain] run tag @s add retained.captain
execute if entity @s[tag=role.engineer] run tag @s add retained.engineer
execute if entity @s[tag=role.marine] run tag @s add retained.marine
execute if entity @s[tag=role.chef] run tag @s add retained.chef
execute if entity @s[tag=role.radio] run tag @s add retained.radio
execute if entity @s[tag=role.virologist] run tag @s add retained.virologist
execute if entity @s[tag=role.mechanic] run tag @s add retained.mechanic
execute if entity @s[tag=role.sailor] run tag @s add retained.sailor
execute if entity @s[tag=role.priest] run tag @s add retained.priest
# Sailor: immediate permanent Speed I
execute if entity @s[tag=role.sailor] run effect give @s minecraft:speed 99999 0 true

tag @s remove role.survivor
tag @s remove state.infected_period
tag @s remove role.doctor
tag @s remove role.captain
tag @s remove role.engineer
tag @s remove role.marine
tag @s remove role.chef
tag @s remove role.radio
tag @s remove role.virologist
tag @s remove role.mechanic
tag @s remove role.sailor
tag @s remove role.priest
tag @s add role.infected
scoreboard players set @s role 12

# Adjust attributes to infected stats
attribute @s minecraft:attack_damage base set 4

# Clear survivor kit (keep armor if any)
clear @s #escape_island:role_items
clear @s minecraft:iron_axe

# Notify transform
title @s title {"text":"§4感染","bold":true}
title @s subtitle {"text":"§c你已被同化。扩散孢子。"}
playsound minecraft:entity.witch.celebrate master @s ~ ~ ~ 1 0.5

# Broadcast (no player name, just count-based message)
function escape_island:util/recount_infected
tellraw @a[tag=!role.mother] {"text":"§c岛上有人倒下了……","color":"dark_red","italic":true}
tellraw @a[tag=role.mother] [{"text":"§4+1 感染者已就位。总计: "},{"score":{"name":"$tmp","objective":"infected_count"}}]

# Check win condition: all survivors infected?
execute if score $game in_game matches 1 unless entity @a[tag=role.survivor] run function escape_island:game/end_mutate
