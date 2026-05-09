
tag @s remove team.human
tag @s add team.infected
tag @s add infected.mother
scoreboard players set @s role 11
scoreboard players set @s is_mother 1

execute if entity @s[tag=role.doctor] run tag @s add retained.doctor
execute if entity @s[tag=role.captain] run tag @s add retained.captain
execute if entity @s[tag=role.engineer] run tag @s add retained.engineer
execute if entity @s[tag=role.marine] run tag @s add retained.marine
execute if entity @s[tag=role.chef] run tag @s add retained.chef
execute if entity @s[tag=role.radio] run tag @s add retained.radio
execute if entity @s[tag=role.virologist] run tag @s add retained.virologist
execute if entity @s[tag=role.mechanic] run tag @s add retained.mechanic
execute if entity @s[tag=role.athlete] run tag @s add retained.athlete
execute if entity @s[tag=role.priest] run tag @s add retained.priest

tag @s remove role.doctor
tag @s remove role.captain
tag @s remove role.engineer
tag @s remove role.marine
tag @s remove role.chef
tag @s remove role.radio
tag @s remove role.virologist
tag @s remove role.mechanic
tag @s remove role.athlete
tag @s remove role.priest
tag @s remove skill.adrenaline.active
tag @s remove skill.slide.active
tag @s remove skill.slide.locked

function skill:radio/cleanup_non_radio
function skill:virologist/cleanup_non_virologist
function skill:mechanic/cleanup_non_mechanic
function skill:priest/cleanup_non_priest

execute if score Tunable tunable.mother_hp matches 60 run attribute @s minecraft:max_health base set 60
execute if score Tunable tunable.mother_hp matches 70 run attribute @s minecraft:max_health base set 70
execute unless score Tunable tunable.mother_hp matches 60 unless score Tunable tunable.mother_hp matches 70 run attribute @s minecraft:max_health base set 60
effect give @s minecraft:instant_health 1 10 true
effect give @s minecraft:saturation 1 20 true
attribute @s minecraft:armor base set 4
attribute @s minecraft:armor_toughness base set 2
attribute @s minecraft:knockback_resistance base set 0.8
attribute @s minecraft:attack_damage base set 4
attribute @s minecraft:movement_speed base set 0.105
attribute @s minecraft:attack_speed base set 4

scoreboard players operation @s mother_hp = Tunable tunable.mother_hp
scoreboard players operation @s mother_last_hp = Tunable tunable.mother_hp
scoreboard players set @s mother_regen_cd 5
scoreboard players set @s mother_hit_cd 0
scoreboard players set @s cd_mother_hunt 0
scoreboard players set @s cd_mother_mutate 0
scoreboard players set @s cd_mother_passive_spore 0
scoreboard players set @s mother_passive_stick 0
scoreboard players set @s skill.mutate_sec 0
scoreboard players set @s mother_phase 1
scoreboard players operation @s used_firework_last = @s used_firework

function escape_island:role/kit_mother

tellraw @s [{"text":"[ 母体觉醒 ]\n","bold":true,"color":"dark_red"},{"text":"你被柯尔文咬伤了。你的身体正在改变。\n任务: 感染所有幸存者，或让岛屿沉没。","color":"red"}]
title @s title {"text":"§4§l母体"}
title @s subtitle {"text":"§c感染。扩散。胜利。"}
