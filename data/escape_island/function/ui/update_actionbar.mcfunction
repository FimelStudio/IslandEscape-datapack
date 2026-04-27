# escape_island:ui/update_actionbar  —  per-player status in actionbar (every 5 ticks)

# Infected period: show countdown
execute as @a[tag=state.infected_period] run title @s actionbar [{"text":"感染期: ","color":"red","bold":true},{"score":{"name":"@s","objective":"infect_time"}},{"text":" 秒后转化","color":"red"}]

# Sporifying: countdown
execute as @a[tag=state.sporifying] run title @s actionbar [{"text":"孢化中: ","color":"dark_red","bold":true},{"score":{"name":"@s","objective":"sporify_timer"}},{"text":" 秒后转化","color":"dark_red"}]

# Dead infected / mother respawn countdowns
execute as @a[tag=state.dead,tag=role.infected] run title @s actionbar [{"text":"感染者复活: ","color":"red","bold":true},{"score":{"name":"@s","objective":"mother_respawn"}},{"text":" 秒","color":"red"}]
execute as @a[tag=state.dead,tag=role.mother] run title @s actionbar [{"text":"母体复活: ","color":"dark_red","bold":true},{"score":{"name":"@s","objective":"mother_respawn"}},{"text":" 秒","color":"dark_red"}]

# Survivors: spore load (gold+bold at ≥50)
execute as @a[tag=role.survivor,tag=!state.infected_period,tag=!state.sporifying,scores={spore_load=1..49}] run title @s actionbar [{"text":"孢子污染: ","color":"yellow"},{"score":{"name":"@s","objective":"spore_load"}},{"text":"/100","color":"yellow"}]
execute as @a[tag=role.survivor,tag=!state.infected_period,tag=!state.sporifying,scores={spore_load=50..}] run title @s actionbar [{"text":"⚠ 孢子污染: ","color":"gold","bold":true},{"score":{"name":"@s","objective":"spore_load"}},{"text":"/100","color":"gold","bold":true}]
