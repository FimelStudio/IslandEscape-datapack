tag @s add role.chef
function skill:chef/hot_soup/config
scoreboard players set @s skill.soup_cd 0
scoreboard players set @s skill.soup_state 0
function skill:chef/hot_soup/update_item
give @s minecraft:cooked_porkchop 5
tellraw @s {"text":"§a[厨师]§r 热汤: 右键立即饮用回复4心。被动: 夜视 + 5格内队友热餐护盾。","color":"gray"}
