scoreboard players remove @a[scores={talent_exhaustion=1..}] talent_exhaustion 1
scoreboard players remove @a[scores={talent_rescue_cd=1..}] talent_rescue_cd 1
scoreboard players remove @a[scores={talent_info_cd=1..}] talent_info_cd 1
execute as @a[tag=talent.fate.old_wound,tag=team.human,tag=!state.dead,scores={spore_load=50..}] run effect give @s minecraft:speed 2 0 true
execute as @a[tag=talent.core.old_signal,tag=team.human,scores={talent_info_cd=..0}] at @s if entity @a[tag=infected.common,tag=!state.dead,distance=..32,limit=1] run tellraw @s {"text":"[旧讯号] 附近有异常回波。","color":"dark_aqua"}
execute as @a[tag=talent.core.old_signal,tag=team.human,scores={talent_info_cd=..0}] if entity @a[tag=infected.common,tag=!state.dead,distance=..32,limit=1] run scoreboard players set @s talent_info_cd 90
