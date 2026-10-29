
function escape_island:game/human/leave
tag @s add team.infected
tag @s add infected.mother
team join survivors @s
scoreboard players set @s role 11
scoreboard players set @s is_mother 1

execute if entity @s[tag=role.athlete] at @s run function skill:athlete/slide_tackle/cleanup_non_athlete
function escape_island:role/retain_current
function escape_island:role/clear
tag @s remove skill.adrenaline.active
tag @s remove skill.slide.active
tag @s remove skill.slide.locked
tag @s remove state.hunting
tag @s remove state.mutated

function skill:radio/cleanup_non_radio
function skill:virologist/cleanup_non_virologist
function skill:mechanic/cleanup_non_mechanic
function skill:priest/cleanup_non_priest
function escape_island:role/clear_human_loadout
function escape_island:visual/mother_hidden

execute if score Tunable tunable.mother_hp matches 60 run attribute @s minecraft:max_health base set 60
execute if score Tunable tunable.mother_hp matches 70 run attribute @s minecraft:max_health base set 70
execute unless score Tunable tunable.mother_hp matches 60 unless score Tunable tunable.mother_hp matches 70 run attribute @s minecraft:max_health base set 60
effect give @s minecraft:instant_health 1 10 true
effect give @s minecraft:saturation 1 20 true
attribute @s minecraft:armor base set 4
attribute @s minecraft:armor_toughness base set 2
attribute @s minecraft:knockback_resistance base set 0.8
attribute @s minecraft:attack_damage base set 0
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

tellraw @s [{"text":"[ 母体觉醒 ]\n","bold":true,"color":"dark_red"},{"text":"你是本局唯一母体。先伪装接近落单者；夜晚优先阻止修信号塔和登机。\n胜利: 感染所有幸存者，或拖到病毒爆发。","color":"red"}]
title @s title {"text":"§4§l母体"}
title @s subtitle {"text":"§c隐藏身份，感染落单者。"}
