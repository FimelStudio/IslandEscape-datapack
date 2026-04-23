tag @s add sliding
tellraw @s {"text":"Slide",color:green}

summon minecart ~ ~ ~ {Motion:[0.0d,0.0d,0.0d],Invulnerable:1b,Silent:1b}
execute as @s at @s run ride @s mount @e[type=minecart,limit=1,sort=nearest]
