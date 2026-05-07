function escape_island:dev/_reset_player_state
scoreboard players set $game player_count 4
function escape_island:util/apply_scaling
function escape_island:game/_make_mother
tellraw @s {"text":"[TEST] 隐藏母体：检查是否只保留变异脉冲。","color":"gold"}
execute if items entity @s container.* minecraft:phantom_membrane[minecraft:custom_data~{skill:"mother/mutate"}] run tellraw @s {"text":"[PASS] 隐藏期有变异脉冲。","color":"green"}
execute unless items entity @s container.* minecraft:phantom_membrane[minecraft:custom_data~{skill:"mother/mutate"}] run tellraw @s {"text":"[FAIL] 隐藏期没有变异脉冲。","color":"red"}
execute unless items entity @s container.* minecraft:redstone[minecraft:custom_data~{skill:"mother/rotsense"}] unless items entity @s container.* minecraft:glowstone_dust[minecraft:custom_data~{skill:"mother/howl"}] unless items entity @s container.* minecraft:red_dye[minecraft:custom_data~{skill:"mother/eat"}] run tellraw @s {"text":"[PASS] 隐藏期没有腐痕/嚎叫/吞噬。","color":"green"}
execute if items entity @s container.* minecraft:redstone[minecraft:custom_data~{skill:"mother/rotsense"}] run tellraw @s {"text":"[FAIL] 隐藏期不应出现腐痕感知。","color":"red"}
execute if items entity @s container.* minecraft:glowstone_dust[minecraft:custom_data~{skill:"mother/howl"}] run tellraw @s {"text":"[FAIL] 隐藏期不应出现集群嚎叫。","color":"red"}
execute if items entity @s container.* minecraft:red_dye[minecraft:custom_data~{skill:"mother/eat"}] run tellraw @s {"text":"[FAIL] 隐藏期不应出现吞噬。","color":"red"}
function skill:mother/mutate
tellraw @s {"text":"[TEST] 进入猎手状态：检查母体技能是否出现。","color":"gold"}
execute if items entity @s container.* minecraft:redstone[minecraft:custom_data~{skill:"mother/rotsense"}] if items entity @s container.* minecraft:glowstone_dust[minecraft:custom_data~{skill:"mother/howl"}] if items entity @s container.* minecraft:red_dye[minecraft:custom_data~{skill:"mother/eat"}] run tellraw @s {"text":"[PASS] 猎手期出现腐痕/嚎叫/吞噬。","color":"green"}
scoreboard players set @s cd_mother_hunt 1
function skill:mother/mutate/cooldown_tick
tellraw @s {"text":"[TEST] 回到隐藏：检查母体技能是否清理。","color":"gold"}
execute unless items entity @s container.* minecraft:redstone[minecraft:custom_data~{skill:"mother/rotsense"}] unless items entity @s container.* minecraft:glowstone_dust[minecraft:custom_data~{skill:"mother/howl"}] unless items entity @s container.* minecraft:red_dye[minecraft:custom_data~{skill:"mother/eat"}] run tellraw @s {"text":"[PASS] 回隐藏后腐痕/嚎叫/吞噬已清理。","color":"green"}
tellraw @s [{"text":"[返回感染测试菜单]","color":"dark_red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:dev/infection_menu"}}]
