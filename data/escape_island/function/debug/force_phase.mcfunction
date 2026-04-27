# escape_island:debug/force_phase  —  force a phase transition
# Usage: /function escape_island:debug/force_phase  (then set cur_phase manually)
# Quick shortcuts:
# scoreboard players set $game cur_phase 3  -> jump to repair phase
# scoreboard players set $game cur_phase 4  -> jump to escape phase
tellraw @s {"text":"§e[DEBUG] 手动设置: scoreboard players set $game cur_phase <1-5>","color":"yellow"}
