execute if score $game ie.mode matches 4 run return 0
execute unless entity @a[tag=ie.active] run return 0
scoreboard players add $tick ie.hygiene 1
execute if score $tick ie.hygiene matches 20.. run scoreboard players set $tick ie.hygiene 0
function skill:athlete/tick
function skill:mother/eat/tick
function skill:mother/tick
function skill:tick
