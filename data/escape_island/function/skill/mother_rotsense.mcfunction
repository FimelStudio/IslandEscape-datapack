# escape_island:skill/mother_rotsense  —  腐臭感知: 全图幸存者轮廓 3s
advancement revoke @s only escape_island:skill/mother_rotsense
execute if score @s cd_mother_rotsense matches 1.. run return 0

scoreboard players set @s cd_mother_rotsense 60
effect give @a[tag=role.survivor] minecraft:glowing 3 0 true
playsound minecraft:entity.spider.ambient master @a ~ ~ ~ 0.5 0.3

# Global exposure alert
tellraw @a {"text":"§7一股腐臭的气息弥漫开来……","color":"gray","italic":true}
