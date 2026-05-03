playsound minecraft:entity.player.attack.weak player @a[distance=..16] ~ ~ ~ 1 1.3
tellraw @s [{"text":"[模拟] 擦刀！母体攻击冷却中，未命中","color":"gray"},{"text":" (剩余 ","color":"gray"},{"score":{"name":"$dev","objective":"mother_hit_cd"}},{"text":" tick)","color":"gray"}]
