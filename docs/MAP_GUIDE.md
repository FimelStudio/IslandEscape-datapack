# MAP_GUIDE — 地图建造与适配指南

数据包逻辑与地图分离：本数据包不绑定特定地图，所有关键位置由 **marker 实体的 tag** 锁定。本文档告诉你拿到任何一张第三方"孤岛 / 末日"风格地图后，**如何用 30 分钟把数据包套上去**。

## 目录

1. [地图风格建议](#一地图风格建议)
2. [必需 marker 列表](#二必需-marker-列表)
3. [Step-by-step 适配流程](#三step-by-step-适配流程)
4. [分区设计（文字图）](#四分区设计文字图)
5. [物资箱密度建议](#五物资箱密度建议)
6. [调试用结构方块](#六调试用结构方块)
7. [常见问题](#七常见问题)

---

## 一、地图风格建议

满足以下条件的地图都适合套用本数据包:

- **整体范围**: 200×200 ~ 400×400 方块（更大会导致玩家分散难以汇合）
- **主题**: 海岛、丛林、废弃科研站、海港 / 沉船
- **必备区域**: 海滩 / 丛林 / 山顶 / 废弃建筑（实验室）/ 沉船码头
- **氛围**: 推荐阴沉、雾天、带电闪雷鸣环境（datapack 会强制晚上 + 雨）
- **开放度**: 不要全是迷宫式室内，至少 60% 户外（直升机降落需要空间）

### 推荐参考

- "Lost Island" / "Quarantine Z" 类 PvP 地图
- 末日生存类 SMP 地图模板
- "Bermuda Triangle" 类海难场景

### 不适合的地图

- 纯方形 PvP 竞技场（无叙事感）
- 太大（500+×500+，玩家找不到任务点）
- 主题不符（西部、中世纪等）

---

## 二、必需 marker 列表

每个 marker 实体使用 `/summon marker x y z {Tags:["<tag>"]}` 放置。坐标取该位置玩家应该交互的中心点。

| # | Tag | 数量 | 必填 | 位置说明 |
|---|---|---|---|---|
| 1 | `marker.lobby_ship` | 1 | ✅ | 海风号开始大厅；玩家进入地图后的默认位置 |
| 2 | `marker.dining_room` | 1 | ✅ | 海风号餐厅准备区；可做规则展示 / 等人 / 就餐氛围 |
| 3 | `marker.spawn_island` | 8-20 | ✅ | 正式开局分散出生点；分布在海滩、林缘、营地、残骸附近 |
| 4 | `marker.spawn_beach` | 1 | ⭕ | 旧地图兼容兜底出生点；spawn_island 不足时使用 |
| 5 | `marker.signal_tower` | 1 | ✅ | 信号塔修复点；玩家长按右键的方块上方 |
| 6 | `marker.generator` | 2-3 | ✅ | 备用发电机；放在岛屿散落点（如山洞、码头、营地） |
| 7 | `marker.heli_pad` | 4 | ✅ | 直升机降落候选点；4 个分布在岛屿四角 / 重要区域，给视野和路线变化 |
| 8 | `marker.lab_entrance` | 1 | ✅ | 实验室入口；最好在山体内或地下，进门后玩家立即在地图边缘 |
| 9 | `marker.lab_terminal` | 1 | ✅ | 实验室深处身份卡终端 |
| 10 | `marker.lab_sub` | 1 | ✅ | 撤离潜艇位置；通常实验室再深一层，靠水 |
| 11 | `marker.lab_disguise` | 1 | ✅ | 母体伪装试剂终端；冷库感 |
| 12 | `marker.island_bomb` | 1 | ✅ | 自爆装置；可与 lab_terminal 同一区域但更深 |
| 13 | `marker.ship_dock` | 1 | ✅ | 海风号停靠的船坞；轮船修复终点 |
| 14 | `marker.spore_spot` | 5-8 | ✅ | 感染者复活点；分散在岛上各区域 |
| 15 | `marker.loot_basic` | 20-40 | ✅ | 普通物资箱；建议每 30×30 区域 1-2 个 |
| 16 | `marker.loot_rare` | 5-10 | ✅ | 稀有物资箱；放在偏远 / 危险 / 高处 |
| 17 | `marker.loot_keynote` | 5 | ✅ | 关键剧情点；隐藏书页刷点 |
| 18 | `marker.mob_lab_researcher` | 4 | ✅ | 实验室僵尸刷点 |
| 19 | `marker.event_blackout` | 1 | ⭕ | 断电事件中心点；无放置则该事件不触发 |
| 20 | `marker.captain_marlowe` | 1 | ⭕ | 船长 NPC 显示位置（armor_stand）；船上大厅或船坞处 |
| 21 | `marker.dock_npc_korvin` | 1 | ⭕ | 开场柯尔文 NPC 位置；用于第一次"被咬"动画 |

总计**最少 17 类 marker，最多 21 类**（含可选）。

---

## 三、Step-by-step 适配流程

### Step 0: 准备工作（5 分钟）

1. 把地图存档放到 Minecraft 的 `saves/` 目录
2. 把 `escape_island` 数据包放到该存档的 `datapacks/` 目录
3. 进入存档，OP 自己: `/op <username>`
4. `/gamemode creative`
5. `/gamerule keepInventory true`（避免放 marker 时死亡）
6. `/datapack enable "file/escape_island"`
7. `/reload`

### Step 1: 标记大厅 / 餐厅 / 分散出生点（8 分钟）

```
在海风号大厅中心放置:
/summon marker ~ ~ ~ {Tags:["marker.lobby_ship"]}

在海风号餐厅准备区放置:
/summon marker ~ ~ ~ {Tags:["marker.dining_room"]}

在岛上 8-20 个分散位置放置:
/summon marker ~ ~ ~ {Tags:["marker.spawn_island"]}
```

`marker.spawn_island` 建议覆盖海滩、林缘、营地、残骸、山脚等区域。每个点附近 12 格内最好有可读路线、普通物资或明显地标，避免玩家开局迷路。

旧地图可额外放置 1 个 `marker.spawn_beach` 作为兜底；新地图不依赖所有玩家集中海滩出生。

### Step 2: 标记任务点（10 分钟）

按下表逐个标记。建议先把所有 marker 命令按地图坐标准备好一段，然后批量执行（用书与笔）。

```
# 任务核心
/summon marker -120 65 80 {Tags:["marker.signal_tower"]}
/summon marker 50 70 -200 {Tags:["marker.generator"]}
/summon marker -80 60 100 {Tags:["marker.generator"]}

# 直升机点
/summon marker -200 70 0 {Tags:["marker.heli_pad"]}
/summon marker 100 80 100 {Tags:["marker.heli_pad"]}
/summon marker 200 65 -50 {Tags:["marker.heli_pad"]}
/summon marker 0 75 200 {Tags:["marker.heli_pad"]}

# 实验室
/summon marker -150 30 -100 {Tags:["marker.lab_entrance"]}
/summon marker -150 15 -130 {Tags:["marker.lab_terminal"]}
/summon marker -150 10 -170 {Tags:["marker.lab_sub"]}
/summon marker -160 12 -120 {Tags:["marker.lab_disguise"]}
/summon marker -150 5 -150 {Tags:["marker.island_bomb"]}

# 船坞
/summon marker 0 65 250 {Tags:["marker.ship_dock"]}

# 感染者复活点
/summon marker -50 70 0 {Tags:["marker.spore_spot"]}
... (5-8 个分散位置)

# 实验室僵尸刷点
/summon marker -150 14 -110 {Tags:["marker.mob_lab_researcher"]}
... (4 个)
```

> 提示: 可以用结构方块按列表批量摆放，比手敲快十倍。

### Step 3: 标记物资箱（10 分钟）

物资箱本身**不需要放在世界里**——loot 由数据包根据 marker 动态在 `chest` 容器里填充。但如果你想用现成的箱子图：

**方法 A**: 在地图上手动放置箱子，然后给每个箱子贴 marker

```
找到箱子，站在箱子方块的上方（boots 触地）
/summon marker ~ ~-1 ~ {Tags:["marker.loot_basic"]}
```

**方法 B**: 让数据包自动生成箱子（推荐）

```
/function escape_island:debug/scaffold_chests
```

> 这个函数会读取所有 `marker.loot_basic` / `marker.loot_rare` marker，在该位置 setblock chest 并填充对应 loot table。

### Step 4: 校验（5 分钟）

```
/function escape_island:debug/validate_map
```

输出示例:
```
✅ marker.lobby_ship: 1 (required 1)
✅ marker.dining_room: 1 (required 1)
✅ marker.spawn_island: 12 (required 8-20)
✅ marker.signal_tower: 1 (required 1)
✅ marker.generator: 2 (required 2-3)
❌ marker.heli_pad: 3 (required 4) — 还缺 1 个
✅ marker.lab_entrance: 1
...
```

补齐所有红 X，再次运行直到全绿。

### Step 5: 试跑（10 分钟）

```
/function escape_island:test/spawn_dummies
/function escape_island:game/start
```

验证:
- 玩家先出现在海风号大厅，可进入餐厅准备区
- 开局后被传送到某个 `marker.spawn_island`
- 收到职业道具
- 等 2 分钟看是否有人变母体
- 试着修信号塔（持线缆 + 站修复点 + 长按右键）

### Step 6: 锁定地图

```
/datapack save_baseline
```

> 这是占位命令——实际是把当前 marker 列表导出到 `data/escape_island/data/saved_markers.json`，方便备份和迁移。

至此地图适配完成，可以让玩家进图试玩。

---

## 四、分区设计（文字图）

```
                  + (北)
                  |
               [山顶]
            heli_pad #4
               信号塔
                  |
[海岸西]   ─── 营地 ──── [海岸东]
heli_pad #1                heli_pad #2
                  |
              [丛林]
            spore_spot ×3
            loot_keynote ×2
                  |
              [山洞]
              发电机 #2
                  |
           [实验室入口]
                  ↓
           [实验室 -1]
        感染研究员 ×4
        loot_rare ×3
                  ↓
           [实验室 -2]
            身份卡终端
            伪装试剂台
                  ↓
           [实验室 -3]
            自爆装置
            撤离潜艇
                  
              [船坞]
              海风号
            ship_dock
            heli_pad #3
                  |
                  +(南)
```

各区域设计意图:

| 区域 | 设计目的 |
|---|---|
| 海风号大厅/餐厅 | 对局前社交、规则展示、房主开始游戏 |
| 海滩 | 分散出生点之一、轮船路线视觉锚点 |
| 营地 | 中转，物资聚集 |
| 山顶 | 信号塔、视野好、撤离冲刺战略价值 |
| 丛林 | 探索 / 散落剧情书页 |
| 山洞 | 黑暗、断电事件影响重 |
| 实验室 | 风险高 / 收益高，副线路线核心 |
| 船坞 | 轮船路线终点 |

---

## 五、物资箱密度建议

按面积分配（假设 300×300 地图 = 90000 平方）:

| 类型 | 数量 | 单格密度 | 备注 |
|---|---|---|---|
| `loot_basic` | 30 | 1 / 3000 sqm | 每个 30×30 区域约 1 个 |
| `loot_rare` | 8 | 1 / 11000 sqm | 集中在实验室、山洞、营地深处 |
| `loot_keynote` | 5 | — | 1 个营地、1 个山顶、1 个船坞、1 个丛林、1 个实验室 |

**位置选择原则**:
- 普通物资箱: 玩家自然路径会经过的地方（道路边、建筑入口、营地）
- 稀有物资箱: 危险或绕路才能到达（实验室深处、海底、悬崖边）
- 关键剧情点: 隐蔽但有线索（书页 = 探索奖励）

---

## 六、调试用结构方块

如果需要批量摆 marker 或物资箱，可用结构方块导入预设的 .nbt 文件（项目后续提供）：

```
/place template escape_island:debug/marker_lab_kit ~ ~ ~
```

这会在你脚下生成"实验室一整套 marker"（lab_entrance / lab_terminal / lab_sub / lab_disguise / island_bomb / 4×researcher 刷点）相对位置正确，你只需要旋转/调整高度。

类似预设:
- `marker_helipad_kit` — 1 套含 1 个 heli_pad 标记 + 周围 5 格 air 清理
- `marker_signal_tower_kit` — 信号塔基座（结构方块视觉占位）
- `marker_ship_dock_kit` — 船坞 + 海风号 armor_stand

---

## 七、常见问题

### Q1: 我的地图比 300×300 小很多，怎么办？

减少 `loot_basic` 数量到 15-20，把 `heli_pad` 减为 2 个（`tunable.heli_pad_count` 调到 2）。但如果地图 < 100×100 不推荐——任务会过于密集，匹配设计的"探索"节奏被破坏。

### Q2: 直升机降落点选哪里？

4 个候选点应该:
- 都是开放空地（5×5 以上无遮挡）
- 距离玩家可达路径不太远（30 秒可达）
- 互相之间不集中（防止"哪个点都差不多"）
- 推荐: 山顶、海滩、营地、码头

### Q3: 实验室能不能在表面？

可以，但视觉效果会差。建议至少有"地下"暗示（楼梯下行、潜望镜等）。

### Q4: 数据包会修改我的地图方块吗？

会:
- 信号塔修复完成时，`marker.signal_tower` 处会 `setblock` 一个发光方块
- 直升机降落时，对应 `heli_pad` 区域会 `summon` 直升机实体（可飞走）
- 自爆触发时，`marker.island_bomb` 区域 3 分钟后会触发 `summon tnt` 视觉爆炸（不直接破坏地形——破坏由 datapack 控制范围）
- 感染者复活时，`spore_spot` 处召唤粒子（不动方块）

如要保留地图地形 100% 不变，开局存一份地图副本。

### Q5: 数据包会刷怪吗？

会:
- 实验室僵尸（4 名）开局后 5 分钟刷一次
- 感染者复活点会刷"幽灵粒子"（不是怪）
- 不刷原版小怪（数据包内 `gamerule doMobSpawning` 默认设为 false 以保证体验）

### Q6: 玩家死亡后掉落怎么处理？

`gamerule keepInventory false`，但职业道具有 `MinecraftKeepOnDeath` flag（用 `Tags` 标识 + 死亡时函数捡回）。物资箱掉落物会消失（PvP 节奏需要）。

### Q7: 资源包是必需的吗？

不是。资源包只是给 10 个职业道具上贴图（让"解毒针"看起来像注射器而不是胡萝卜钓竿），数据包本身不依赖。如果不发资源包，物品会用原版纹理 + 自定义名 lore 显示。

### Q8: 可不可以我自己做地图？

完全可以。关键是按"二、必需 marker 列表"放好标记，遵循"分区设计"思路。地图建造本身的内容创意是你的自由。
