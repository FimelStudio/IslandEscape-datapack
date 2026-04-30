execute if score @s gen_hold_time matches 1.. run title @s actionbar {"text":"发电机互动中断","color":"red"}
scoreboard players set @s gen_hold_time 0
scoreboard players set @s gen_hold_lock 0
tag @s remove gen.channel.sabotage
tag @s remove gen.channel.repair
