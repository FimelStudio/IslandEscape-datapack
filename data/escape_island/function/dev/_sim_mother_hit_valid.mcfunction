execute store result storage escape_island:tmp amount int 1 run scoreboard players get Tunable tunable.mother_spore_hit
function escape_island:infection/add_spore_load with storage escape_island:tmp
scoreboard players set $dev mother_hit_cd 50
playsound minecraft:entity.player.attack.strong player @s ~ ~ ~ 0.8 1
tellraw @s [{"text":"[模拟] 母体有效命中：spore +","color":"dark_red"},{"score":{"name":"Tunable","objective":"tunable.mother_spore_hit"},"color":"red"}]
function escape_island:debug/show_state
