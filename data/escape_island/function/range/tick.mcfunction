execute unless entity @e[tag=range.target.static,limit=1] run function escape_island:range/targets/static_target
execute unless entity @e[tag=range.target.moving,limit=1] run function escape_island:range/targets/moving_target
execute unless entity @e[tag=range.target.reaction,limit=1] run function escape_island:range/targets/reaction_target
execute unless entity @e[tag=range.target.sequence,limit=1] run function escape_island:range/targets/sequence_targets

execute as @e[tag=range.target.moving] run scoreboard players add @s range_target_state 1
execute as @e[tag=range.target.moving,scores={range_target_state=80..}] run scoreboard players set @s range_target_state -80
execute as @e[tag=range.target.moving] at @s if score @s range_target_state matches ..-1 if score @p[tag=range.active,limit=1] range_wave matches ..1 run tp @s ~-0.05 ~ ~
execute as @e[tag=range.target.moving] at @s if score @s range_target_state matches 0.. if score @p[tag=range.active,limit=1] range_wave matches ..1 run tp @s ~0.05 ~ ~
execute as @e[tag=range.target.moving] at @s if score @s range_target_state matches ..-1 if score @p[tag=range.active,limit=1] range_wave matches 2 run tp @s ~-0.07 ~ ~
execute as @e[tag=range.target.moving] at @s if score @s range_target_state matches 0.. if score @p[tag=range.active,limit=1] range_wave matches 2 run tp @s ~0.07 ~ ~
execute as @e[tag=range.target.moving] at @s if score @s range_target_state matches ..-1 if score @p[tag=range.active,limit=1] range_wave matches 3.. run tp @s ~-0.09 ~ ~
execute as @e[tag=range.target.moving] at @s if score @s range_target_state matches 0.. if score @p[tag=range.active,limit=1] range_wave matches 3.. run tp @s ~0.09 ~ ~

execute as @e[tag=range.target.reaction] run scoreboard players remove @s range_target_state 1
execute as @e[tag=range.target.reaction,tag=range.reaction.hidden,scores={range_target_state=..0}] at @s run function escape_island:range/targets/reaction_show
execute as @e[tag=range.target.reaction,tag=!range.reaction.hidden,scores={range_target_state=..0}] at @s run function escape_island:range/targets/reaction_hide

execute as @a[tag=range.active,scores={range_mode=2,range_timer=1..}] run scoreboard players remove @s range_timer 1
execute as @a[tag=range.active,scores={range_mode=2}] run bossbar set escape_island:range_timer players @s
execute as @a[tag=range.active,scores={range_mode=2}] store result bossbar escape_island:range_timer value run scoreboard players get @s range_timer
execute as @a[tag=range.active,scores={range_mode=2,range_timer=..0}] run function escape_island:range/finish

execute as @a[tag=range.active,scores={range_mode=3,range_timer=1..}] run scoreboard players remove @s range_timer 1
execute as @a[tag=range.active,scores={range_mode=3,range_timer=..0}] run function escape_island:range/wave_up

execute as @a[tag=range.active,scores={range_mode=0}] run title @s actionbar [{"text":"训练场 得分 ","color":"aqua"},{"score":{"name":"@s","objective":"range_score"}},{"text":" 命中 "},{"score":{"name":"@s","objective":"range_hits"}},{"text":"/"},{"score":{"name":"@s","objective":"range_shots"}},{"text":" 连击 "},{"score":{"name":"@s","objective":"range_combo"}}]
execute as @a[tag=range.active,scores={range_mode=1}] run title @s actionbar [{"text":"精准挑战 剩余开枪 ","color":"green"},{"score":{"name":"@s","objective":"range_timer"}},{"text":" 得分 "},{"score":{"name":"@s","objective":"range_score"}},{"text":" 命中 "},{"score":{"name":"@s","objective":"range_hits"}},{"text":"/"},{"score":{"name":"@s","objective":"range_shots"}}]
execute as @a[tag=range.active,scores={range_mode=2}] run title @s actionbar [{"text":"限时挑战 剩余 "},{"score":{"name":"@s","objective":"range_timer"}},{"text":"t 得分 "},{"score":{"name":"@s","objective":"range_score"}},{"text":" 连击 "},{"score":{"name":"@s","objective":"range_combo"}}]
execute as @a[tag=range.active,scores={range_mode=3}] run title @s actionbar [{"text":"生存挑战 生命 ","color":"red"},{"score":{"name":"@s","objective":"range_lives"}},{"text":" 波次 "},{"score":{"name":"@s","objective":"range_wave"}},{"text":" 得分 "},{"score":{"name":"@s","objective":"range_score"}}]
