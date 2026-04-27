# escape_island:game/end_mutate  —  结局6 孢子升腾 感染者全胜
scoreboard players set $game in_game 0

tellraw @a {"text":"[ 结局 6 ] §4§l孢子升腾§r — 所有幸存者已被感染。海岛属于感染者。","color":"dark_red"}
playsound minecraft:entity.wither.death master @a ~ ~ ~ 1 0.6

function escape_island:game/settle
