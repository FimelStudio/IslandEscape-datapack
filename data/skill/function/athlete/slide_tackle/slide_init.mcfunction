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
