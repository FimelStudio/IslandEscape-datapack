execute if score @s talent_core matches 0 run scoreboard players set @s talent_core 1
execute if score @s talent_core matches 1 run tag @s add talent.core.safe
execute if score @s talent_branch_a matches 0 run scoreboard players set @s talent_branch_a 2
execute if score @s talent_branch_a matches 2 run tag @s add talent.branch.repair
execute if score @s talent_branch_b matches 0 run scoreboard players set @s talent_branch_b 1
execute if score @s talent_branch_b matches 1 run tag @s add talent.branch.rescue
execute if score @s talent_fate matches 0 run function escape_island:talent/random_fate
