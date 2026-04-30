tag @s add skill.adrenaline.active
scoreboard players operation @s skill.adren_time = #duration skill.adren_cfg
scoreboard players operation @s skill.adren_cd = #cooldown skill.adren_cfg
scoreboard players set @s skill.adren_last_sec 0
function skill:athlete/adrenaline/effect
clear @s minecraft:sugar[custom_data={skill:"athlete_adrenaline"}]
clear @s minecraft:gray_dye[custom_data={skill:"athlete_adrenaline"}]
function skill:athlete/adrenaline/update_cooldown_item
playsound minecraft:entity.player.breath player @s ~ ~ ~ 0.65 1.25
particle minecraft:dust{color:[1.0,0.15,0.05],scale:0.8} ~ ~1 ~ 0.28 0.35 0.28 0.01 12 force @a[distance=..16]
