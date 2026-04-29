function skill:mechanic/trap/tick
execute as @a[tag=!mechanic,tag=!retained.mechanic] run function skill:mechanic/cleanup_non_mechanic
