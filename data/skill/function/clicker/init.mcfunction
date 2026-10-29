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
