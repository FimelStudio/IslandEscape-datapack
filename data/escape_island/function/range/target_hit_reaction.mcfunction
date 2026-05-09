scoreboard players add @a[tag=range.active,distance=..64,limit=1] range_score 20
scoreboard players add @a[tag=range.active,distance=..64,limit=1] range_hits 1
scoreboard players add @a[tag=range.active,distance=..64,limit=1] range_combo 1
execute if entity @s[tag=skill.weapon.headshot_top] run title @a[tag=range.active,distance=..64,limit=1] actionbar {"text":"爆头","color":"red","bold":true}
execute if entity @s[tag=skill.weapon.headshot_top] run particle minecraft:dust{color:[1.0,0.15,0.15],scale:1.2} ~ ~1 ~ 0.3 0.5 0.3 0.03 22 force @a[distance=..32]
execute unless entity @s[tag=skill.weapon.headshot_top] run particle minecraft:dust{color:[1.0,0.2,0.1],scale:1.2} ~ ~1 ~ 0.3 0.5 0.3 0.03 22 force @a[distance=..32]
execute if entity @s[tag=skill.weapon.headshot_top] run playsound minecraft:block.note_block.pling player @a[tag=range.active,distance=..64] ~ ~ ~ 0.9 2.0
execute unless entity @s[tag=skill.weapon.headshot_top] run playsound minecraft:block.note_block.pling player @a[tag=range.active,distance=..64] ~ ~ ~ 0.9 1.5
tag @s remove skill.weapon.headshot_top
tag @s remove skill.weapon.headshot_mid
tag @s remove skill.weapon.headshot_bot
kill @s
kill @s
