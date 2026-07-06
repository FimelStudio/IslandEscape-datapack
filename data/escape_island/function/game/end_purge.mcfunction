execute if score $game ending_triggered matches 1.. run return 0
scoreboard players set $game in_game 0
scoreboard players set $game ending_triggered 1
scoreboard players set $game escape_result 4

tellraw @a {"text":"[v0.1 胜负] 幸存者肃清胜利 — 母体死亡，感染者被清除。","color":"green","bold":true}
title @a[tag=team.human] title {"text":"§a§l幸存者胜利","bold":true}
title @a[tag=team.human] subtitle {"text":"§2母巢崩坏，最终清剿完成。"}
title @a[tag=team.infected] title {"text":"§8感染链断裂","bold":true}
title @a[tag=team.infected] subtitle {"text":"§7母体已逝，你们的使命戛然而止。"}
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 0.9

function escape_island:game/settle
