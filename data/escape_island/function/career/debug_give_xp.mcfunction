scoreboard players add @s career_xp 100
function escape_island:career/update_level
tellraw @s [{"text":"[DEBUG] 生涯 XP +100，当前等级 ","color":"gold"},{"score":{"name":"@s","objective":"career_level"}}]
