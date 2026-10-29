execute as @a[tag=ie.active,tag=state.dead,tag=!state.spectator,scores={mother_respawn=1..}] run scoreboard players remove @s mother_respawn 1

execute as @a[tag=ie.active,tag=state.dead,tag=!state.spectator,tag=infected.common,scores={mother_respawn=1..}] run title @s actionbar [{"text":"复活倒计时 ","color":"red"},{"score":{"name":"@s","objective":"mother_respawn"}},{"text":"秒","color":"red"}]
execute as @a[tag=ie.active,tag=state.dead,tag=!state.spectator,tag=infected.common,scores={mother_respawn=-1}] run title @s actionbar {"text":"母巢崩坏 — 等待结局…","color":"dark_gray","italic":true}

execute as @a[tag=ie.active,tag=state.dead,tag=!state.spectator,tag=infected.common,scores={mother_respawn=0}] if entity @e[tag=infected.mother,tag=!state.dead,tag=!state.spectator] unless score $game mother_dead matches 1 run function escape_island:infection/infected_respawn
execute as @a[tag=ie.active,tag=state.dead,tag=!state.spectator,tag=infected.common,scores={mother_respawn=0}] unless score $game mother_dead matches 1 unless entity @e[tag=infected.mother,tag=!state.dead,tag=!state.spectator] run title @s actionbar {"text":"母体暂时离线，等待信号恢复…","color":"dark_gray"}
execute as @a[tag=ie.active,tag=state.dead,tag=!state.spectator,tag=infected.common,scores={mother_respawn=0}] if score $game mother_dead matches 1 run function escape_island:infection/permadeath_spectator
