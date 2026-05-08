scoreboard players remove @s skill.rifle_mag 1
scoreboard players set @s skill.rifle_fire_cd 3

playsound minecraft:entity.generic.explode master @a[distance=..28] ~ ~ ~ 0.6 1.35
execute anchored eyes positioned ^ ^ ^20 as @e[tag=infected.common,tag=!state.dead,distance=..3,sort=nearest,limit=1] run damage @s 4 minecraft:generic
execute anchored eyes positioned ^ ^ ^20 as @e[tag=infected.mother,tag=!state.dead,distance=..3,sort=nearest,limit=1] run damage @s 3 minecraft:generic
execute anchored eyes positioned ^ ^ ^20 run particle minecraft:crit ~ ~ ~ 0.3 0.3 0.3 0.05 5 force @a[distance=..28]

title @s actionbar [{"text":"SR-17  ","color":"green"},{"score":{"name":"@s","objective":"skill.rifle_mag"}},{"text":"/30","color":"dark_gray"}]

execute if score @s skill.rifle_mag matches ..0 run function skill:weapon/rifle/reload_start
