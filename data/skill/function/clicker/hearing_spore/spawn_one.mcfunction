scoreboard players operation #spawn_target skill.clicker_cfg = @s skill.clicker_id
summon minecraft:marker ^ ^1.15 ^0.55 {Tags:["entity.clicker_spore_pending","skill.clicker_spore.pending_new"]}
execute as @e[type=minecraft:marker,tag=skill.clicker_spore.pending_new,distance=..1.5,sort=nearest,limit=1] at @s run function skill:clicker/hearing_spore/init_pending
