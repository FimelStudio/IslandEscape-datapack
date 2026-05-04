
scoreboard players enable @a ie.dialog
scoreboard players enable @a ie.eat_health
execute as @a[scores={ie.dialog=1..}] run function escape_island:dialog/trigger
execute as @a[scores={ie.eat_health=1..}] run function skill:mother/eat/apply_config_trigger


execute as @a[tag=team.human,tag=!state.sporifying,tag=!state.dead,tag=!state.escaped,tag=!state.spectator] at @s run spawnpoint @s ~ ~ ~
execute as @a[tag=infected.common,tag=!state.dead,tag=!state.escaped,tag=!state.spectator] at @s run spawnpoint @s ~ ~ ~
execute as @a[tag=infected.mother,tag=!state.dead,tag=!state.escaped,tag=!state.spectator] at @s run spawnpoint @s ~ ~ ~
function escape_island:infection/death_check
execute as @a at @s run function escape_island:ui/spore_bar/tick
execute as @a[tag=state.sporifying] at @s at @e[type=minecraft:marker,tag=entity.downed_anchor,distance=..3,sort=nearest,limit=1] run tp @s ~ ~ ~
execute as @a[tag=state.dead] at @s at @e[type=minecraft:marker,tag=entity.dead_anchor,distance=..3,sort=nearest,limit=1] run tp @s ~ ~ ~

execute as @a[scores={signal_repair_time=1..,signal_repair_seen=0}] run function escape_island:task/signal_tower_reset_hold
scoreboard players remove @a[scores={signal_repair_seen=1..}] signal_repair_seen 1
execute as @a[scores={ship_hold_time=1..,ship_hold_seen=0}] run function escape_island:task/ship_part_reset_hold
scoreboard players remove @a[scores={ship_hold_seen=1..}] ship_hold_seen 1

execute as @a at @s run function escape_island:task/generator_action_area_tick
execute as @a[scores={gen_hold_lock=1,gen_hold_seen=0}] run function escape_island:task/generator_reset_hold
execute as @a[scores={gen_hold_time=1..,gen_hold_seen=0}] run function escape_island:task/generator_reset_hold
scoreboard players remove @a[scores={gen_hold_seen=1..}] gen_hold_seen 1
scoreboard players remove @a[scores={gen_interact_cd=1..}] gen_interact_cd 1

execute if score $game in_game matches 1 run function escape_island:game/phase_check
execute if score $game cur_phase matches 4 if score $game heli_motion matches 1.. run function escape_island:escape/helicopter_motion_tick

scoreboard players set $training_needed dev_count 0
execute as @e[scores={mother_hit_cd=1..}] run scoreboard players remove @s mother_hit_cd 1
execute as @e[tag=state.attack_slowed,scores={mother_hit_cd=0}] run attribute @s minecraft:attack_speed base set 4
execute as @e[tag=state.attack_slowed,scores={mother_hit_cd=0}] run tag @s remove state.attack_slowed

execute if score $dev mother_hit_cd matches 1.. run scoreboard players remove $dev mother_hit_cd 1


execute unless score $game in_game matches 1 if entity @a[tag=state.training] run scoreboard players set $training_needed dev_count 1
execute unless score $game in_game matches 1 if entity @a[tag=state.infected_period] run scoreboard players set $training_needed dev_count 1
execute unless score $game in_game matches 1 if entity @a[tag=state.sporifying] run scoreboard players set $training_needed dev_count 1
execute unless score $game in_game matches 1 if entity @a[tag=state.dead] run scoreboard players set $training_needed dev_count 1
execute unless score $game in_game matches 1 if entity @a[scores={role=1..}] run scoreboard players set $training_needed dev_count 1
execute unless score $game in_game matches 1 if score $training_needed dev_count matches 1 run function escape_island:training/tick
