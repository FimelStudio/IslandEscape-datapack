目的
- 验证开局船舶部件是否按本次实现分散注入物资箱（marker.loot_basic），并验证 4 人局部件需求与修船流程。

快速一步到位（单人操作）
1. 在游戏中打开自测菜单：运行 `/function escape_island:test/menu` 或点击自测菜单按钮。
2. 点击菜单中的 `[测试：轮船4人验收]`（或运行 `/function escape_island:test/ship_route_4p_acceptance`）。
   - 本函数会临时将 `$game player_count` 设为 4 并执行 `escape_island:game/start_test`。
3. 等待提示，查看聊天反馈：会输出本局 `tunable.ship_parts_required`（预期为 3）与已标记的分散部件点数量（预期 >=3）。

手动验证（命令辅助）
- 查看船舶所需部件数：
  - `/scoreboard players get Tunable tunable.ship_parts_required`
- 查看当前投入的部件数：
  - `/scoreboard players get $game ship_parts`
- 查看分散部位标记数量（可用于判断是否已注入不同箱子）：
  - `/execute as @e[type=minecraft:marker,tag=marker.ship_part_slot] run say marker` （或使用 `function escape_island:debug/show_state` 查看测试信息）

流程验证要点
- 自测入口应在菜单出现，点击即可准备 4 人开局并提示分散点数量。
- 前往任意物资箱（普通物资点 `marker.loot_basic`）并开箱，检查是否拿到带 `custom_data:{item:"ship_part"}` 的部件。
- 收集足够部件并前往船坞，按常规修船流程投入部件，观察 `ship_parts` 与 `ship_progress` 的变化；最终应能触发船体修复结算逻辑。

回滚/调试
- 若需要清理本次放置的 marker：执行 `/function escape_island:dev/clear_markers`。
- 若要重新放置开发标记（含扫描站）：执行 `/function escape_island:dev/setup_markers`，然后再次运行自测。

文件参考
- 自测菜单： [data/escape_island/function/test/menu.mcfunction](data/escape_island/function/test/menu.mcfunction#L1)
- 4 人验收脚本： [data/escape_island/function/test/ship_route_4p_acceptance.mcfunction](data/escape_island/function/test/ship_route_4p_acceptance.mcfunction#L1)
- 分散实现： [data/escape_island/function/task/ship_part_scatter.mcfunction](data/escape_island/function/task/ship_part_scatter.mcfunction#L1)
