scoreboard objectives add skill.suppress_cd dummy
scoreboard objectives add skill.suppress_cfg dummy
scoreboard objectives add skill.suppress_item dummy
scoreboard objectives add skill.suppress_state dummy
scoreboard objectives add skill.suppress_sec dummy
scoreboard objectives add skill.suppress_last_sec dummy

function skill:marine/suppress/config

advancement revoke @a only skill:marine/suppress/use
scoreboard players set @a skill.suppress_cd 0
scoreboard players set @a skill.suppress_item 0
scoreboard players set @a skill.suppress_state 0
scoreboard players set @a skill.suppress_sec 0
scoreboard players set @a skill.suppress_last_sec 0
