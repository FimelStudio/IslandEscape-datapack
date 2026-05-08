execute if score @s talent_branch_a matches 0 run scoreboard players set @s talent_branch_a 4
execute unless score @s talent_branch_a matches 0 run scoreboard players set @s talent_branch_b 4
tag @s add talent.branch.info
tellraw @s {"text":"已加入支线人格：情报","color":"aqua"}
