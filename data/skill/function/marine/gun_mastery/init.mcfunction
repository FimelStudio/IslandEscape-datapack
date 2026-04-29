scoreboard objectives add skill.gm_burst dummy
scoreboard objectives add skill.gm_delay dummy
scoreboard objectives add skill.gm_input_cd dummy
scoreboard objectives add skill.gm_runtime dummy

advancement revoke @a only skill:marine/gun_mastery/use
scoreboard players set @a skill.gm_burst 0
scoreboard players set @a skill.gm_delay 0
scoreboard players set @a skill.gm_input_cd 0
scoreboard players set #hit skill.gm_runtime 0
