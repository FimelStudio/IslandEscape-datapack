execute if entity @s[tag=gs.dead] run return 0
scoreboard players remove @s gs_lives 1
scoreboard players set @s gs_respawn 60
scoreboard players set #hit skill.pistol_tmp 1
tag @s add gs.dead
gamemode spectator @s
execute as @p[tag=gs.player,tag=!gs.dead,distance=..32,sort=nearest,limit=1] run scoreboard players add @s gs_score 10
execute as @p[tag=gs.player,tag=!gs.dead,distance=..32,sort=nearest,limit=1] run give @s minecraft:iron_nugget[minecraft:custom_data={ammo:1},minecraft:item_name={text:"9mm 弹药",italic:false,color:"gray"}] 4
tellraw @a[tag=gs.player] [{"selector":"@s"},{"text":" 被击倒。","color":"red"}]
execute as @a[tag=skill.pistol.shooter,limit=1] run title @s times 0 5 5
execute as @a[tag=skill.pistol.shooter,limit=1] run title @s title {"text":"\uE001","font":"ie:hud","shadow_color":0}
execute as @a[tag=skill.ak47.shooter,limit=1] run title @s times 0 5 5
execute as @a[tag=skill.ak47.shooter,limit=1] run title @s title {"text":"\uE001","font":"ie:hud","shadow_color":0}
execute if score @s gs_lives matches ..0 run gamemode spectator @s
