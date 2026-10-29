scoreboard objectives add skill.signal_scan_cd dummy
scoreboard objectives add skill.signal_scan_cfg dummy
scoreboard objectives add skill.signal_scan_item dummy
scoreboard objectives add skill.signal_scan_state dummy
scoreboard objectives add skill.signal_scan_sec dummy
scoreboard objectives add skill.signal_scan_last_sec dummy
scoreboard objectives add skill.signal_scan_time dummy
scoreboard objectives add skill.radio_jam_cd dummy
scoreboard objectives add skill.radio_jam_cfg dummy
scoreboard objectives add skill.radio_jam_state dummy
scoreboard objectives add skill.radio_jam_sec dummy

function skill:radio/signal_scan/config
function skill:radio/jam/config

tag @e[tag=skill.radio.reported] remove skill.radio.reported
