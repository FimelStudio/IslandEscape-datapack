scoreboard players operation #spawn_target skill.clicker_cfg = @s skill.clicker_target_id
tag @s remove entity.clicker_spore_pending
tag @s add entity.clicker_spore
tag @s add skill.clicker_spore.new
function skill:clicker/hearing_spore/init_spore
playsound minecraft:block.fungus.place master @a[distance=..24] ~ ~ ~ 0.7 1.3
particle minecraft:spore_blossom_air ~ ~ ~ 0.35 0.35 0.35 0.04 16 force @a[distance=..32]
