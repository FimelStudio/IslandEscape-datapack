execute as @a[tag=ie.active,tag=infected.mother,tag=!state.dead] run function skill:mother/mutate/cooldown_tick
execute as @a[tag=ie.active,tag=infected.mother,tag=!state.dead] run function skill:mother/rotsense/cooldown_tick
execute as @a[tag=ie.active,tag=infected.mother,tag=!state.dead] run function skill:mother/howl/cooldown_tick
execute if score $tick ie.hygiene matches 0 as @a[tag=ie.active,tag=infected.mother,tag=!state.dead,tag=!state.hunting] run function skill:mother/clear_hunt_items
