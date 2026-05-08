scoreboard players set @s talent_core 0
scoreboard players set @s talent_branch_a 0
scoreboard players set @s talent_branch_b 0
scoreboard players set @s talent_fate 0
scoreboard players set @s talent_exhaustion 0
scoreboard players set @s talent_rescue_cd 0
scoreboard players set @s talent_info_cd 0
scoreboard players set @s talent_focus_time 0
tag @s remove talent.core.safe
tag @s remove talent.core.breakaway
tag @s remove talent.core.focus
tag @s remove talent.core.old_signal
tag @s remove talent.branch.rescue
tag @s remove talent.branch.repair
tag @s remove talent.branch.kite
tag @s remove talent.branch.info
tag @s remove talent.fate.cabin_memory
tag @s remove talent.fate.radio_echo
tag @s remove talent.fate.cold_room
tag @s remove talent.fate.old_wound
tellraw @s {"text":"人格牌组已清空。","color":"gray"}
