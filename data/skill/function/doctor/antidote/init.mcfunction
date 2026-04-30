scoreboard objectives add skill.antidote_cd dummy
scoreboard objectives add skill.antidote_regen_cd dummy
scoreboard objectives add skill.antidote_charges dummy
scoreboard objectives add skill.antidote_cfg dummy
scoreboard objectives add skill.antidote_item dummy
scoreboard objectives add skill.antidote_state dummy
scoreboard objectives add skill.antidote_sec dummy
scoreboard objectives add skill.antidote_last_sec dummy

function skill:doctor/antidote/config

advancement revoke @a only skill:doctor/antidote/use
tag @a remove skill.antidote.user
tag @a remove skill.antidote.target
scoreboard players set @a skill.antidote_cd 0
scoreboard players set @a skill.antidote_regen_cd 0
scoreboard players set @a skill.antidote_charges 0
scoreboard players set @a skill.antidote_item 0
scoreboard players set @a skill.antidote_state 0
scoreboard players set @a skill.antidote_sec 0
scoreboard players set @a skill.antidote_last_sec 0
