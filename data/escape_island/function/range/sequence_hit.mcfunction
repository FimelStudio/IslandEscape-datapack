scoreboard players add @a[tag=skill.pistol.shooter,tag=range.active,limit=1] range_score 15
scoreboard players add @a[tag=skill.ak47.shooter,tag=range.active,limit=1] range_score 15
scoreboard players add @a[tag=skill.pistol.shooter,tag=range.active,limit=1] range_hits 1
scoreboard players add @a[tag=skill.ak47.shooter,tag=range.active,limit=1] range_hits 1
scoreboard players add @a[tag=skill.pistol.shooter,tag=range.active,limit=1] range_combo 1
scoreboard players add @a[tag=skill.ak47.shooter,tag=range.active,limit=1] range_combo 1
scoreboard players add @a[tag=skill.pistol.shooter,tag=range.active,limit=1] range_seq 1
scoreboard players add @a[tag=skill.ak47.shooter,tag=range.active,limit=1] range_seq 1
particle minecraft:dust{color:[0.2,0.9,1.0],scale:1.0} ~ ~1 ~ 0.25 0.45 0.25 0.02 18 force @a[distance=..32]
playsound minecraft:block.note_block.pling player @a[tag=range.active,distance=..64] ~ ~ ~ 0.8 1.8
execute if entity @s[tag=range.seq.5] run scoreboard players add @a[tag=skill.pistol.shooter,tag=range.active,limit=1] range_score 30
execute if entity @s[tag=range.seq.5] run scoreboard players add @a[tag=skill.ak47.shooter,tag=range.active,limit=1] range_score 30
execute if entity @s[tag=range.seq.5] run title @a[tag=skill.pistol.shooter,tag=range.active,limit=1] actionbar {"text":"序列全中！+30","color":"aqua"}
execute if entity @s[tag=range.seq.5] run title @a[tag=skill.ak47.shooter,tag=range.active,limit=1] actionbar {"text":"序列全中！+30","color":"aqua"}
execute if entity @s[tag=range.seq.1] run tag @e[tag=range.seq.2,limit=1] add range.seq.current
execute if entity @s[tag=range.seq.1] run data merge entity @e[tag=range.seq.2,limit=1] {CustomName:'{"text":"序列 2","color":"aqua"}'}
execute if entity @s[tag=range.seq.2] run tag @e[tag=range.seq.3,limit=1] add range.seq.current
execute if entity @s[tag=range.seq.2] run data merge entity @e[tag=range.seq.3,limit=1] {CustomName:'{"text":"序列 3","color":"aqua"}'}
execute if entity @s[tag=range.seq.3] run tag @e[tag=range.seq.4,limit=1] add range.seq.current
execute if entity @s[tag=range.seq.3] run data merge entity @e[tag=range.seq.4,limit=1] {CustomName:'{"text":"序列 4","color":"aqua"}'}
execute if entity @s[tag=range.seq.4] run tag @e[tag=range.seq.5,limit=1] add range.seq.current
execute if entity @s[tag=range.seq.4] run data merge entity @e[tag=range.seq.5,limit=1] {CustomName:'{"text":"序列 5","color":"aqua"}'}
kill @s
execute unless entity @e[tag=range.target.sequence,limit=1] run function escape_island:range/targets/sequence_targets
