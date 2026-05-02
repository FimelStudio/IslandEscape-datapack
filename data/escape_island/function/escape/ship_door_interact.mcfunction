advancement revoke @s only escape_island:interaction/ship_door_interact

execute unless score $game in_game matches 1 run title @s actionbar {"text":"游戏未开始","color":"red"}
execute unless score $game in_game matches 1 run return 0
execute unless score $game cur_phase matches 4 run title @s actionbar {"text":"轮船尚未开放登船","color":"red"}
execute unless score $game cur_phase matches 4 run return 0
execute unless score $game ship_countdown matches 1.. run title @s actionbar {"text":"轮船尚未准备离港","color":"yellow"}
execute unless score $game ship_countdown matches 1.. run return 0

execute if entity @s[tag=state.boarding] run title @s actionbar {"text":"你已登船，等待离港","color":"green"}
execute if entity @s[tag=state.boarding] run return 0
execute if entity @s[tag=team.infected] run title @s actionbar {"text":"感染者无法登船","color":"red"}
execute if entity @s[tag=team.infected] run playsound minecraft:entity.villager.no player @s ~ ~ ~ 1 0.8
execute if entity @s[tag=team.infected] run return 0
execute if entity @s[tag=team.human] run function escape_island:escape/board_ship
execute unless entity @s[tag=team.human] run title @s actionbar {"text":"只有幸存者可以登船","color":"red"}
