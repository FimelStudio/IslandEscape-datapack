execute as @a[tag=infected.mother,tag=!state.dead] run function skill:mother/mutate/cooldown_tick
execute as @a[tag=infected.mother,tag=!state.dead,tag=state.mutated] run function skill:mother/rotsense/cooldown_tick
execute as @a[tag=infected.mother,tag=!state.dead,tag=state.mutated] run function skill:mother/howl/cooldown_tick
execute as @a[tag=infected.mother,tag=!state.dead,tag=!state.mutated] run function skill:mother/clear_hunt_items
