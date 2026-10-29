
execute as @a[tag=ie.active,tag=state.infected_period,scores={infect_time=1..}] run scoreboard players remove @s infect_time 1

execute as @a[tag=ie.active,tag=state.infected_period,scores={infect_time=20..30}] run scoreboard players operation @s hb_phase = @s infect_time
execute as @a[tag=ie.active,tag=state.infected_period,scores={infect_time=20..30}] run scoreboard players operation @s hb_phase %= $const_4 infect_time
execute as @a[tag=ie.active,tag=state.infected_period,scores={infect_time=20..30,hb_phase=0}] at @s run playsound minecraft:entity.warden.heartbeat player @s ~ ~ ~ 0.45 1.1 1

execute as @a[tag=ie.active,tag=state.infected_period,scores={infect_time=10..19}] run scoreboard players operation @s hb_phase = @s infect_time
execute as @a[tag=ie.active,tag=state.infected_period,scores={infect_time=10..19}] run scoreboard players operation @s hb_phase %= $const_2 spore_load
execute as @a[tag=ie.active,tag=state.infected_period,scores={infect_time=10..19,hb_phase=0}] at @s run playsound minecraft:entity.warden.heartbeat player @s ~ ~ ~ 0.7 1.0 1

execute as @a[tag=ie.active,tag=state.infected_period,scores={infect_time=1..9}] at @s run playsound minecraft:entity.warden.heartbeat player @s ~ ~ ~ 1.0 0.85 1

execute as @a[tag=ie.active,tag=state.infected_period] at @s run particle minecraft:portal ~ ~0.15 ~ 0.35 0.05 0.35 0.02 12 force @s
execute as @a[tag=ie.active,tag=state.infected_period] at @s run particle minecraft:dust{color:[0.9,0.0,0.0],scale:1.1} ~ ~1 ~ 0.25 0.35 0.25 0.01 6 force @s
execute as @a[tag=ie.active,tag=state.infected_period] at @s run particle minecraft:dust{color:[1.0,0.72,0.0],scale:0.9} ~ ~1.15 ~ 0.25 0.3 0.25 0.01 4 force @a[tag=team.human,distance=..8]

execute as @a[tag=ie.active,tag=state.infected_period] run effect give @s minecraft:slowness 2 0 true

execute as @a[tag=ie.active,tag=state.infected_period,scores={infect_time=1..}] run title @s actionbar [{"text":"感染转化中 ","color":"gold"},{"score":{"name":"@s","objective":"infect_time"}},{"text":"秒","color":"gold"}]

execute as @a[tag=ie.active,tag=infected.common,tag=retained.captain,tag=!state.dead] at @s run effect give @a[tag=infected.common,distance=..6] minecraft:strength 2 0 true

execute as @a[tag=ie.active,tag=infected.common,tag=!state.dead] at @s run particle minecraft:dust{color:[0.0,0.9,0.25],scale:0.9} ~ ~1 ~ 2 0.7 2 0.01 8 force @a

execute as @a[tag=ie.active,tag=state.infected_period,scores={infect_time=..0}] run function escape_island:infection/turn
