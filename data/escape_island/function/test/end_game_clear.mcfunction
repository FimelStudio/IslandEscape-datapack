function escape_island:game/cleanup
scoreboard players set $game ending_triggered 0
tellraw @a {"text":"[自测] 对局、玩家临时状态和预约已清空；地图点位保留。","color":"gold"}
