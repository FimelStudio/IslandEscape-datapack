
execute unless entity @s[tag=infected.mother] run return 0
execute if entity @s[tag=state.dead] run return 0
execute if entity @s[tag=skill.mother.eating] at @s run function skill:mother/eat/release_fallback
function skill:mother/clear_hunt_items
function escape_island:infection/permadeath_spectator

scoreboard players set $game mother_dead 1
bossbar set escape_island:mother_respawn visible false

tellraw @a {"text":"⚡ 母巢崩坏 — 核心母体已消亡，感染者将失去复活能力。","color":"dark_red","bold":true}
playsound minecraft:entity.warden.death master @a ~ ~ ~ 1 0.7
title @a[tag=team.human] actionbar {"text":"⚡ 核心母体已消亡！猎杀所有感染者以获胜！","color":"gold","bold":true}

title @s title {"text":"§4母体消亡","bold":true}
title @s subtitle {"text":"§7你的使命，就此终结。"}
