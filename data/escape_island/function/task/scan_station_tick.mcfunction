tag @e[type=minecraft:marker,tag=scan.station] remove scan.station

tag @e[type=minecraft:marker,tag=marker.scan_station] add scan.station
tag @e[type=minecraft:marker,tag=marker.signal_core] add scan.station
tag @e[type=minecraft:marker,tag=marker.lab_terminal] add scan.station
tag @e[type=minecraft:marker,tag=marker.ship_dock] add scan.station

execute as @e[type=minecraft:marker,tag=scan.station,scores={scan_station_cd=1..}] run scoreboard players remove @s scan_station_cd 1
execute as @e[type=minecraft:marker,tag=scan.station,scores={scan_active=1..}] run function escape_island:scan/tick

execute unless entity @e[type=minecraft:marker,tag=scan.station,scores={scan_active=1..},limit=1] run bossbar set escape_island:scan visible false
