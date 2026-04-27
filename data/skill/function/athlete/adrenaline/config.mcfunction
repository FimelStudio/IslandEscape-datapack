# Duration in ticks. 200 ticks = 10 seconds.
scoreboard players set #duration skill.adren_cfg 200

# Cooldown in ticks. 2400 ticks = 120 seconds.
scoreboard players set #cooldown skill.adren_cfg 2400

# Player speed effect amplifier. 0 = Speed I = 1.2x movement speed.
scoreboard players set #speed_amp skill.adren_cfg 0

# Slide stamina cost percent while adrenaline is active. 50 = half cost.
scoreboard players set #slide_cost_percent skill.adren_cfg 50
scoreboard players set #hundred skill.adren_cfg 100
scoreboard players set #nineteen skill.adren_cfg 19
scoreboard players set #twenty skill.adren_cfg 20

# Boosted slide speeds. Defaults are slide_tackle/slide_speed values * 1.2.
# If you change the base slide speeds, update these three strings too.
data modify storage skill:athlete.adrenaline slide_speed.fast set value {speed:"0.726"}
data modify storage skill:athlete.adrenaline slide_speed.mid set value {speed:"0.5016"}
data modify storage skill:athlete.adrenaline slide_speed.slow set value {speed:"0.2904"}
