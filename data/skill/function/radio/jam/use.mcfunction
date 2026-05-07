advancement revoke @s only skill:radio/jam/use
clear @s minecraft:sugar[custom_data={skill:"radio_jam_used"}]

execute unless entity @s[tag=retained.radio,tag=infected.common,tag=!state.dead] run return 0

execute if score @s skill.radio_jam_cd matches 1.. run title @s actionbar {"text":"污染干扰器冷却中","color":"yellow"}
execute if score @s skill.radio_jam_cd matches 1.. run function skill:radio/jam/update_item
execute if score @s skill.radio_jam_cd matches 1.. run return 0

function skill:radio/jam/start
