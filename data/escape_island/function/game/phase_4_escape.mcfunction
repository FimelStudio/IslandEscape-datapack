
execute if score $game cur_phase matches 4 run return 0
scoreboard players set $game cur_phase 4

tellraw @a {"text":"[第 4 阶段] §a撤离窗口开启§r — 快速登上交通工具！","color":"green"}
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1
