advancement revoke @s only escape_island:infection/researcher_killed
scoreboard players add @s lab_cards 1
give @s minecraft:paper[minecraft:custom_data={item:"lab_card_fragment"},minecraft:custom_name={"text":"员工身份卡碎片","italic":false,"color":"aqua"},minecraft:item_model="ie:item/lab_card_fragment"] 1
execute store result score $researcher_drop event_roll run random value 1..5
execute if score $researcher_drop event_roll matches 1 run give @s minecraft:leather_helmet[minecraft:custom_data={item:"gas_mask"},minecraft:custom_name={"text":"防毒面具","italic":false,"color":"green"},minecraft:item_model="ie:item/gas_mask"] 1
