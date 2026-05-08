scoreboard players set $game gs_active 1
scoreboard players set $game gs_timer 180
execute unless entity @a[tag=gs.ready,limit=2] run tag @s add gs.ready
execute as @a[tag=gs.ready] run tag @s add gs.player
execute as @a[tag=gs.player] run scoreboard players set @s gs_lives 3
execute as @a[tag=gs.player] run scoreboard players set @s gs_score 0
execute as @a[tag=gs.player] run scoreboard players set @s gs_respawn 0
execute as @a[tag=gs.player] run scoreboard players set @s gs_invuln 60
team join gunfight @a[tag=gs.player]
clear @a[tag=gs.player]
execute as @a[tag=gs.player] run function skill:weapon/pistol/give
give @a[tag=gs.player] minecraft:iron_nugget[minecraft:custom_data={ammo:1},minecraft:item_name={text:"9mm 弹药",italic:false,color:"gray"}] 16
gamemode adventure @a[tag=gs.player]
spreadplayers ~ ~ 2 12 false @a[tag=gs.player]
title @a[tag=gs.player] title {"text":"Last Stand","color":"red","bold":true}
tellraw @a {"text":"[Last Stand] 枪战开始。每人 3 命，击倒对手得分。","color":"red"}
