
tag @s remove state.dead
gamemode survival @s
effect clear @s minecraft:invisibility
effect clear @s minecraft:darkness
effect clear @s minecraft:resistance
effect clear @s minecraft:slowness
execute at @s run kill @e[type=minecraft:marker,tag=entity.dead_anchor,distance=..3,sort=nearest,limit=1]

attribute @s minecraft:max_health base set 60
effect give @s minecraft:instant_health 1 10 true
effect give @s minecraft:saturation 1 20 true

attribute @s minecraft:armor base set 4
attribute @s minecraft:armor_toughness base set 2
attribute @s minecraft:knockback_resistance base set 0.8
attribute @s minecraft:attack_damage base set 6
attribute @s minecraft:movement_speed base set 0.105
scoreboard players set @s mother_hp 60
scoreboard players set @s mother_last_hp 60
scoreboard players set @s mother_regen_cd 5

function escape_island:role/kit_mother

execute at @e[type=minecraft:marker,tag=marker.spore_spot,sort=random,limit=1] run tp @s ~ ~ ~

effect give @s minecraft:resistance 100 255 true
execute at @s run particle minecraft:dust{color:[0.0,0.9,0.25],scale:1.4} ~ ~1 ~ 1 0.8 1 0.02 30 force @a
playsound minecraft:entity.warden.emerge master @s ~ ~ ~ 0.8 0.8

bossbar set escape_island:mother_respawn visible false
tellraw @s {"text":"§4你复活了。","color":"dark_red"}
