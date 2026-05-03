tellraw @s {"text":"\n=== 感染与死亡状态机测试 ===","color":"dark_red","bold":true}
tellraw @s [{"text":"[设为幸存者]","color":"green","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:dev/as_survivor"}},{"text":" 基础幸存者状态，spore_threshold=100","color":"gray"}]
tellraw @s [{"text":"[设为神父]","color":"white","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:dev/as_priest"}},{"text":" 测十字架阻断","color":"gray"}]
tellraw @s [{"text":"[设为感染者]","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:dev/as_infected"}},{"text":" 测感染者死亡/复活","color":"gray"}]
tellraw @s [{"text":"[设为母体]","color":"dark_red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:dev/as_mother"}},{"text":" 80HP攻击4，测母体属性","color":"gray"}]
tellraw @s [{"text":"[刷测试人偶]","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:test/spawn_dummies"}},{"text":" 在身边生成幸存者/感染者/母体人偶","color":"gray"}]
tellraw @s {"text":""}
tellraw @s [{"text":"[+35污染]","color":"yellow","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:dev/add_spore_35"}},{"text":" 感染者命中量","color":"gray"}]
tellraw @s [{"text":"[+40污染]","color":"gold","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:dev/add_spore_40"}},{"text":" 母体有效命中量×1。3次≥120→感染期","color":"gray"}]
tellraw @s [{"text":"[强制感染期]","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:infection/force_infect"}},{"text":" 直接进入感染期，actionbar显示转化倒计时","color":"gray"}]
tellraw @s [{"text":"[治愈自己]","color":"aqua","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:infection/cure"}},{"text":" 清除感染期","color":"gray"}]
tellraw @s {"text":""}
tellraw @s [{"text":"[模拟母体有效命中]","color":"dark_red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:dev/simulate_mother_hit"}},{"text":" 单人测试攻击冷却：第1下有效+40孢子，2.5s内再点→擦刀音效","color":"gray"}]
tellraw @s [{"text":"[清理母体模拟器]","color":"gray","bold":true,"click_event":{"action":"run_command","command":"/kill @e[tag=dev.mother_sim]"}},{"text":" 重置母体冷却模拟状态","color":"gray"}]
tellraw @s {"text":""}
tellraw @s [{"text":"[模拟幸存者死亡]","color":"dark_red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:infection/survivor_death"}},{"text":" 15秒孢化后转感染者","color":"gray"}]
tellraw @s [{"text":"[模拟感染者死亡]","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:infection/infected_death"}},{"text":" 母体存活→复活；母体已死→永久倒下","color":"gray"}]
tellraw @s [{"text":"[模拟母体死亡]","color":"dark_red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:dev/simulate_mother_death"}},{"text":" 不再复活，全图母巢崩坏。==母体\"则真死；否则仅设母体已亡标记","color":"gray"}]
tellraw @s [{"text":"[模拟母体首攻]","color":"dark_red","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:dev/simulate_mother_first_attack"}},{"text":" 验证首攻广播仅触发一次","color":"gray"}]
tellraw @s {"text":""}
tellraw @s [{"text":"[查看状态]","color":"yellow","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:debug/show_state"}},{"text":" 查看污染/感染/孢化/复活计时","color":"gray"}]
tellraw @s [{"text":"[触发清剿胜利]","color":"green","bold":true,"click_event":{"action":"run_command","command":"/function escape_island:game/end_purge"}},{"text":" 直接触发幸存者清剿胜利结局","color":"gray"}]
