advancement revoke @s only skill:common/medkit
effect give @s minecraft:instant_health 1 0 true
playsound minecraft:entity.player.burp player @s ~ ~ ~ 0.6 1.2
tellraw @s {"text":"使用急救包，回复 4HP","color":"red"}
