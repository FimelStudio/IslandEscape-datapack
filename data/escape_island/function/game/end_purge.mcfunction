scoreboard players set $game in_game 0

tellraw @a {"text":"[ 结局 7 ] §2§l幸存者的黎明§r — 母体消亡，感染者全灭。海岛得以清净。","color":"green"}
title @a[tag=team.human] title {"text":"§a§l幸存者胜利","bold":true}
title @a[tag=team.human] subtitle {"text":"§2母巢崩坏，最终清剿完成。"}
title @a[tag=team.infected] title {"text":"§8感染链断裂","bold":true}
title @a[tag=team.infected] subtitle {"text":"§7母体已逝，你们的使命戛然而止。"}
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 0.9

function escape_island:game/settle
