tag @s add role.marine
clear @s minecraft:iron_nugget[minecraft:custom_data={ammo:1}]
clear @s minecraft:crossbow[minecraft:custom_data~{weapon:"pistol"}]
clear @s minecraft:sugar[minecraft:custom_data~{weapon:"pistol"}]
function skill:weapon/pistol/give
give @s minecraft:iron_nugget[minecraft:custom_data={ammo:1},minecraft:custom_name={"text":"9mm 弹药","italic":false,"color":"gray"}] 24
give @s minecraft:iron_sword[minecraft:custom_data={role_item:"marine.sword"},minecraft:custom_name={"text":"战术刀","italic":false}] 1
scoreboard players set @s skill.suppress_cd 0
function skill:marine/suppress/update_item
give @s minecraft:leather_helmet[minecraft:custom_name={"text":"战术头盔","italic":false}] 1
give @s minecraft:leather_chestplate[minecraft:custom_name={"text":"战术背心","italic":false}] 1
give @s minecraft:leather_leggings[minecraft:custom_name={"text":"战术护腿","italic":false}] 1
give @s minecraft:leather_boots[minecraft:custom_name={"text":"战术靴","italic":false}] 1
tellraw @s {"text":"§c[海军陆战队员]§r 弹药x24。主动: 压制射击。配备格洛克手枪。","color":"gray"}
