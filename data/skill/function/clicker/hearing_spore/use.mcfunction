advancement revoke @s only skill:clicker/hearing_spore/use
clear @s minecraft:sugar[minecraft:custom_data={skill:"clicker_hearing_spore_used"}]

execute unless entity @s[tag=infected.clicker] run function skill:clicker/hearing_spore/cleanup_non_clicker
execute unless entity @s[tag=infected.clicker] run return 0
execute if entity @s[tag=state.dead] run return 0

execute if score @s skill.clicker_cd matches 1.. run title @s actionbar {"text":"循声孢子冷却中","color":"yellow"}
execute if score @s skill.clicker_cd matches 1.. run function skill:clicker/hearing_spore/update_item
execute if score @s skill.clicker_cd matches 1.. run return 0

tag @s add skill.clicker_spore.caster
tag @a remove skill.clicker_spore.detected
function skill:clicker/hearing_spore/select_targets with storage skill:clicker.hearing_spore config

execute unless entity @a[tag=skill.clicker_spore.detected,limit=1] run title @s actionbar {"text":"附近没有暴露声响的人类，冷却20秒","color":"gray"}
execute unless entity @a[tag=skill.clicker_spore.detected,limit=1] run scoreboard players operation @s skill.clicker_cd = #miss_cooldown skill.clicker_cfg
execute unless entity @a[tag=skill.clicker_spore.detected,limit=1] run tag @s remove skill.clicker_spore.caster
execute unless entity @a[tag=skill.clicker_spore.detected,limit=1] run function skill:clicker/hearing_spore/update_item
execute unless entity @a[tag=skill.clicker_spore.detected,limit=1] run return 0

execute as @a[tag=skill.clicker_spore.detected] unless score @s skill.clicker_id matches 1.. run function skill:clicker/hearing_spore/assign_target_id
execute as @a[tag=skill.clicker_spore.detected] at @a[tag=skill.clicker_spore.caster,limit=1] facing entity @s eyes run function skill:clicker/hearing_spore/spawn_one

scoreboard players operation @s skill.clicker_cd = #cooldown skill.clicker_cfg
function skill:clicker/hearing_spore/update_item
title @s actionbar {"text":"循声孢子正在凝聚","color":"dark_green"}
playsound minecraft:block.sculk_sensor.clicking master @a[distance=..24] ~ ~ ~ 1 0.65
particle minecraft:spore_blossom_air ~ ~1 ~ 1.2 0.7 1.2 0.02 36 force @a[distance=..32]

tag @s remove skill.clicker_spore.caster
tag @a remove skill.clicker_spore.detected
