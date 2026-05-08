execute unless entity @a[tag=skill.pistol.shooter,tag=range.active,limit=1] unless entity @a[tag=skill.ak47.shooter,tag=range.active,limit=1] run return 0
scoreboard players set #hit skill.pistol_tmp 1
scoreboard players set #hit skill.ak47_tmp 1
execute if entity @s[tag=range.target.sequence,tag=!range.seq.current] run function escape_island:range/sequence_wrong
execute if entity @s[tag=range.target.sequence,tag=!range.seq.current] run return 0
execute if entity @s[tag=range.target.sequence,tag=range.seq.current] run function escape_island:range/sequence_hit
execute if entity @s[tag=range.target.sequence] run return 0
execute if entity @s[tag=range.target.static] run function escape_island:range/target_hit_static
execute if entity @s[tag=range.target.moving] run function escape_island:range/target_hit_moving
execute if entity @s[tag=range.target.reaction] run function escape_island:range/target_hit_reaction
