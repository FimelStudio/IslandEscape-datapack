
execute if score $game cur_phase matches 5 run return 0
execute if score $game in_game matches 0 run return 0
execute if score $game escaped_count matches 1.. run return 0

scoreboard players set $game cur_phase 5

tellraw @a {"text":"§4§l[第 5 阶段] 孢子升腾§r — 时间耗尽，所有未撤离者将在 20 秒后强制转化！","color":"dark_red","bold":true}
title @a times 10 40 10
title @a title {"text":"§4§l孢子升腾","bold":true}
title @a subtitle {"text":"§c20 秒后强制转化……"}
playsound minecraft:entity.warden.death master @a ~ ~ ~ 1 0.4

effect give @a[tag=team.human,tag=!state.sporifying,tag=!state.dead] minecraft:darkness 25 0 true
effect give @a[tag=team.human,tag=!state.dead] minecraft:slowness 25 2 true

execute as @a[tag=team.human,tag=!state.escaped,tag=!state.spectator,tag=!state.sporifying,tag=!state.dead] run function escape_island:infection/force_infect

schedule function escape_island:game/end_mutate 20s
