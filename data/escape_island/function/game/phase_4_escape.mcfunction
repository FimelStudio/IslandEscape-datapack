
execute if score $game cur_phase matches 4 run return 0
scoreboard players set $game cur_phase 4
scoreboard players set $game power_buff 0

tellraw @a {"text":"[第 4 阶段] §a撤离倒计时§r — 逃生路线已激活，尽快登乘！","color":"green"}
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1
