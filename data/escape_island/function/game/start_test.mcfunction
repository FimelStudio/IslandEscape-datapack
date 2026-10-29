# 测试仅覆盖人数来源与额外补给，其他初始化与正式局完全一致。
execute if score $game in_game matches 1 run return 0
execute unless score $game dev_mode matches 1 run function escape_island:util/recount_players
execute if score $game player_count matches ..3 run return 0
function escape_island:game/initialize
give @a minecraft:string[custom_data={item:"cable"},custom_name={text:"线缆",color:"yellow",bold:true,italic:false},lore=[{text:"手持靠近信号塔自动修复",color:"gray",italic:false}]] 1
give @a minecraft:gold_ingot[custom_data={item:"fuel_cell"},custom_name={text:"燃料电池",color:"gold",bold:true,italic:false},lore=[{text:"对着发电机右键投入燃料",color:"gray",italic:false}],consumable={animation:"spyglass",consume_seconds:999,has_consume_particles:false,sound:{sound_id:""}},use_cooldown={seconds:0.1,cooldown_group:"escape_island:generator_use"}] 3
function escape_island:dev/show_markers
