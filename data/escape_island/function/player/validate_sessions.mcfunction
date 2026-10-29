execute as @a[tag=ie.active] unless score @s ie.session = $game ie.match_id at @s run function escape_island:player/reset
# 旧局离线玩家重新上线时，先清理其过期状态；不污染当前对局。
execute as @a[tag=ie.participant] unless score @s ie.session = $game ie.match_id at @s run function escape_island:player/reset
execute as @a[tag=state.training] unless score @s ie.session = $game ie.match_id at @s run function escape_island:player/reset

execute as @a[tag=range.active] unless score @s ie.session = $game ie.match_id at @s run function escape_island:player/reset
execute as @a[tag=gs.player] unless score @s ie.session = $game ie.match_id at @s run function escape_island:player/reset

execute as @a[tag=team.human,tag=!ie.active] at @s run function escape_island:player/reset
execute as @a[tag=team.infected,tag=!ie.active] at @s run function escape_island:player/reset

# 旧局在未加载区块留下的设备，重新加载后立即失效。
execute as @e[tag=ie.owned] unless score @s ie.session = $game ie.match_id run kill @s
