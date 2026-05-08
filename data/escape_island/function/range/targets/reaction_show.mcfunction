tag @s remove range.reaction.hidden
scoreboard players set @s range_target_state 60
data merge entity @s {Invisible:0b,CustomNameVisible:1b,Glowing:1b}
particle minecraft:dust{color:[1.0,0.15,0.08],scale:1.2} ~ ~1 ~ 0.25 0.45 0.25 0.02 18 force @a[distance=..32]
playsound minecraft:block.note_block.hat player @a[tag=range.active,distance=..64] ~ ~ ~ 0.7 1.7
