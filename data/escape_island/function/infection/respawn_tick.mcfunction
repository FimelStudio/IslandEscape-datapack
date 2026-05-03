execute as @a[tag=state.dead,scores={mother_respawn=1..}] run scoreboard players remove @s mother_respawn 1

execute as @a[tag=state.dead,tag=infected.common,scores={mother_respawn=1..}] run title @s actionbar [{"text":"复活倒计时 ","color":"red"},{"score":{"name":"@s","objective":"mother_respawn"}},{"text":"秒","color":"red"}]
execute as @a[tag=state.dead,tag=infected.common,scores={mother_respawn=-1}] run title @s actionbar {"text":"母巢崩坏 — 等待结局…","color":"dark_gray","italic":true}

execute as @a[tag=state.dead,tag=infected.common,scores={mother_respawn=0}] if entity @e[tag=infected.mother,tag=!state.dead] unless score $game mother_dead matches 1 run function escape_island:infection/infected_respawn
execute as @a[tag=state.dead,tag=infected.common,scores={mother_respawn=0}] unless entity @e[tag=infected.mother,tag=!state.dead] run scoreboard players set @s mother_respawn -1
execute as @a[tag=state.dead,tag=infected.common,scores={mother_respawn=0}] if score $game mother_dead matches 1 run scoreboard players set @s mother_respawn -1
