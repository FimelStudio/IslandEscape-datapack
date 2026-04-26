tag @s remove slide_blocked
tag @s remove slide_falling
tag @s remove slide_falling_small

$execute rotated as @s on vehicle positioned as @s if entity @s[type=minecraft:silverfish,tag=slide_vehicle] unless block ^ ^0.25 ^$(speed) #skill:slide_passable on passengers if entity @s[type=minecraft:player,tag=sliding] run tag @s add slide_blocked
$execute rotated as @s on vehicle positioned as @s if entity @s[type=minecraft:silverfish,tag=slide_vehicle] unless block ^ ^1.25 ^$(speed) #skill:slide_passable on passengers if entity @s[type=minecraft:player,tag=sliding] run tag @s add slide_blocked

$execute rotated as @s on vehicle positioned as @s if entity @s[type=minecraft:silverfish,tag=slide_vehicle] if block ^ ^-0.1 ^$(speed) #skill:slide_passable if block ^ ^-0.35 ^$(speed) #skill:slide_passable on passengers if entity @s[type=minecraft:player,tag=sliding] run tag @s add slide_falling
$execute rotated as @s on vehicle positioned as @s if entity @s[type=minecraft:silverfish,tag=slide_vehicle] if block ^ ^-0.1 ^$(speed) #skill:slide_passable unless block ^ ^-0.35 ^$(speed) #skill:slide_passable if block ^ ^-0.12 ^$(speed) #skill:slide_passable on passengers if entity @s[type=minecraft:player,tag=sliding] run tag @s add slide_falling_small

execute if entity @s[tag=slide_blocked] run function skill:slide_tackle/slide_2
$execute if entity @s[tag=sliding,tag=slide_falling] unless entity @s[tag=slide_blocked] rotated as @s rotated ~ 0 on vehicle positioned as @s if entity @s[type=minecraft:silverfish,tag=slide_vehicle] run tp @s ^ ^-0.35 ^$(speed)
$execute if entity @s[tag=sliding,tag=slide_falling_small] unless entity @s[tag=slide_blocked] rotated as @s rotated ~ 0 on vehicle positioned as @s if entity @s[type=minecraft:silverfish,tag=slide_vehicle] run tp @s ^ ^-0.12 ^$(speed)
$execute if entity @s[tag=sliding,tag=!slide_falling,tag=!slide_falling_small] unless entity @s[tag=slide_blocked] rotated as @s rotated ~ 0 on vehicle positioned as @s if entity @s[type=minecraft:silverfish,tag=slide_vehicle] run tp @s ^ ^ ^$(speed)
