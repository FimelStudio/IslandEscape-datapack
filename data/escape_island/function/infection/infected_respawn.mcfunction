# escape_island:infection/infected_respawn  —  respawn an infected player at spore_spot

tag @s remove state.dead
gamemode survival @s
attribute @s minecraft:movement_speed base set 0.1
effect clear @s minecraft:invisibility
effect clear @s minecraft:darkness
effect clear @s minecraft:resistance
effect clear @s minecraft:slowness
effect give @s minecraft:saturation 1 20 true
execute at @s run kill @e[type=minecraft:marker,tag=entity.dead_anchor,distance=..3,sort=nearest,limit=1]

# Clear inventory (infected respawn with empty hands)
clear @s

# Teleport to random spore_spot
execute at @e[type=minecraft:marker,tag=marker.spore_spot,sort=random,limit=1] run tp @s ~ ~ ~

# 5-second invulnerability
effect give @s minecraft:resistance 100 255 true
execute at @s run particle minecraft:dust{color:[0.0,0.9,0.25],scale:1.4} ~ ~1 ~ 1 0.8 1 0.02 30 force @a
playsound minecraft:entity.warden.emerge master @s ~ ~ ~ 0.8 0.8

# Mechanic: grant infected trap on respawn
execute if entity @s[tag=role.mechanic] unless entity @e[tag=entity.mechanic_trap,limit=1] run give @s minecraft:tripwire_hook[minecraft:custom_data={role_item:"mechanic.infected_trap"},minecraft:custom_name={"text":"感染者陷阱","italic":false,"color":"dark_green"}] 1

# Priest retained: 10s resistance II + speed I after respawn (冲入窗口)
execute if entity @s[tag=retained.priest] run effect give @s minecraft:resistance 200 1 true
execute if entity @s[tag=retained.priest] run effect give @s minecraft:speed 200 0 true

tellraw @s {"text":"§c复活。继续感染！","color":"red"}
