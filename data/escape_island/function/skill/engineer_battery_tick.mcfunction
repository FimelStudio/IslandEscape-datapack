# tick the battery timer; kill when expired
scoreboard players remove $battery_timer gen_progress 1
execute if score $battery_timer gen_progress matches ..0 run kill @e[tag=entity.engineer_battery]
