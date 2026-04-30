execute positioned ~ ~4.0 ~ rotated 180 0 run function animated_java:helicopter/summon {args:{animation:'animation_airscrew_circle',start_animation:true}}
execute as @e[tag=aj.helicopter.root,tag=!entity.helicopter,distance=..10,sort=nearest,limit=1] run tag @s add entity.helicopter
execute unless entity @e[tag=entity.helicopter,distance=..10,limit=1] run summon minecraft:armor_stand ~ ~4.0 ~ {Tags:["entity.helicopter"],NoGravity:1b,CustomName:{"text":"直升机","color":"gold"},CustomNameVisible:1b,Invulnerable:1b}
