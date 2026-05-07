tag @s remove skill.clicker_spore.pending_new
scoreboard players operation @s skill.clicker_target_id = #spawn_target skill.clicker_cfg
scoreboard players operation @s skill.clicker_spore_delay = #release_delay skill.clicker_cfg
particle minecraft:spore_blossom_air ~ ~ ~ 0.18 0.18 0.18 0.01 6 force @a[distance=..24]
