scoreboard objectives add skill.clicker_cd dummy
scoreboard objectives add skill.clicker_sec dummy
scoreboard objectives add skill.clicker_last_sec dummy
scoreboard objectives add skill.clicker_state dummy
scoreboard objectives add skill.clicker_cfg dummy
scoreboard objectives add skill.clicker_id dummy
scoreboard objectives add skill.clicker_target_id dummy
scoreboard objectives add skill.clicker_spore_hp dummy
scoreboard objectives add skill.clicker_spore_life dummy
scoreboard objectives add skill.clicker_spore_delay dummy

function skill:clicker/hearing_spore/config
scoreboard players add #next_target skill.clicker_cfg 0

advancement revoke @a only skill:clicker/hearing_spore/use
tag @a remove skill.clicker_spore.detected
tag @a remove skill.clicker_spore.caster
tag @a remove skill.clicker_spore.dead
tag @a remove skill.clicker_spore.active
tag @a remove skill.clicker_spore.target
scoreboard players set @a skill.clicker_cd 0
scoreboard players set @a skill.clicker_sec 0
scoreboard players set @a skill.clicker_last_sec 0
scoreboard players set @a skill.clicker_state 0
scoreboard players set @a skill.clicker_id 0
scoreboard players set @a skill.clicker_target_id 0
kill @e[type=minecraft:marker,tag=entity.clicker_spore]
kill @e[type=minecraft:marker,tag=entity.clicker_spore_pending]
