# @s 为活跃玩家；个人计时互不覆盖，不借用 schedule 的服务器执行源。
execute if score @s ie.resist_left matches 1.. run scoreboard players remove @s ie.resist_left 1
execute if entity @s[tag=state.infection_resist,scores={ie.resist_left=0}] run function escape_island:infection/_remove_resist
execute if score @s ie.disguise_left matches 1.. run scoreboard players remove @s ie.disguise_left 1
execute if entity @s[tag=state.disguised] store result bossbar escape_island:disguise value run scoreboard players get @s ie.disguise_left
execute if entity @s[tag=state.disguised,scores={ie.disguise_left=0}] run function skill:mother/_disguise_expire
execute if score @s ie.scan_left matches 1.. run scoreboard players remove @s ie.scan_left 1
execute if entity @s[tag=state.disguise_scanning,tag=state.disguised,scores={ie.scan_left=0}] run function escape_island:game/end_disguise
