advancement revoke @s only skill:mother/mutate
execute if score @s cd_mother_mutate matches 1.. run tellraw @s [{"text":"[母体] 变异脉冲冷却中：","color":"gray"},{"score":{"name":"@s","objective":"skill.mutate_sec"}},{"text":"秒","color":"gray"}]
execute if score @s cd_mother_mutate matches 1.. run function skill:mother/mutate/update_item
execute if score @s cd_mother_mutate matches 1.. run return 0
execute if entity @s[tag=state.hunting] run title @s actionbar {"text":"猎手脉冲已激活中","color":"dark_red"}
execute if entity @s[tag=state.hunting] run return 0

tag @s add state.hunting
team join infected @s
function escape_island:visual/mother_hunt
execute if score @s mother_phase matches ..2 run scoreboard players set @s cd_mother_hunt 1200
execute if score @s mother_phase matches 3.. run scoreboard players set @s cd_mother_hunt 1500
scoreboard players set @s cd_mother_mutate 0

execute unless entity @s[tag=state.mutated] run tellraw @a {"text":"§4§l母体已变异！§r 伪装脱落，猎手现身。所有幸存者，快跑！","color":"dark_red","bold":true}
execute unless entity @s[tag=state.mutated] at @s run playsound minecraft:entity.warden.roar master @a[distance=..8] ~ ~ ~ 1 0.6
execute unless entity @s[tag=state.mutated] at @s run particle minecraft:dust{color:[0.9,0.0,0.0],scale:2.2} ~ ~1 ~ 0.8 0.7 0.8 0.02 80 force @a[distance=..16]
execute unless entity @s[tag=state.mutated] run title @s title {"text":"§4§l变异完成","bold":true}
execute unless entity @s[tag=state.mutated] run title @s subtitle {"text":"§c伪装已脱落。猎杀开始。"}
execute unless entity @s[tag=state.mutated] run clear @s minecraft:sugar[minecraft:custom_data~{weapon:"pistol"}]
execute unless entity @s[tag=state.mutated] run clear @s minecraft:paper[minecraft:custom_data~{weapon:"pistol_used"}]
execute unless entity @s[tag=state.mutated] run clear @s minecraft:sugar[minecraft:custom_data~{weapon:"ak47"}]
execute unless entity @s[tag=state.mutated] run clear @s minecraft:paper[minecraft:custom_data~{weapon:"ak47_used"}]
execute unless entity @s[tag=state.mutated] run clear @s minecraft:blaze_rod[minecraft:custom_data~{weapon:"shotgun"}]
execute unless entity @s[tag=state.mutated] run clear @s minecraft:sugar[minecraft:custom_data~{weapon:"shotgun_used"}]
execute unless entity @s[tag=state.mutated] run clear @s minecraft:spyglass[minecraft:custom_data~{weapon:"sniper"}]
execute unless entity @s[tag=state.mutated] run clear @s minecraft:iron_axe
execute unless entity @s[tag=state.mutated] run clear @s minecraft:iron_sword
execute unless entity @s[tag=state.mutated] run clear @s minecraft:iron_nugget[minecraft:custom_data={ammo:1}]
execute unless entity @s[tag=state.mutated] run clear @s minecraft:arrow[minecraft:custom_data~{ammo:"sniper_round"}]
execute unless entity @s[tag=state.mutated] run clear @s minecraft:string[minecraft:custom_data~{item:"cable"}]
execute unless entity @s[tag=state.mutated] run clear @s minecraft:gold_ingot[minecraft:custom_data~{item:"fuel_cell"}]
tag @s add state.mutated

title @s actionbar {"text":"§4猎手脉冲激活","color":"dark_red"}
function escape_island:role/kit_mother_hunt
attribute @s minecraft:attack_damage base set 4
execute if score @s mother_phase matches ..2 run effect give @s minecraft:resistance 60 5 true
execute if score @s mother_phase matches ..2 run effect give @s minecraft:speed 60 0 true
execute if score @s mother_phase matches ..2 run effect give @s minecraft:strength 60 0 true
execute if score @s mother_phase matches 3.. run effect give @s minecraft:resistance 75 5 true
execute if score @s mother_phase matches 3.. run effect give @s minecraft:speed 75 0 true
execute if score @s mother_phase matches 3.. run effect give @s minecraft:strength 75 0 true
