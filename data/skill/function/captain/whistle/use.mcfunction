advancement revoke @s only skill:captain/whistle/use

execute unless entity @s[tag=captain] run function skill:captain/whistle/cleanup_non_captain
execute unless entity @s[tag=captain] run return 0

execute if score @s skill.whistle_cd matches 1.. run title @s actionbar {"text":"哨子冷却中","color":"yellow"}
execute if score @s skill.whistle_cd matches 1.. run function skill:captain/whistle/update_item
execute if score @s skill.whistle_cd matches 1.. run return 0

function skill:captain/whistle/start
