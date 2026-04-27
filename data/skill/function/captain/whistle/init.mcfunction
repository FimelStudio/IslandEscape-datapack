scoreboard objectives add skill.whistle_cd dummy
scoreboard objectives add skill.whistle_cfg dummy
scoreboard objectives add skill.whistle_item dummy
scoreboard objectives add skill.whistle_state dummy
scoreboard objectives add skill.whistle_sec dummy
scoreboard objectives add skill.whistle_last_sec dummy

function skill:captain/whistle/config

advancement revoke @a only skill:captain/whistle/use
scoreboard players set @a skill.whistle_cd 0
scoreboard players set @a skill.whistle_item 0
scoreboard players set @a skill.whistle_state 0
scoreboard players set @a skill.whistle_sec 0
scoreboard players set @a skill.whistle_last_sec 0
