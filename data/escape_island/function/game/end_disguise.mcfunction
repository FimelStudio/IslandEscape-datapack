scoreboard players set $game in_game 0

tellraw @a {"text":"[ 结局 5 ] §5§k!!§r§d伪装撤离§5§k!!§r — 母体伪装成幸存者，混上了撤离交通工具。","color":"dark_purple"}
playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1 0.5

function escape_island:game/settle
