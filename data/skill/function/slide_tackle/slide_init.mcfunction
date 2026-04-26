scoreboard objectives add skill.slide_time dummy
scoreboard objectives add skill.slide_cd dummy
scoreboard objectives add skill.slide_ok dummy
scoreboard objectives add skill.stamina dummy
scoreboard objectives add skill.stamina_cfg dummy
scoreboard objectives add skill.stamina_bar dummy
scoreboard objectives add skill.stamina_warn dummy
scoreboard objectives add skill.stamina_color dummy

function skill:slide_tackle/stamina_config

tp @e[tag=slide_vehicle] 0 -512 0
kill @e[type=minecraft:area_effect_cloud,tag=slide_vehicle]
kill @e[type=minecraft:pig,tag=slide_vehicle]
kill @e[type=minecraft:silverfish,tag=slide_vehicle]
tag @a remove sliding
tag @a remove slide_locked
tag @a remove slide_blocked
tag @a remove slide_falling
tag @a remove slide_falling_small
tag @a remove slide_stamina_showing
scoreboard players set @a skill.stamina_warn 0
