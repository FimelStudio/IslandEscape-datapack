scoreboard objectives add skill.signal_scan_cd dummy
scoreboard objectives add skill.signal_scan_cfg dummy
scoreboard objectives add skill.signal_scan_item dummy
scoreboard objectives add skill.signal_scan_state dummy
scoreboard objectives add skill.signal_scan_sec dummy
scoreboard objectives add skill.signal_scan_last_sec dummy
scoreboard objectives add skill.signal_scan_time dummy

function skill:radio/signal_scan/config

advancement revoke @a only skill:radio/signal_scan/use
scoreboard players set @a skill.signal_scan_cd 0
scoreboard players set @a skill.signal_scan_item 0
scoreboard players set @a skill.signal_scan_state 0
scoreboard players set @a skill.signal_scan_sec 0
scoreboard players set @a skill.signal_scan_last_sec 0
scoreboard players set @a skill.signal_scan_time 0
tag @a remove skill.radio_viewer
tag @e[tag=skill.radio_reported] remove skill.radio_reported
