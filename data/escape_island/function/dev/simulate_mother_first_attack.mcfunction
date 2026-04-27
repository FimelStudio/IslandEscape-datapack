# escape_island:dev/simulate_mother_first_attack  —  single-player test hook for first-attack reveal
execute unless entity @s[tag=role.mother] run tellraw @s {"text":"[DEV] 先点击 [设为母体] 再模拟首攻。","color":"red"}
execute unless entity @s[tag=role.mother] run return 0
function escape_island:interaction/_mother_first_attack
