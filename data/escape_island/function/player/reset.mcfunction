# 共用退出入口：@s 为玩家；保留长期数据与本局贡献，清除所有临时能力。
execute if entity @s[tag=skill.mother.eating] at @s run function skill:mother/eat/release_fallback
function escape_island:player/reset_entities
function escape_island:ui/spore_bar/clear
function escape_island:visual/clear_head
function escape_island:player/reset/identity
function escape_island:player/reset/infection
function escape_island:player/reset/skills
function escape_island:player/reset/tasks
function escape_island:player/reset/ui
function escape_island:player/reset/advancements
function skill:radio/cleanup_non_radio
function skill:virologist/cleanup_non_virologist
function skill:mechanic/cleanup_non_mechanic
function skill:priest/cleanup_non_priest
function skill:weapon/pistol/clear_state
function skill:weapon/ak47/clear_state
function escape_island:player/reset/attributes
clear @s
effect clear @s
effect give @s minecraft:instant_health 1 10 true
team leave @s
gamemode adventure @s
title @s actionbar ""
