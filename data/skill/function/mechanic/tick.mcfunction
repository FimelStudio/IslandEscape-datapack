function skill:mechanic/trap/tick
execute if score $tick ie.hygiene matches 0 as @a[tag=ie.active,tag=!role.mechanic,tag=!retained.mechanic] run function skill:mechanic/cleanup_non_mechanic
