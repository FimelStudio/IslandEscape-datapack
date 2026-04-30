scoreboard objectives add skill.detector_cd dummy
scoreboard objectives add skill.detector_cfg dummy
scoreboard objectives add skill.detector_item dummy
scoreboard objectives add skill.detector_state dummy
scoreboard objectives add skill.detector_sec dummy
scoreboard objectives add skill.detector_last_sec dummy
scoreboard objectives add skill.viro_passive_cd dummy

function skill:virologist/detector/config

advancement revoke @a only skill:virologist/detector/use
scoreboard players set @a skill.detector_cd 0
scoreboard players set @a skill.detector_item 0
scoreboard players set @a skill.detector_state 0
scoreboard players set @a skill.detector_sec 0
scoreboard players set @a skill.detector_last_sec 0
scoreboard players set @a skill.viro_passive_cd 0
tag @a remove skill.virologist.hit
tag @a remove skill.virologist.viewer
