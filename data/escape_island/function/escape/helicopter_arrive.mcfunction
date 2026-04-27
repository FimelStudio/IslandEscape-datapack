tellraw @a {"text":"§6[直升机] 已降落！30 秒内上机！","color":"gold"}
playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 1 0.5

scoreboard players set $game heli_countdown -600

schedule function escape_island:escape/_helicopter_depart 600t
