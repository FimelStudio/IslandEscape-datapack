scoreboard players set @s talent_core 1
tag @s add talent.core.safe
tag @s remove talent.core.breakaway
tag @s remove talent.core.focus
tag @s remove talent.core.old_signal
tellraw @s {"text":"已选择核心人格：化险为夷","color":"green"}
