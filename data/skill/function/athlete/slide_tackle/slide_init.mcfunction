scoreboard objectives add skill.slide_time dummy
scoreboard objectives add skill.slide_cd dummy
scoreboard objectives add skill.slide_ok dummy
scoreboard objectives add skill.slide_fall dummy
scoreboard objectives add skill.slide_cost dummy
scoreboard objectives add skill.stamina dummy
scoreboard objectives add skill.stamina_cfg dummy
scoreboard objectives add skill.stamina_bar dummy
scoreboard objectives add skill.stamina_warn dummy
scoreboard objectives add skill.stamina_color dummy

scoreboard players set #drag skill.slide_fall 98
scoreboard players set #hundred skill.slide_fall 100
scoreboard players set #max_fall skill.slide_fall -1200

function skill:athlete/slide_tackle/stamina_config

tp @e[tag=slide_vehicle] 0 -512 0
kill @e[type=minecraft:area_effect_cloud,tag=slide_vehicle]
kill @e[type=minecraft:pig,tag=slide_vehicle]
kill @e[type=minecraft:silverfish,tag=slide_vehicle]
tag @a remove sliding
tag @a remove slide_locked
tag @a remove slide_blocked
tag @a remove slide_falling
tag @a remove slide_falling_small
tag @a remove slide_moved
tag @a remove slide_drop_113
tag @a remove slide_drop_100
tag @a remove slide_drop_083
tag @a remove slide_drop_064
tag @a remove slide_drop_044
tag @a remove slide_drop_030
tag @a remove slide_drop_015
tag @a remove slide_drop_008
tag @a remove slide_stamina_init
tag @a remove slide_stamina_showing
tag @a remove athlete_cleanup_rider
scoreboard players set @a skill.slide_fall 0
scoreboard players set @a skill.slide_cost 0
scoreboard players set @a skill.stamina_warn 0
