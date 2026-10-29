tag @s add role.mechanic
function skill:mechanic/trap/config
scoreboard players set @s skill.trap_cd 0
scoreboard players set @s skill.trap_state 0
scoreboard players operation @s skill.trap_charges = #max_traps skill.trap_cfg
scoreboard players set @s skill.trap_place_cd 0
function skill:mechanic/trap/update_item
tellraw @s {"text":"§7[机修工]§r 被动: 船坞修复加速。机关陷阱: 触发缓速+暴露。","color":"gray"}
