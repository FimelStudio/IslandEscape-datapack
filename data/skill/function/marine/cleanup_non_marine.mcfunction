function skill:marine/suppress/cleanup_non_marine
advancement revoke @s only skill:marine/gun_mastery/use
scoreboard players set @s skill.gm_burst 0
scoreboard players set @s skill.gm_delay 0
scoreboard players set @s skill.gm_input_cd 0
