execute as @a run function escape_island:career/mvp/compute_scores
tellraw @a {"text":"===== 本局贡献（v0.1 测试，不写入生涯成长） =====","color":"gold","bold":true}
execute as @a run tellraw @s [{"text":"本局贡献分: ","color":"gold"},{"score":{"name":"@s","objective":"mvp_score"}},{"text":" | 修复 "},{"score":{"name":"@s","objective":"match_repair"}},{"text":" | 感染 "},{"score":{"name":"@s","objective":"match_infect"}},{"text":" | 撤离 "},{"score":{"name":"@s","objective":"match_escape"}}]
