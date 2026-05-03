function escape_island:infection/add_spore_load {amount:40}
scoreboard players set $dev mother_hit_cd 50
playsound minecraft:entity.player.attack.strong player @s ~ ~ ~ 0.8 1
tellraw @s {"text":"[模拟] 母体有效命中：spore +40","color":"dark_red"}
function escape_island:debug/show_state
