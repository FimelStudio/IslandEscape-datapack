# @s 从幸存者转化：保留原职业供感染能力使用，然后移除现役职业。
function escape_island:role/retain_current
execute if entity @s[tag=role.radio] run scoreboard players set @s skill.forger_passive_cd 45
execute if entity @s[tag=role.radio] run scoreboard players set @s skill.forger_uses 0
function escape_island:role/clear
