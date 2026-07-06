scoreboard players set $game in_game 0

tellraw @a {"text":"[实验结局] 伪装撤离 — 母体伪装成幸存者，混上了撤离交通工具。","color":"dark_purple"}
playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1 0.5

function escape_island:game/settle
