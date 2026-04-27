tag @s remove slide_blocked
tag @s remove slide_falling
tag @s remove slide_falling_small
tag @s remove slide_moved
tag @s remove slide_drop_113
tag @s remove slide_drop_100
tag @s remove slide_drop_083
tag @s remove slide_drop_064
tag @s remove slide_drop_044
tag @s remove slide_drop_030
tag @s remove slide_drop_015
tag @s remove slide_drop_008

$execute rotated as @s rotated ~ 0 on vehicle positioned as @s if entity @s[type=minecraft:silverfish,tag=slide_vehicle] unless block ^ ^0.25 ^$(speed) #skill:slide_passable on passengers if entity @s[type=minecraft:player,tag=sliding] run tag @s add slide_blocked
$execute rotated as @s rotated ~ 0 on vehicle positioned as @s if entity @s[type=minecraft:silverfish,tag=slide_vehicle] unless block ^ ^1.25 ^$(speed) #skill:slide_head_passable on passengers if entity @s[type=minecraft:player,tag=sliding] run tag @s add slide_blocked

$execute rotated as @s rotated ~ 0 on vehicle positioned as @s if entity @s[type=minecraft:silverfish,tag=slide_vehicle] if block ^ ^-0.1 ^$(speed) #skill:slide_passable if block ^ ^-0.35 ^$(speed) #skill:slide_passable on passengers if entity @s[type=minecraft:player,tag=sliding] run tag @s add slide_falling
$execute rotated as @s rotated ~ 0 on vehicle positioned as @s if entity @s[type=minecraft:silverfish,tag=slide_vehicle] if block ^ ^-0.1 ^$(speed) #skill:slide_passable unless block ^ ^-0.35 ^$(speed) #skill:slide_passable if block ^ ^-0.12 ^$(speed) #skill:slide_passable on passengers if entity @s[type=minecraft:player,tag=sliding] run tag @s add slide_falling_small

execute if entity @s[tag=slide_falling] run scoreboard players remove @s skill.slide_fall 80
execute if entity @s[tag=slide_falling] run scoreboard players operation @s skill.slide_fall *= #drag skill.slide_fall
execute if entity @s[tag=slide_falling] run scoreboard players operation @s skill.slide_fall /= #hundred skill.slide_fall
execute if entity @s[tag=slide_falling] if score @s skill.slide_fall < #max_fall skill.slide_fall run scoreboard players operation @s skill.slide_fall = #max_fall skill.slide_fall
execute if entity @s[tag=!slide_falling] run scoreboard players set @s skill.slide_fall 0

execute if entity @s[tag=slide_blocked] run function skill:athlete/slide_tackle/slide_2

$execute if entity @s[tag=sliding,tag=slide_falling,tag=!slide_moved] unless entity @s[tag=slide_blocked] if score @s skill.slide_fall matches ..-1130 rotated as @s rotated ~ 0 on vehicle positioned as @s if entity @s[type=minecraft:silverfish,tag=slide_vehicle] if block ^ ^-1.13 ^$(speed) #skill:slide_passable on passengers if entity @s[type=minecraft:player,tag=sliding] run tag @s add slide_drop_113
execute if entity @s[tag=slide_drop_113] run tag @s add slide_moved
$execute if entity @s[tag=slide_drop_113] rotated as @s rotated ~ 0 on vehicle positioned as @s if entity @s[type=minecraft:silverfish,tag=slide_vehicle] run tp @s ^ ^-1.13 ^$(speed)

$execute if entity @s[tag=sliding,tag=slide_falling,tag=!slide_moved] unless entity @s[tag=slide_blocked] if score @s skill.slide_fall matches ..-1000 rotated as @s rotated ~ 0 on vehicle positioned as @s if entity @s[type=minecraft:silverfish,tag=slide_vehicle] if block ^ ^-1.00 ^$(speed) #skill:slide_passable on passengers if entity @s[type=minecraft:player,tag=sliding] run tag @s add slide_drop_100
execute if entity @s[tag=slide_drop_100] run tag @s add slide_moved
$execute if entity @s[tag=slide_drop_100] rotated as @s rotated ~ 0 on vehicle positioned as @s if entity @s[type=minecraft:silverfish,tag=slide_vehicle] run tp @s ^ ^-1.00 ^$(speed)

$execute if entity @s[tag=sliding,tag=slide_falling,tag=!slide_moved] unless entity @s[tag=slide_blocked] if score @s skill.slide_fall matches ..-830 rotated as @s rotated ~ 0 on vehicle positioned as @s if entity @s[type=minecraft:silverfish,tag=slide_vehicle] if block ^ ^-0.83 ^$(speed) #skill:slide_passable on passengers if entity @s[type=minecraft:player,tag=sliding] run tag @s add slide_drop_083
execute if entity @s[tag=slide_drop_083] run tag @s add slide_moved
$execute if entity @s[tag=slide_drop_083] rotated as @s rotated ~ 0 on vehicle positioned as @s if entity @s[type=minecraft:silverfish,tag=slide_vehicle] run tp @s ^ ^-0.83 ^$(speed)

