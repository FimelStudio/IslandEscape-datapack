tag @s add role.virologist
function skill:virologist/detector/config
scoreboard players set @s skill.detector_cd 0
scoreboard players set @s skill.detector_state 0
scoreboard players set @s skill.viro_passive_cd 0
function skill:virologist/detector/update_item
tellraw @s {"text":"§2[病毒学家]§r 检测剂: 6格内检测感染信号。被动: 8格内母体可见金色粒子。","color":"gray"}
