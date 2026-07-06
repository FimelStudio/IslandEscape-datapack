execute if score $game ending_triggered matches 1.. run return 0
scoreboard players set $game ending_triggered 1
scoreboard players set $game in_game 0

title @a title {"text":"§4§l感染阵营胜利","bold":true}
title @a subtitle {"text":"§c所有幸存者已被转化。"}
playsound minecraft:entity.warden.death master @a ~ ~ ~ 1 0.7

schedule clear escape_island:game/end_mutate
schedule function escape_island:game/end_all_infected_finish 60t
