scoreboard objectives add skill.soup_cd dummy
scoreboard objectives add skill.soup_cfg dummy
scoreboard objectives add skill.soup_item dummy
scoreboard objectives add skill.soup_state dummy
scoreboard objectives add skill.soup_sec dummy
scoreboard objectives add skill.soup_last_sec dummy

function skill:chef/hot_soup/config

advancement revoke @a only skill:chef/hot_soup/use
scoreboard players set @a skill.soup_cd 0
scoreboard players set @a skill.soup_item 0
scoreboard players set @a skill.soup_state 0
scoreboard players set @a skill.soup_sec 0
scoreboard players set @a skill.soup_last_sec 0
