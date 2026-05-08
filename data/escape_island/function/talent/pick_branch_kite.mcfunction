execute if score @s talent_branch_a matches 0 run scoreboard players set @s talent_branch_a 3
execute unless score @s talent_branch_a matches 0 run scoreboard players set @s talent_branch_b 3
tag @s add talent.branch.kite
tellraw @s {"text":"已加入支线人格：牵制","color":"blue"}
