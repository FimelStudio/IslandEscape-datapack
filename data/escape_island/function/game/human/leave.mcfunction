# 阵营转化入口：一次性扣减对局人数，离线玩家仍保留在计数中。
execute if entity @s[tag=ie.participant,tag=team.human] if score $game in_game matches 1 if score $game ie.humans matches 1.. run scoreboard players remove $game ie.humans 1
tag @s remove team.human
