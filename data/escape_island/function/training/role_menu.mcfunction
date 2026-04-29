tag @s add state.training
tellraw @s {"text":"\n=== 训练职业选择 ===","color":"light_purple","bold":true}
tellraw @s [{"text":"[船医]","color":"aqua","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:training/choose_doctor"}},{"text":" 解毒针","color":"gray"}]
tellraw @s [{"text":"[船长]","color":"yellow","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:training/choose_captain"}},{"text":" 哨子","color":"gray"}]
tellraw @s [{"text":"[工程师]","color":"gold","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:training/choose_engineer"}},{"text":" 微型电池","color":"gray"}]
tellraw @s [{"text":"[海军陆战队员]","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:training/choose_marine"}},{"text":" 压制射击 + 枪械精通","color":"gray"}]
tellraw @s [{"text":"[厨师]","color":"green","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:training/choose_chef"}},{"text":" 热汤 + 夜视","color":"gray"}]
tellraw @s [{"text":"[通讯员]","color":"dark_aqua","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:training/choose_radio"}},{"text":" 信号扫描 + 职业识别","color":"gray"}]
tellraw @s [{"text":"[病毒学家]","color":"dark_green","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:training/choose_virologist"}},{"text":" 检测剂 + 金色粒子","color":"gray"}]
tellraw @s [{"text":"[机修工]","color":"gray","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:training/choose_mechanic"}},{"text":" 机关陷阱","color":"gray"}]
tellraw @s [{"text":"[运动员]","color":"white","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:training/choose_athlete"}},{"text":" 肾上腺素 + 滑铲","color":"gray"}]
tellraw @s [{"text":"[神父]","color":"yellow","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:training/choose_priest"}},{"text":" 十字架 + 净化","color":"gray"}]
tellraw @s [{"text":"[刷测试人偶]","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/spawn_dummies"}},{"text":"  | ","color":"dark_gray"},{"text":"[退出训练]","color":"gray","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:training/reset"}}]
