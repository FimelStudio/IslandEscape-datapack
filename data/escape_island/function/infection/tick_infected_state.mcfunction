# escape_island:infection/tick_infected_state  —  infection state visuals and countdowns

# Infection period uses seconds; this function runs once per second.
execute as @a[tag=state.infected_period,scores={infect_time=1..}] run scoreboard players remove @s infect_time 1

# Gradual heartbeat: frequency doubles every 10s as infect_time → 0 (starts at 30s)
# 20-30s remaining: every 4 seconds (mod 4 = 0)
execute as @a[tag=state.infected_period,scores={infect_time=20..30}] run scoreboard players operation @s hb_phase = @s infect_time
execute as @a[tag=state.infected_period,scores={infect_time=20..30}] run scoreboard players operation @s hb_phase %= $const_4 infect_time
execute as @a[tag=state.infected_period,scores={infect_time=20..30,hb_phase=0}] at @s run playsound minecraft:entity.warden.heartbeat player @s ~ ~ ~ 0.45 1.1 1

# 10-19s remaining: every 2 seconds (mod 2 = 0)
execute as @a[tag=state.infected_period,scores={infect_time=10..19}] run scoreboard players operation @s hb_phase = @s infect_time
execute as @a[tag=state.infected_period,scores={infect_time=10..19}] run scoreboard players operation @s hb_phase %= $const_2 spore_load
execute as @a[tag=state.infected_period,scores={infect_time=10..19,hb_phase=0}] at @s run playsound minecraft:entity.warden.heartbeat player @s ~ ~ ~ 0.7 1.0 1

# 1-9s remaining: every second
execute as @a[tag=state.infected_period,scores={infect_time=1..9}] at @s run playsound minecraft:entity.warden.heartbeat player @s ~ ~ ~ 1.0 0.85 1

# Infection period visuals (particles visible to all)
execute as @a[tag=state.infected_period] at @s run particle minecraft:portal ~ ~0.15 ~ 0.35 0.05 0.35 0.02 12 force @s
execute as @a[tag=state.infected_period] at @s run particle minecraft:dust{color:[0.9,0.0,0.0],scale:1.1} ~ ~1 ~ 0.25 0.35 0.25 0.01 6 force @s

# Apply speed debuff during infection period (slow I)
execute as @a[tag=state.infected_period] run effect give @s minecraft:slowness 2 0 true

# Captain retained: strength I aura for nearby infected
execute as @a[tag=role.infected,tag=retained.captain,tag=!state.dead] at @s run effect give @a[tag=role.infected,distance=..6] minecraft:strength 2 0 true

# Fully transformed infected: green spore particles (2-block radius, visible to all)
execute as @a[tag=role.infected,tag=!state.dead] at @s run particle minecraft:dust{color:[0.0,0.9,0.25],scale:0.9} ~ ~1 ~ 2 0.7 2 0.01 8 force @a

# On expiry: transform.
execute as @a[tag=state.infected_period,scores={infect_time=..0}] run function escape_island:infection/turn
