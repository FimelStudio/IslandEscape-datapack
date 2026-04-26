tag @s remove slide_blocked

$execute rotated as @s on vehicle positioned as @s if entity @s[type=minecraft:silverfish,tag=slide_vehicle] unless block ^ ^0.25 ^$(speed) #skill:slide_passable on passengers if entity @s[type=minecraft:player,tag=sliding] run tag @s add slide_blocked
$execute rotated as @s on vehicle positioned as @s if entity @s[type=minecraft:silverfish,tag=slide_vehicle] unless block ^ ^1.25 ^$(speed) #skill:slide_passable on passengers if entity @s[type=minecraft:player,tag=sliding] run tag @s add slide_blocked

execute if entity @s[tag=slide_blocked] run function skill:slide_tackle/slide_2
$execute if entity @s[tag=sliding] unless entity @s[tag=slide_blocked] rotated as @s rotated ~ 0 on vehicle positioned as @s if entity @s[type=minecraft:silverfish,tag=slide_vehicle] run tp @s ^ ^ ^$(speed)
