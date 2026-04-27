# escape_island:skill/doctor_inject  —  called by advancement (right-click player with syringe)
# Revoke advancement so it can trigger again
advancement revoke @s only escape_island:skill/doctor_inject

# Check cooldown
execute if score @s cd_doctor matches 1.. run tellraw @s {"text":"§c解毒针冷却中。","color":"red"}
execute if score @s cd_doctor matches 1.. run return 0

# Check needle count
execute unless entity @s[tag=flag.has_inject] run return 0

# Find nearest player in infection period within 5 blocks
execute as @p[tag=state.infected_period,tag=!role.doctor,distance=..5,sort=nearest,limit=1] run function escape_island:skill/_inject_target

# Set cooldown (90 seconds)
scoreboard players set @s cd_doctor 90
