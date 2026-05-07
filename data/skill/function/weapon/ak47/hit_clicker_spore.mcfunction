scoreboard players set #hit skill.ak47_tmp 1
scoreboard players operation @s skill.clicker_spore_hp -= #gun_damage skill.clicker_cfg
execute if score @s skill.clicker_spore_hp matches ..0 run function skill:clicker/hearing_spore/break
execute if score @s skill.clicker_spore_hp matches 1.. run particle minecraft:dust{color:[0.15,0.8,0.2],scale:0.55} ~ ~ ~ 0.18 0.18 0.18 0.01 8 force @a[distance=..18]
execute if score @s skill.clicker_spore_hp matches 1.. run playsound minecraft:block.slime_block.hit master @a[distance=..16] ~ ~ ~ 0.7 1.5
execute as @a[tag=skill.ak47.shooter,limit=1] run title @s times 0 5 5
execute as @a[tag=skill.ak47.shooter,limit=1] run title @s title {text:"\uE001",font:"ie:hud",shadow_color:0}
