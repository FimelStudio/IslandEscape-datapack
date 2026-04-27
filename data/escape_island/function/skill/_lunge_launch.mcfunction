# Apply forward velocity for 8-block lunge (0.5s flight)
# Use tp-based movement: teleport in the facing direction iteratively via schedule
# Simplified: give boost effect and rely on momentum
tp @s ^ ^ ^8

# Check landing: apply 4 damage + 0.5s slow to nearby players within 2 blocks
execute as @a[tag=role.survivor,distance=..2] run damage @s 4 minecraft:generic
execute as @a[tag=role.survivor,distance=..2] run effect give @s minecraft:slowness 10 0 true

# Add spore to anyone hit
execute as @a[tag=role.survivor,distance=..2] run function escape_island:infection/add_spore_load {amount:35}

playsound minecraft:entity.phantom.flap master @a ~ ~ ~ 1 0.5