$execute if entity @s[tag=sliding,tag=slide_falling,tag=!slide_moved] unless entity @s[tag=slide_blocked] if score @s skill.slide_fall matches ..-640 rotated as @s rotated ~ 0 on vehicle positioned as @s if entity @s[type=minecraft:silverfish,tag=slide_vehicle] if block ^ ^-0.64 ^$(speed) #skill:slide_passable on passengers if entity @s[type=minecraft:player,tag=sliding] run tag @s add slide_drop_064
execute if entity @s[tag=slide_drop_064] run tag @s add slide_moved
$execute if entity @s[tag=slide_drop_064] rotated as @s rotated ~ 0 on vehicle positioned as @s if entity @s[type=minecraft:silverfish,tag=slide_vehicle] run tp @s ^ ^-0.64 ^$(speed)

$execute if entity @s[tag=sliding,tag=slide_falling,tag=!slide_moved] unless entity @s[tag=slide_blocked] if score @s skill.slide_fall matches ..-440 rotated as @s rotated ~ 0 on vehicle positioned as @s if entity @s[type=minecraft:silverfish,tag=slide_vehicle] if block ^ ^-0.44 ^$(speed) #skill:slide_passable on passengers if entity @s[type=minecraft:player,tag=sliding] run tag @s add slide_drop_044
execute if entity @s[tag=slide_drop_044] run tag @s add slide_moved
$execute if entity @s[tag=slide_drop_044] rotated as @s rotated ~ 0 on vehicle positioned as @s if entity @s[type=minecraft:silverfish,tag=slide_vehicle] run tp @s ^ ^-0.44 ^$(speed)

$execute if entity @s[tag=sliding,tag=slide_falling,tag=!slide_moved] unless entity @s[tag=slide_blocked] if score @s skill.slide_fall matches ..-300 rotated as @s rotated ~ 0 on vehicle positioned as @s if entity @s[type=minecraft:silverfish,tag=slide_vehicle] if block ^ ^-0.30 ^$(speed) #skill:slide_passable on passengers if entity @s[type=minecraft:player,tag=sliding] run tag @s add slide_drop_030
execute if entity @s[tag=slide_drop_030] run tag @s add slide_moved
$execute if entity @s[tag=slide_drop_030] rotated as @s rotated ~ 0 on vehicle positioned as @s if entity @s[type=minecraft:silverfish,tag=slide_vehicle] run tp @s ^ ^-0.30 ^$(speed)

$execute if entity @s[tag=sliding,tag=slide_falling,tag=!slide_moved] unless entity @s[tag=slide_blocked] if score @s skill.slide_fall matches ..-150 rotated as @s rotated ~ 0 on vehicle positioned as @s if entity @s[type=minecraft:silverfish,tag=slide_vehicle] if block ^ ^-0.15 ^$(speed) #skill:slide_passable on passengers if entity @s[type=minecraft:player,tag=sliding] run tag @s add slide_drop_015
execute if entity @s[tag=slide_drop_015] run tag @s add slide_moved
$execute if entity @s[tag=slide_drop_015] rotated as @s rotated ~ 0 on vehicle positioned as @s if entity @s[type=minecraft:silverfish,tag=slide_vehicle] run tp @s ^ ^-0.15 ^$(speed)

$execute if entity @s[tag=sliding,tag=slide_falling,tag=!slide_moved] unless entity @s[tag=slide_blocked] if score @s skill.slide_fall matches ..-1 rotated as @s rotated ~ 0 on vehicle positioned as @s if entity @s[type=minecraft:silverfish,tag=slide_vehicle] if block ^ ^-0.08 ^$(speed) #skill:slide_passable on passengers if entity @s[type=minecraft:player,tag=sliding] run tag @s add slide_drop_008
execute if entity @s[tag=slide_drop_008] run tag @s add slide_moved
$execute if entity @s[tag=slide_drop_008] rotated as @s rotated ~ 0 on vehicle positioned as @s if entity @s[type=minecraft:silverfish,tag=slide_vehicle] run tp @s ^ ^-0.08 ^$(speed)

$execute if entity @s[tag=sliding,tag=slide_falling,tag=!slide_moved] unless entity @s[tag=slide_blocked] run function skill:athlete/slide_tackle/move_horizontal {speed:"$(speed)"}
$execute if entity @s[tag=sliding,tag=slide_falling_small] unless entity @s[tag=slide_blocked] rotated as @s rotated ~ 0 on vehicle positioned as @s if entity @s[type=minecraft:silverfish,tag=slide_vehicle] run tp @s ^ ^-0.12 ^$(speed)
$execute if entity @s[tag=sliding,tag=!slide_falling,tag=!slide_falling_small] unless entity @s[tag=slide_blocked] run function skill:athlete/slide_tackle/move_horizontal {speed:"$(speed)"}
