advancement revoke @s only skill:common/signal_gun
execute anchored eyes positioned ^ ^ ^2 as @e[tag=team.infected,tag=!infected.mother,tag=!state.dead,tag=!state.spectator,distance=..3,sort=nearest,limit=1] run function skill:common/_signal_hit
execute anchored eyes positioned ^ ^ ^2 as @e[tag=infected.mother,tag=state.hunting,tag=!state.dead,tag=!state.spectator,distance=..3,sort=nearest,limit=1] run function skill:common/_signal_hit
