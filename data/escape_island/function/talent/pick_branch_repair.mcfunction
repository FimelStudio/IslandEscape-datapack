execute if score @s talent_branch_a matches 0 run scoreboard players set @s talent_branch_a 2
execute unless score @s talent_branch_a matches 0 run scoreboard players set @s talent_branch_b 2
tag @s add talent.branch.repair
tellraw @s {"text":"已加入支线人格：修理","color":"yellow"}
