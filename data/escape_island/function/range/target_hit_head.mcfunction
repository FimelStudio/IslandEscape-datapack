execute unless entity @a[tag=range.active,distance=..64,limit=1] run return 0
scoreboard players set #hit skill.pistol_tmp 1
scoreboard players set #hit skill.ak47_tmp 1

execute as @a[tag=skill.pistol.shooter,limit=1] run title @s times 0 5 5
execute as @a[tag=skill.pistol.shooter,limit=1] run title @s title {"text":"\uE001","font":"ie:hud","color":"red","shadow_color":0}
execute as @a[tag=skill.ak47.shooter,limit=1] run title @s times 0 5 5
execute as @a[tag=skill.ak47.shooter,limit=1] run title @s title {"text":"\uE001","font":"ie:hud","color":"red","shadow_color":0}

execute if entity @s[tag=range.target.sequence,tag=!range.seq.current] run function escape_island:range/sequence_wrong
execute if entity @s[tag=range.target.sequence,tag=!range.seq.current] run return 0
execute if entity @s[tag=range.target.sequence,tag=range.seq.current] run function escape_island:range/sequence_hit
execute if entity @s[tag=range.target.sequence] run return 0

playsound minecraft:entity.experience_orb.pickup master @a[tag=range.active,distance=..64] ~ ~ ~ 0.7 0.8
playsound minecraft:entity.arrow.hit_player master @a[tag=range.active,distance=..64] ~ ~ ~ 1.0 1.5 0

title @a[tag=range.active,distance=..64,limit=1] actionbar {"text":"爆头","color":"red","bold":true}
execute if entity @s[tag=range.target.static] run function escape_island:range/target_hit_static
execute if entity @s[tag=range.target.moving] run function escape_island:range/target_hit_moving
execute if entity @s[tag=range.target.reaction] run function escape_island:range/target_hit_reaction