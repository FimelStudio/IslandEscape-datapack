scoreboard players remove @a[tag=ie.active,scores={skill.sniper_cd=1..}] skill.sniper_cd 1
scoreboard players remove @a[tag=ie.active,scores={skill.sniper_bolt=1..}] skill.sniper_bolt 1
tag @a[tag=ie.active,tag=sniper.bolting,scores={skill.sniper_bolt=..0}] remove sniper.bolting
execute as @a[tag=ie.active,tag=sniper.zooming] unless items entity @s weapon.mainhand minecraft:spyglass[minecraft:custom_data~{weapon:"sniper"}] run tag @s remove sniper.zooming
execute as @a[tag=ie.active,scores={skill.sniper_bolt=1..}] run title @s actionbar {"text":"SP-1 拉栓中","color":"aqua"}
scoreboard players remove @a[tag=ie.active,tag=skill.sniper.reloading,scores={skill.sniper_reload=1..}] skill.sniper_reload 1
execute as @a[tag=ie.active,tag=skill.sniper.reloading,scores={skill.sniper_reload=0}] run function skill:weapon/sniper/reload_finish
