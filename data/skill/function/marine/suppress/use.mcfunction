advancement revoke @s only skill:marine/suppress/use

execute anchored eyes positioned ^ ^ ^1 run kill @e[type=minecraft:arrow,distance=..3,sort=nearest,limit=1]

execute unless entity @s[tag=marine] run function skill:marine/suppress/cleanup_non_marine
execute unless entity @s[tag=marine] run return 0

execute if score @s skill.suppress_cd matches 1.. run title @s actionbar {"text":"压制射击冷却中","color":"yellow"}
execute if score @s skill.suppress_cd matches 1.. run function skill:marine/suppress/update_item
execute if score @s skill.suppress_cd matches 1.. run return 0

function skill:marine/suppress/start
