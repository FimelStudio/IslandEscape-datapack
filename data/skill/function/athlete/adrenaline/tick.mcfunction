kill @e[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{skill:"athlete_adrenaline"}}}}]

execute as @a[tag=!role.athlete] run function skill:athlete/adrenaline/cleanup_non_athlete
execute as @a[tag=role.athlete] if score @s skill.adren_cd matches 1.. run function skill:athlete/adrenaline/cooldown_tick
execute as @a[tag=role.athlete,tag=adren_active] run function skill:athlete/adrenaline/active_tick
execute as @a[tag=role.athlete] run function skill:athlete/adrenaline/ensure_item
