
execute as @a[tag=state.infected_period] run title @s actionbar [{"text":"感染期: ","color":"red","bold":true},{"score":{"name":"@s","objective":"infect_time"}},{"text":" 秒后转化","color":"red"}]

execute as @a[tag=state.sporifying] run title @s actionbar [{"text":"孢化中: ","color":"dark_red","bold":true},{"score":{"name":"@s","objective":"sporify_timer"}},{"text":" 秒后转化","color":"dark_red"}]

execute as @a[tag=state.dead,tag=infected.common] run title @s actionbar [{"text":"感染者复活: ","color":"red","bold":true},{"score":{"name":"@s","objective":"mother_respawn"}},{"text":" 秒","color":"red"}]
execute as @a[tag=state.dead,tag=infected.mother] run title @s actionbar [{"text":"母体复活: ","color":"dark_red","bold":true},{"score":{"name":"@s","objective":"mother_respawn"}},{"text":" 秒","color":"dark_red"}]

#execute as @a[tag=team.human,tag=!state.infected_period,tag=!state.sporifying,scores={spore_load=1..49}] run title @s actionbar [{"text":"孢子污染: ","color":"yellow"},{"score":{"name":"@s","objective":"spore_load"}},{"text":"/100","color":"yellow"}]
#execute as @a[tag=team.human,tag=!state.infected_period,tag=!state.sporifying,scores={spore_load=50..}] run title @s actionbar [{"text":"⚠ 孢子污染: ","color":"gold","bold":true},{"score":{"name":"@s","objective":"spore_load"}},{"text":"/100","color":"gold","bold":true}]
