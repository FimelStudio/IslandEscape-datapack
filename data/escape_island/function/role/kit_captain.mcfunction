tag @s add role.captain
give @s minecraft:iron_sword[minecraft:custom_data={role_item:"captain.sword"},minecraft:custom_name={"text":"指挥刀","italic":false}] 1
scoreboard players set @s skill.whistle_cd 0
function skill:captain/whistle/update_item
give @s minecraft:leather_helmet[minecraft:custom_name={"text":"皮帽","italic":false}] 1
give @s minecraft:leather_chestplate[minecraft:custom_name={"text":"皮甲","italic":false}] 1
give @s minecraft:leather_leggings[minecraft:custom_name={"text":"皮裤","italic":false}] 1
give @s minecraft:leather_boots[minecraft:custom_name={"text":"皮靴","italic":false}] 1
tellraw @s {"text":"§e[船长]§r 哨子: 8格内队友增益。","color":"gray"}
