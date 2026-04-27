scoreboard players set $game in_game 0

tellraw @a {"text":"[ 结局 4 ] §4§l毁灭岛屿§r — 孢子炸弹引爆，岛屿与所有感染体一同沉没。","color":"dark_red"}
playsound minecraft:entity.generic.explode master @a ~ ~ ~ 2 0.5

function escape_island:game/settle
