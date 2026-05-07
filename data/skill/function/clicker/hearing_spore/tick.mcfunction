function skill:clicker/hearing_spore/config


execute as @a[tag=!infected.clicker] run function skill:clicker/hearing_spore/cleanup_non_clicker

execute as @a[tag=team.human] unless score @s skill.clicker_id matches 1.. run function skill:clicker/hearing_spore/assign_target_id

scoreboard players add @a[tag=infected.clicker] skill.clicker_cd 0
scoreboard players remove @a[tag=infected.clicker,scores={skill.clicker_cd=1..}] skill.clicker_cd 1

execute as @a[tag=infected.clicker,scores={skill.clicker_cd=0,skill.clicker_state=2}] run function skill:clicker/hearing_spore/update_item
execute as @a[tag=infected.clicker,scores={skill.clicker_cd=1..}] run function skill:clicker/hearing_spore/cooldown_tick
execute as @a[tag=infected.clicker] run function skill:clicker/hearing_spore/ensure_item

execute as @e[type=minecraft:marker,tag=entity.clicker_spore_pending] at @s run function skill:clicker/hearing_spore/pending_tick
execute as @e[type=minecraft:marker,tag=entity.clicker_spore] at @s run function skill:clicker/hearing_spore/spore_tick
