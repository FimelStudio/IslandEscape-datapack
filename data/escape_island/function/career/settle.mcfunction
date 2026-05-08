execute as @a run function escape_island:career/mvp/compute_scores
function escape_island:career/mvp/select_global
execute as @a run function escape_island:career/award_xp
execute as @a run function escape_island:career/award_mastery
execute as @a run function escape_island:career/update_level
tellraw @a {"text":"===== 本局贡献结算 =====","color":"gold","bold":true}
execute as @a run tellraw @s [{"text":"生涯 XP: ","color":"gold"},{"score":{"name":"@s","objective":"career_xp"}},{"text":" | 等级 "},{"score":{"name":"@s","objective":"career_level"}},{"text":" | 本局 MVP 分 "},{"score":{"name":"@s","objective":"mvp_score"}}]
