scoreboard objectives add skill.adren_time dummy
scoreboard objectives add skill.adren_cd dummy
scoreboard objectives add skill.adren_cfg dummy
scoreboard objectives add skill.adren_item dummy
scoreboard objectives add skill.adren_sec dummy
scoreboard objectives add skill.adren_last_sec dummy

function skill:athlete/adrenaline/config

advancement revoke @a only skill:athlete/adrenaline/use
tag @a remove skill.adrenaline.active
scoreboard players set @a skill.adren_time 0
scoreboard players set @a skill.adren_cd 0
scoreboard players set @a skill.adren_item 0
scoreboard players set @a skill.adren_sec 0
scoreboard players set @a skill.adren_last_sec 0
