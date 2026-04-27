# escape_island:task/bomb_activate  —  self-destruct sequence initiated
scoreboard players set $game bomb_armed 1
scoreboard players set $game bomb_countdown 3600

bossbar set escape_island:bomb visible true
bossbar set escape_island:bomb players @a
bossbar set escape_island:bomb max 3600
bossbar set escape_island:bomb value 3600

tellraw @a {"text":"§4[警告] 自爆装置已激活！倒计时 3 分钟。立即撤离！","color":"dark_red","bold":true}
playsound minecraft:block.note_block.bass master @a ~ ~ ~ 1 0.3

function escape_island:game/phase_4_escape
