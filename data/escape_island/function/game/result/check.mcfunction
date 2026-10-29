# 感染和撤离完成本次更新后统一仲裁；不把待孢化者当作已清理。
execute unless score $game in_game matches 1 run return 0
execute if score $game ending_triggered matches 1.. run return 0
# 在线名单无法证明离线感染者或待孢化者已被清除；等待参战者返回。
scoreboard players set $game ie.online 0
execute as @a[tag=ie.participant] run scoreboard players add $game ie.online 1
execute if score $game ie.online = $game ie.players if score $game mother_dead matches 1 unless entity @a[tag=infected.common,tag=!state.dead,tag=!state.spectator] unless entity @a[tag=state.sporifying] if entity @a[tag=team.human,tag=!state.dead,tag=!state.sporifying] run function escape_island:game/end_purge
execute unless score $game in_game matches 1 run return 0
execute if score $game ie.evac_ready matches 1 if score $game escaped_count matches 1.. if score $game bomb_armed matches 1.. run function escape_island:escape/_ending_defer_to_bomb
execute if score $game ie.evac_ready matches 1 if score $game escaped_count matches 1.. unless score $game bomb_armed matches 1.. if score $game escape_route matches 1 run function escape_island:game/end_helicopter
execute if score $game ie.evac_ready matches 1 if score $game escaped_count matches 1.. unless score $game bomb_armed matches 1.. if score $game escape_route matches 2 run function escape_island:game/end_ship
execute if score $game ie.evac_ready matches 1 if score $game escaped_count matches 1.. unless score $game bomb_armed matches 1.. if score $game escape_route matches 3 run function escape_island:game/end_lab
execute unless score $game in_game matches 1 run return 0
execute if score $game ie.humans matches 0 run function escape_island:game/end_all_infected
