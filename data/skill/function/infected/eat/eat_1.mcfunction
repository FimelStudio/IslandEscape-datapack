execute as @a[tag=zombie_mom,limit=1] run title @s actionbar {text:"已吞噬感染体，再次使用将其投出",color:"red"}

execute as @a[tag=zombie_mom,limit=1] run advancement revoke @s only skill:infected/eat_entity

execute as @a[tag=zombie_mom,limit=1] at @s anchored eyes facing entity @a[tag=zombie,limit=1,sort=nearest,distance=..8] eyes positioned ^ ^ ^3 run tag @a[tag=zombie,limit=1,sort=nearest] add eated_zombie

execute as @a[tag=eated_zombie,limit=1] summon text_display run function skill:infected/eat/get_player_name

execute as @a[tag=eated_zombie,limit=1] run function skill:infected/eat/eated_1_tp_mom

execute as @a[tag=zombie_mom,limit=1] run function skill:infected/eat/eat_1_get with storage zombie:eated

