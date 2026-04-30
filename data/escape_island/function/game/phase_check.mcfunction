
scoreboard players add $game phase_timer 1

execute if score $game cur_phase matches 1 if score $game phase_timer matches 600 run tellraw @a {"text":"丛林深处传来了压抑的咳嗽声……","color":"dark_gray","italic":true}
execute if score $game cur_phase matches 1 if score $game phase_timer matches 600 run playsound minecraft:entity.fox.hurt ambient @a ~ ~ ~ 0.6 0.7
execute if score $game cur_phase matches 2 if score $game phase_timer matches 3300 run tellraw @a {"text":"[系统] 信号塔受损——通信中断。","color":"red"}
execute if score $game cur_phase matches 2 if score $game phase_timer matches 3300 run playsound minecraft:block.anvil.land master @a ~ ~ ~ 0.5 1.2
execute if score $game cur_phase matches 3 if score $game phase_timer matches 6000 run tellraw @a {"text":"[提示] 线缆散落在营地附近。","color":"yellow"}
execute if score $game cur_phase matches 3 if score $game phase_timer matches 8400 run tellraw @a {"text":"[提示] 备用发电机在海岸工棚和实验室外各有一台。","color":"yellow"}
execute if score $game cur_phase matches 3 if score $game phase_timer matches 16800 run tellraw @a {"text":"岛屿上空的孢子浓度正在上升……","color":"dark_purple","italic":true}
execute if score $game cur_phase matches 3 if score $game phase_timer matches 16800 run playsound minecraft:block.sculk_sensor.clicking ambient @a ~ ~ ~ 1 0.5

execute if score $game cur_phase matches 1 if score $game phase_timer matches 2400.. run function escape_island:game/phase_2_awakening

execute if score $game cur_phase matches 2 if score $game phase_timer matches 3600.. run function escape_island:game/phase_3_repair

execute if score $game cur_phase matches 3 run function escape_island:game/check_helicopter_ready

execute if score $game cur_phase matches 3 if score $game phase_timer matches 18000.. run function escape_island:game/phase_5_mutate
execute if score $game cur_phase matches 4 if score $game phase_timer matches 18000.. run function escape_island:game/phase_5_mutate

execute if score $game phase_timer matches 1 run scoreboard players set $tick cycle20 0
scoreboard players add $tick cycle20 1
execute if score $tick cycle20 matches 20.. run scoreboard players set $tick cycle20 0
execute if score $tick cycle20 matches 0 run function escape_island:_tick_20

scoreboard players add $tick cycle5 1
execute if score $tick cycle5 matches 5.. run scoreboard players set $tick cycle5 0
execute if score $tick cycle5 matches 0 run function escape_island:ui/update_actionbar
