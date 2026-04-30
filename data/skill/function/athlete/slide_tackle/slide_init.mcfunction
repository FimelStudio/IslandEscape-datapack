scoreboard objectives add skill.slide_time dummy
scoreboard objectives add skill.slide_cd dummy
scoreboard objectives add skill.slide_ok dummy
scoreboard objectives add skill.slide_fall dummy
scoreboard objectives add skill.slide_cost dummy
scoreboard objectives add skill.slide_sprint dummy
scoreboard objectives add skill.stamina dummy
scoreboard objectives add skill.stamina_cfg dummy
scoreboard objectives add skill.stamina_bar dummy
scoreboard objectives add skill.stamina_warn dummy
scoreboard objectives add skill.stamina_color dummy

scoreboard players set #drag skill.slide_fall 98
scoreboard players set #hundred skill.slide_fall 100
scoreboard players set #max_fall skill.slide_fall -1200

function skill:athlete/slide_tackle/stamina_config

tp @e[tag=skill.slide.vehicle] 0 -512 0
kill @e[type=minecraft:area_effect_cloud,tag=skill.slide.vehicle]
kill @e[type=minecraft:pig,tag=skill.slide.vehicle]
kill @e[type=minecraft:silverfish,tag=skill.slide.vehicle]
tag @a remove skill.slide.active
tag @a remove skill.slide.locked
tag @a remove skill.slide.blocked
tag @a remove skill.slide.falling
tag @a remove skill.slide.falling_small
tag @a remove skill.slide.moved
tag @a remove skill.slide.drop_113
tag @a remove skill.slide.drop_100
tag @a remove skill.slide.drop_083
tag @a remove skill.slide.drop_064
tag @a remove skill.slide.drop_044
tag @a remove skill.slide.drop_030
tag @a remove skill.slide.drop_015
tag @a remove skill.slide.drop_008
tag @a remove skill.slide.stamina.init
tag @a remove skill.slide.stamina.showing
tag @a remove skill.slide.cleanup_rider
scoreboard players set @a skill.slide_fall 0
scoreboard players set @a skill.slide_cost 0
scoreboard players set @a skill.slide_sprint 0
scoreboard players set @a skill.stamina_warn 0
