# Trigger trap if a non-mechanic player steps within 0.8 blocks
execute as @e[tag=entity.mechanic_trap] at @s as @a[tag=!role.mechanic,distance=..1] at @s run function escape_island:skill/_trap_trigger
