# escape_island:game/phase_2_awakening  —  Phase 2 (觉醒, PvP 开启)

execute if score $game cur_phase matches 2 run return 0
scoreboard players set $game cur_phase 2

# Select Mother (silently)
function escape_island:game/pick_mother

# Select Latent Host for 17+ player games
execute if score $game player_count matches 17.. run function escape_island:game/pick_latent_host

# Enable PvP — mother is in mother_hidden team (green, looks like survivor), can attack survivors
gamerule pvp true

# Broadcast phase change + narrative
tellraw @a {"text":"[第 2 阶段] §e觉醒§r — 危险开始了。岛上出现了不对劲的迹象。","color":"yellow"}
playsound minecraft:block.beacon.activate master @a ~ ~ ~ 1 0.8
tellraw @a {"text":"柯尔文……不见了。","color":"gray","italic":true}
playsound minecraft:entity.enderman.teleport ambient @a ~ ~ ~ 0.5 0.5

# Priest T+3:00 message scheduled via scoreboard check in tick_priest
