execute unless entity @s[tag=state.infected_period] run return 0

tag @s remove state.infected_period
team join survivors @s
tag @s remove flag.self_injected_this_period
scoreboard players set @s infect_time 0
scoreboard players set @s spore_load 0
scoreboard players set @s hb_phase 0
clear @s paper[minecraft:equippable={damage_on_hurt:false,slot:head,camera_overlay:"ie:misc/red"},item_model="ie:empty",minecraft:custom_name=""]

tag @s add state.infection_resist
scoreboard players set @s ie.resist_left 400

effect clear @s minecraft:slowness

title @s title {"text":"§a治愈","bold":true}
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1.2
tellraw @s {"text":"§a感染期已清除。20秒内孢子吸收减半。","color":"green"}
