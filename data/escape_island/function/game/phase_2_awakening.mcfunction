
execute if score $game cur_phase matches 2 run return 0
scoreboard players set $game cur_phase 2

function escape_island:game/pick_mother

execute if score $game player_count matches 17.. run function escape_island:game/pick_latent_host

bossbar set escape_island:phase name {"text":"第 2 阶段: 幸存者结伴观察 / 母体伪装感染","color":"yellow"}
tellraw @a {"text":"[第 2 阶段] §e觉醒§r — 危险开始了。岛上出现了不对劲的迹象。","color":"yellow"}
playsound minecraft:block.beacon.activate master @a ~ ~ ~ 1 0.8
tellraw @a {"text":"柯尔文不见了——他去找救援了？还是……","color":"gray","italic":true}
playsound minecraft:entity.enderman.teleport ambient @a ~ ~ ~ 0.5 0.5
scoreboard players set $game p2_ambient_cd 10

