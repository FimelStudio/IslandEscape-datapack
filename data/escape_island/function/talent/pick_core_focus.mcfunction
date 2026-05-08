scoreboard players set @s talent_core 3
tag @s remove talent.core.safe
tag @s remove talent.core.breakaway
tag @s add talent.core.focus
tag @s remove talent.core.old_signal
tellraw @s {"text":"已选择核心人格：临危专注","color":"gold"}
