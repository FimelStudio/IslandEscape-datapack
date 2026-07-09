# MAP_GUIDE — 地图建造与适配指南

数据包逻辑与地图分离：本数据包不绑定特定地图，所有关键位置由 **marker 实体的 tag** 锁定。本文档告诉你拿到任何一张第三方"孤岛 / 末日"风格地图后，**如何用 30 分钟把数据包套上去**。

## 目录

1. [地图风格建议](#一地图风格建议)
2. [v0.1 marker 列表](#二v01-marker-列表)
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

## 二、v0.1 marker 列表

每个 marker 实体使用 `/summon marker x y z {Tags:["<tag>"]}` 放置。坐标取该位置玩家应该交互的中心点。

v0.1 正式多人测试只要求信号塔 → 直升机主线闭环。轮船、实验室、潜艇、自爆和 X-7 伪装路线可以继续保留在地图上，但不是 v0.1 主线必填项。

| # | Tag | 数量 | 必填 | 位置说明 |
|---|---|---|---|---|
| 1 | `marker.lobby_ship` | 1 | ✅ | 海风号开始大厅；玩家进入地图后的默认位置 |
| 2 | `marker.dining_room` | 1 | ✅ | 海风号餐厅准备区；可做规则展示 / 等人 / 就餐氛围 |
| 3 | `marker.spawn_island` | 8-20 | ✅ | 正式开局分散出生点；分布在海滩、林缘、营地、残骸附近 |
| 4 | `marker.spawn_beach` | 1 | ⭕ | 旧地图兼容兜底出生点；spawn_island 不足时使用 |
| 5 | `marker.signal_tower` | 5 | ✅ | 信号网络修复点；东、东南、西南、西北、中心核心塔各 1 个 |
| 6 | `marker.signal_core` | 1 | ✅ | 中心核心塔的额外 tag；该 marker 应同时拥有 `marker.signal_tower` |
| 7 | `marker.generator` | 2-3 | ⭕ | v0.1 推荐支线；用于加速信号塔 / 直升机路线，不是最小闭环必填 |
| 8 | `marker.heli_pad` | 4 | ✅ | 直升机降落候选点；4 个分布在岛屿四角 / 重要区域，给视野和路线变化 |
| 9 | `marker.lab_entrance` | 1 | ⭕ | v0.2 实验室支援路线入口；v0.1 可不放 |
| 10 | `marker.lab_terminal` | 1 | ⭕ | v0.2 实验室终端；v0.1 不作为主线验收 |
| 11 | `marker.lab_sub` | 1 | ⭕ | v0.2 潜艇撤离点；v0.1 不作为主线验收 |
| 12 | `marker.lab_disguise` | 1 | ⭕ | 后续彩蛋 X-7 伪装路线；不进 v0.1 |
| 13 | `marker.island_bomb` | 1 | ⭕ | v0.2 自爆 / 真结局点；不进 v0.1 主线 |
| 14 | `marker.ship_dock` | 1 | ⭕ | v0.1 可选轮船路线终点；启用轮船测试时必放 |
| 15 | `marker.spore_spot` | 0-6 | 可选 | 孢子氛围/旧兜底点；普通感染者默认围绕存活母体复活 |
| 16 | `marker.loot_basic` | 20-40 | ✅ | 普通物资箱；建议每 30×30 区域 1-2 个 |
| 17 | `marker.loot_rare` | 5-10 | ⭕ | 推荐物资点；用于提高路线变化，不是最小闭环必填 |
| 18 | `marker.loot_keynote` | 5 | ⭕ | 剧情 / v0.2 线索点；v0.1 可不参与胜负 |
| 19 | `marker.mob_lab_researcher` | 4 | ⭕ | v0.2 实验室战斗刷点；v0.1 可不放 |
| 20 | `marker.event_blackout` | 1 | ⭕ | 断电事件中心点；无放置则该事件不触发 |
| 21 | `marker.captain_marlowe` | 1 | ⭕ | 船长 NPC 显示位置（armor_stand）；船上大厅或船坞处 |
| 22 | `marker.dock_npc_korvin` | 1 | ⭕ | 开场柯尔文 NPC 位置；用于第一次"被咬"动画 |

v0.1 信号塔 → 直升机最小闭环至少需要 7 类 marker：`lobby_ship`、`dining_room`、`spawn_island`、`signal_tower`、`signal_core`、`heli_pad`、`loot_basic`。若启用轮船可选路线，再补 `ship_dock` 和船舶部件相关物资点；若测试 v0.2 实验室 / 自爆，再补 `lab_*`、`island_bomb`、`mob_lab_researcher`。

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
# 五塔信号网络：四座边塔 + 中心核心塔
/summon marker 140 72 0 {Tags:["marker.signal_tower"]}                     # 东塔
/summon marker 110 66 110 {Tags:["marker.signal_tower"]}                   # 东南塔
/summon marker -110 64 110 {Tags:["marker.signal_tower"]}                  # 西南塔
/summon marker -110 75 -90 {Tags:["marker.signal_tower"]}                  # 西北塔
/summon marker 0 86 0 {Tags:["marker.signal_tower","marker.signal_core"]}  # 中心核心塔

# 发电机支线
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

# 孢子氛围点（可选；感染者默认围绕母体复活）
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
✅ marker.signal_tower: 5 (required 5)
✅ marker.signal_core: 1 (required 1)
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
- 试着修任一信号塔（持线缆 + 站修复点 + 长按右键），确认边塔和核心塔都能显示进度

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
             西北信号塔
                  |
[海岸西]   ─── 营地 ──── [海岸东 / 东塔]
heli_pad #1                heli_pad #2
                  |
        [丛林 / 中心核心塔]
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
                  
       [西南塔]  [船坞]  [东南塔]
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
| 山顶 | 西北信号塔、视野好、撤离冲刺战略价值 |
| 丛林 | 探索 / 散落剧情书页 |
| 山洞 | 黑暗、断电事件影响重 |
| 实验室 | 风险高 / 收益高，副线路线核心 |
| 船坞 | 轮船路线终点 |

### 信号网络落点原则

- 五座塔要形成“绕岛一圈 + 中央核心”的节奏：东、东南、西南、西北四座边塔拉开路线，中心核心塔放在更容易遭遇母体的位置。
- 每座塔至少保留两条进出路，避免母体一个身体完全堵死任务点；核心塔可以更危险，但不能只有单通道。
- 边塔之间不要近到 20 格内互相看守；理想距离是玩家需要移动 20–40 秒才能换点。
- 核心塔应有明显视觉高度或光源，让玩家知道它重要；但它的修复时间更长，周围应提供掩体、绕后和撤退路线。
- 发电机支线可放在塔网的“空白角落”，鼓励幸存者分兵，也给母体选择守发电机还是守核心塔的判断题。

### 当前地图雏形专项落点方案

以下方案按当前截图方位描述：截图上方为北，下方为南，左侧为西，右侧为东。因为截图没有精确坐标，实际落 marker 时建议站到目标交互点中心执行 `/summon marker ~ ~ ~ {Tags:["..."]}`，不要照抄旧示例坐标。

#### 总体空间定位

| 区域 | 截图位置 | 玩法定位 | 建造重点 |
|---|---|---|---|
| 北部度假区 / 酒店岛 | 上方中央白色建筑群 | 文明区、安全假象、屋顶撤离点 | 多入口楼梯、屋顶通路、后勤地下室 |
| 西侧林地营地 | 左侧木屋与密林 | 野外中转、备用发电机、伏击区 | 清出小路和营火/补给视觉锚点 |
| 东北弧形山脊 | 右上长条山脉 | 远征目标、信号塔、高风险撤离点 | 高低两条路、山顶平台、远处可见轮廓 |
| 中央雨林 / 峡谷 | 岛心大片树林 | 追逐、迷雾、孢子污染视觉区 | 3 条可读主路 + 若干短捷径 |
| 东南工业 / 研究站 | 右下大型建筑 | 实验室入口、主发电机、剧情线 | 地下入口、警戒线、红灯、隔离门 |
| 南部船坞 / 海风号 | 下方码头与船 | 轮船撤离路线终点 | 宽码头、等待区、两侧绕行路 |

核心设计目标：北部给玩家安全感，中央负责压迫和追逐，东北负责远征修塔，南部负责真相和撤离。每个大区要有清楚的视觉身份，玩家只看地形就能知道自己大概在哪。

#### 主路线改造

建议先修 4 条“能读懂”的路线，再补小路。主路不需要很宽，但要连续、有灯、有铺装变化。

| 路线 | 起点 | 终点 | 设计目的 |
|---|---|---|---|
| 北线 | 北部酒店 | 中央雨林北缘 | 开局汇合和补给路线 |
| 西线 | 西侧木屋营地 | 中央雨林 | 野外绕行、伏击与发电机路线 |
| 东线 | 中央雨林 | 东塔 / 东北山脊 | 修塔远征路线，终局追逐压力最大 |
| 南线 | 中央雨林 | 东南研究站 / 南部船坞 | 实验室、船坞、工业发电机路线 |

每条主路都要至少有 1 个侧路或短捷径。尤其是酒店屋顶、中心核心塔、实验室入口、船坞这四个点，不能只靠单楼梯或单桥进入，否则母体/感染者太容易一人封门。

#### 推荐 marker 落点

| Marker | 推荐位置 | 摆放说明 |
|---|---|---|
| `marker.lobby_ship` | 南部海风号船舱大厅 | 对局前出生点，放在船内安全大厅中心 |
| `marker.dining_room` | 海风号餐厅或北部酒店餐厅 | 如果想开场在船上，就放船餐厅；如果想做度假区序章，就放酒店餐厅 |
| `marker.signal_tower` 东塔 | 东北弧形山脊或东侧高地 | 远处可见，适合作为最危险边塔之一 |
| `marker.signal_tower` 东南塔 | 东南研究站外缘 / 工业坡道 | 和实验室路线相邻，但不要贴实验室入口 |
| `marker.signal_tower` 西南塔 | 南部船坞外侧海崖 / 西南礁石 | 给轮船线附近制造分流点，离 `ship_dock` 至少 30 格 |
| `marker.signal_tower` 西北塔 | 西侧林地高坡 / 山顶平台 | 野外远征点，周围保留两条上下坡 |
| `marker.signal_tower` + `marker.signal_core` | 中央雨林核心空地 / 中央高台 | 最重要且最危险，修复面板前留 2x2 操作空间和绕后路 |
| `marker.generator` #1 | 东南研究站外侧机房 | 主发电机，视觉上最合理，周围可有电缆和警戒线 |
| `marker.generator` #2 | 西侧木屋营地旁小机棚 | 野外备用发电机，隐蔽但不应完全藏死 |
| `marker.generator` #3 | 北部酒店地下室 / 后勤房 | 近但室内复杂，适合小队冒险 |
| `marker.ship_dock` | 正南船坞码头中心 | 放在修船/登船互动点，不和直升机点重合 |
| `marker.lab_entrance` | 东南研究站正门或山体暗门 | 入口要明显，但门内马上变暗、变窄 |
| `marker.lab_terminal` | 研究站地下二层主控室 | 和入口保持 30-60 格路径距离 |
| `marker.lab_sub` | 地下靠海潜艇舱 | 应该靠水，和 `ship_dock` 视觉上不同 |
| `marker.lab_disguise` | 地下冷库 / 隔离室侧翼 | 母体路线点，建议有绕路和风险 |
| `marker.island_bomb` | 实验室最深处核心室 | 比终端更深，适合红灯、警报、反应堆视觉 |
| `marker.event_blackout` | 东南研究站配电室 | 可选；放这里最符合断电事件 |
| `marker.captain_marlowe` | 海风号大厅或船坞边 | 可选 NPC，适合给船线提示 |
| `marker.dock_npc_korvin` | 南部船坞入口 | 可选开场 NPC，用于第一次“被咬”动画 |

#### 4 个直升机降落点

直升机点要随机后改变整局终盘路线，所以 4 个 `marker.heli_pad` 不要挤在一个区域。每个点建议清出约 13x13 的平面，上方不要有树叶，至少两条可达路径。

| 编号 | 推荐位置 | 风险/收益 | 建造要求 |
|---|---|---|---|
| #1 酒店屋顶停机坪 | 北部白色酒店屋顶 | 近、视野好，但容易被堵楼梯 | 至少 2 条上楼路线；屋顶边缘加护栏和补光 |
| #2 东北山脊停机坪 | 东塔附近但相距 30-50 格 | 最远、最危险、戏剧性最强 | 做高路和低路；平台要能从中央雨林看见 |
| #3 西侧林地停机坪 | 西侧木屋/海崖旁清空平台 | 中等距离，适合林中追逐后冲出空地 | 清出树冠；加信号烟、旧停机标识 |
| #4 南部工业停机坪 | 东南研究站外坪或南部混凝土空地 | 靠近实验室和船坞，终局冲突密 | 距 `ship_dock` 至少 25-40 格；避免两条撤离路线重叠 |

若使用 `marker.spore_spot` 做污染视觉，建议离停机坪至少 20 格，离信号塔/发电机/船坞/实验室终端至少 15 格，避免玩家误以为这里会刷复活。

#### 出生点分布

`marker.spawn_island` 建议放 12-16 个。目标是开局分散但不迷路，每个出生点 12 格内最好能看到路、灯、建筑、海岸线或普通物资。

| 区域 | 建议数量 | 位置建议 |
|---|---:|---|
| 北部酒店外围 | 2-3 | 酒店后门、泳池/庭院、北侧栈道 |
| 西侧林地营地 | 2-3 | 木屋外、林缘小路、海崖低处 |
| 中央雨林边缘 | 3-4 | 不放在最密林心，放在路口或石阶旁 |
| 东南研究站外围 | 2-3 | 工业楼外、围栏缺口、低坡入口 |
| 南部船坞外围 | 1-2 | 码头外侧或海滩，不要直接在 `ship_dock` 上 |
| 东北山脚 | 1 | 通往东塔的低路入口，不直接出生在信号塔 |

#### 孢子氛围点分布

`marker.spore_spot` 已不是必需复活点。若地图需要污染视觉，建议 3-6 个，表现成排水口、洞穴、菌毯、废液口、海蚀洞等；靠近路线但不要贴任务点。

| 编号 | 推荐位置 | 用途 |
|---|---|---|
| #1 中央雨林洞 | 母体/感染者回场最快，制造中部压力 |
| #2 东北山脚裂缝 | 给东塔路线压力，但不贴塔 |
| #3 西侧林地深处 | 让西线不完全安全 |
| #4 北部酒店排水口 | 文明区出现污染感 |
| #5 东南研究站废液口 | 实验室线压力点 |
| #6 西南礁石/沉船洞 | 船线压力点，但离 `ship_dock` 保持距离 |

#### 物资与剧情点建议

| Marker | 推荐分布 |
|---|---|
| `marker.loot_basic` | 北部酒店 6-8，中央雨林 6-8，西侧营地 4-5，东南研究站外 4-5，南部船坞 3-4 |
| `marker.loot_rare` | 酒店屋顶 1，东北山脊 1，西侧海崖 1，实验室深处 2-3，沉船/礁洞 1 |
| `marker.loot_keynote` | 酒店客房/前台 1，西侧木屋日记 1，信号塔维护记录 1，实验室档案 1，船坞日志 1 |
| `marker.mob_lab_researcher` | 全部放实验室内部，分散在入口后、冷库、终端前、核心室外 |

#### 具体改图清单

1. 在中央雨林先开 3 条可读主路：北接酒店，西接木屋，南接研究站/船坞。
2. 给东塔/东北山脊做高低两条通路：高路到塔，低路沿海绕行。
3. 北部酒店增加第二出入口：后勤楼梯、外墙梯、破窗阳台或栈桥都可以。
4. 每个直升机点清出 13x13 左右空地，上方清树叶，放一圈灯或混凝土标识。
5. 五座信号塔周围保留视野，不要全被树挡住；修复面板前留 2x2 操作空间。
6. 发电机点周围留 5x5 操作空间，并用电缆/灯柱指向信号网络或研究站。
7. 实验室入口做“从明亮户外进入压抑室内”的转场：门、红灯、警戒线、向下楼梯。
8. 船坞和南部工业停机坪保持距离，让船撤离和直升机撤离不是同一个终点。
9. `spore_spot` 用污染视觉强化，但离任务交互点保持至少 15 格。
10. 路口用小型地标帮助导航：倒塌电线杆、红色警示灯、黄黑警戒线、白色路牌、残骸。

#### 推荐落点顺序

先不要急着放所有物资。建议按这个顺序做地图，手感更稳定：

1. 放 `marker.lobby_ship`、`marker.dining_room`、`marker.ship_dock`。
2. 确定 4 个 `marker.heli_pad`，先清空和修路。
3. 放 5 个 `marker.signal_tower`，其中中心核心塔额外带 `marker.signal_core`，再放 2-3 个 `marker.generator`。
4. 做实验室一整套 `lab_*` 和 `island_bomb`。
5. 放 12-16 个 `marker.spawn_island`。
6. 可选放置 3-6 个 `marker.spore_spot` 做孢子氛围点。
7. 最后放 `loot_basic`、`loot_rare`、`loot_keynote`。
8. 运行 `/function escape_island:debug/validate_map`，再按缺项补 marker。

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
- `spore_spot` 处可召唤污染粒子（不动方块）；感染者默认围绕母体复活

如要保留地图地形 100% 不变，开局存一份地图副本。

### Q5: 数据包会刷怪吗？

会:
- 实验室僵尸（4 名）开局后 5 分钟刷一次
- 孢子氛围点会刷"幽灵粒子"（不是怪）
- 不刷原版小怪（数据包内 `gamerule doMobSpawning` 默认设为 false 以保证体验）

### Q6: 玩家死亡后掉落怎么处理？

`gamerule keepInventory false`，但职业道具有 `MinecraftKeepOnDeath` flag（用 `Tags` 标识 + 死亡时函数捡回）。物资箱掉落物会消失（PvP 节奏需要）。

### Q7: 资源包是必需的吗？

不是。资源包只是给职业道具、武器、撤离载具和氛围音效补表现，数据包本身不依赖。如果不发资源包，物品会用原版纹理 + 自定义名 lore 显示。资源包需求清单见 [RESOURCE_PACK_ASSETS.md](RESOURCE_PACK_ASSETS.md)。

### Q8: 可不可以我自己做地图？

完全可以。关键是按"二、必需 marker 列表"放好标记，遵循"分区设计"思路。地图建造本身的内容创意是你的自由。
