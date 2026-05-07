kill @e[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{ui:"spore_bar"}}}}]
execute unless score $game in_game matches 1 unless entity @s[tag=state.training] run function escape_island:ui/spore_bar/clear
execute unless score $game in_game matches 1 unless entity @s[tag=state.training] run return 0
execute unless entity @s[tag=team.human] run function escape_island:ui/spore_bar/clear
execute unless entity @s[tag=team.human] run return 0

scoreboard players add @s spore_load 0

execute if score @s spore_load matches ..0 unless items entity @s hotbar.8 minecraft:paper[minecraft:custom_data~{ui:"spore_bar"},minecraft:custom_model_data={strings:["infection_bar0"]}] run function escape_island:ui/spore_bar/set_0
execute if score @s spore_load matches 1..10 unless items entity @s hotbar.8 minecraft:paper[minecraft:custom_data~{ui:"spore_bar"},minecraft:custom_model_data={strings:["infection_bar1"]}] run function escape_island:ui/spore_bar/set_1


execute if score @s spore_load matches 11..20 unless items entity @s hotbar.8 minecraft:paper[minecraft:custom_data~{ui:"spore_bar"},minecraft:custom_model_data={strings:["infection_bar2"]}] run function escape_island:ui/spore_bar/set_2
execute if score @s spore_load matches 21..30 unless items entity @s hotbar.8 minecraft:paper[minecraft:custom_data~{ui:"spore_bar"},minecraft:custom_model_data={strings:["infection_bar3"]}] run function escape_island:ui/spore_bar/set_3
execute if score @s spore_load matches 31..40 unless items entity @s hotbar.8 minecraft:paper[minecraft:custom_data~{ui:"spore_bar"},minecraft:custom_model_data={strings:["infection_bar4"]}] run function escape_island:ui/spore_bar/set_4
execute if score @s spore_load matches 41..50 unless items entity @s hotbar.8 minecraft:paper[minecraft:custom_data~{ui:"spore_bar"},minecraft:custom_model_data={strings:["infection_bar5"]}] run function escape_island:ui/spore_bar/set_5
execute if score @s spore_load matches 51..60 unless items entity @s hotbar.8 minecraft:paper[minecraft:custom_data~{ui:"spore_bar"},minecraft:custom_model_data={strings:["infection_bar6"]}] run function escape_island:ui/spore_bar/set_6
execute if score @s spore_load matches 61..70 unless items entity @s hotbar.8 minecraft:paper[minecraft:custom_data~{ui:"spore_bar"},minecraft:custom_model_data={strings:["infection_bar7"]}] run function escape_island:ui/spore_bar/set_7
execute if score @s spore_load matches 71..80 unless items entity @s hotbar.8 minecraft:paper[minecraft:custom_data~{ui:"spore_bar"},minecraft:custom_model_data={strings:["infection_bar8"]}] run function escape_island:ui/spore_bar/set_8
execute if score @s spore_load matches 81..90 unless items entity @s hotbar.8 minecraft:paper[minecraft:custom_data~{ui:"spore_bar"},minecraft:custom_model_data={strings:["infection_bar9"]}] run function escape_island:ui/spore_bar/set_9
execute if score @s spore_load matches 91.. unless items entity @s hotbar.8 minecraft:paper[minecraft:custom_data~{ui:"spore_bar"},minecraft:custom_model_data={strings:["infection_bar10"]}] run function escape_island:ui/spore_bar/set_10
