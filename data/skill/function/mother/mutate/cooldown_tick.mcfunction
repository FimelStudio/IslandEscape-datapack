execute as @s[tag=state.hunting,scores={cd_mother_hunt=1..}] run scoreboard players remove @s cd_mother_hunt 1
execute as @s[tag=state.hunting,scores={cd_mother_hunt=0}] run function skill:mother/mutate/expire
execute as @s[tag=!state.hunting,scores={cd_mother_mutate=1..}] run scoreboard players remove @s cd_mother_mutate 1

scoreboard players set @s skill.mutate_sec 0
execute if entity @s[tag=state.hunting] run scoreboard players operation @s skill.mutate_sec = @s cd_mother_hunt
execute unless entity @s[tag=state.hunting] run scoreboard players operation @s skill.mutate_sec = @s cd_mother_mutate
scoreboard players operation @s skill.mutate_sec /= $const_20 cd_mother_rotsense

function skill:mother/mutate/update_item
