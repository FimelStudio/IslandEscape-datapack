scoreboard objectives add skill.battery_cd dummy
scoreboard objectives add skill.battery_timer dummy
scoreboard objectives add skill.battery_cfg dummy
scoreboard objectives add skill.battery_item dummy
scoreboard objectives add skill.battery_state dummy
scoreboard objectives add skill.battery_sec dummy
scoreboard objectives add skill.battery_last_sec dummy

function skill:engineer/battery/config

advancement revoke @a only skill:engineer/battery/use
scoreboard players set @a skill.battery_cd 0
scoreboard players set @a skill.battery_item 0
scoreboard players set @a skill.battery_state 0
scoreboard players set @a skill.battery_sec 0
scoreboard players set @a skill.battery_last_sec 0
kill @e[tag=entity.engineer_battery]
