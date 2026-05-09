execute if entity @s[tag=state.infected_period] run return 0
execute if entity @s[tag=infected.mother] run return 0
execute if entity @s[tag=infected.common] run return 0

execute if entity @s[tag=role.priest,tag=flag.cross_intact] run function skill:priest/cross_intercept
execute if entity @s[tag=flag.cross_intercepted] run return run tag @s remove flag.cross_intercepted
execute if entity @s[tag=state.infected_period] run return 0

tag @s add state.infected_period
team join infected_period @s
scoreboard players operation @s infect_time = Tunable tunable.infection_seconds

effect give @s minecraft:slowness 1 0 true

title @s title {"text":"§c感染期","bold":true}
title @s subtitle [{"text":"治愈倒计时: ","color":"yellow"},{"score":{"name":"@s","objective":"infect_time"}},{"text":"秒","color":"yellow"}]
playsound minecraft:entity.warden.heartbeat master @s ~ ~ ~ 1 0.7
tellraw @s {"text":"§c警告: 你进入了感染期！寻求船医协助或使用急救箱。","color":"red"}

item replace entity @s armor.head with paper[minecraft:equippable={damage_on_hurt:false,slot:head,camera_overlay:"ie:misc/red"},item_model="ie:empty",minecraft:custom_name=""]
