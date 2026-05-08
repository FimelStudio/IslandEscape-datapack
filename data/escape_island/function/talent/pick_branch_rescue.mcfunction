execute if score @s talent_branch_a matches 0 run scoreboard players set @s talent_branch_a 1
execute unless score @s talent_branch_a matches 0 run scoreboard players set @s talent_branch_b 1
tag @s add talent.branch.rescue
tellraw @s {"text":"已加入支线人格：救援","color":"red"}
