scoreboard objectives add skill.slide_time dummy
scoreboard objectives add skill.slide_cd dummy
scoreboard objectives add skill.slide_ok dummy

tp @e[tag=slide_vehicle] 0 -512 0
kill @e[type=minecraft:area_effect_cloud,tag=slide_vehicle]
kill @e[type=minecraft:pig,tag=slide_vehicle]
kill @e[type=minecraft:silverfish,tag=slide_vehicle]
tag @a remove sliding
tag @a remove slide_locked
