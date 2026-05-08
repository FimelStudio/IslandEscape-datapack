# IMPLEMENTATION_PLAN — 实施计划

本文记录当前开发阶段的实现顺序、验收方式和自测结果。目标是在正式地图完成前，先让核心机制在数据包内闭环运行。

## 一、当前原则

- 目标版本: Minecraft Java Edition 1.21.11。
- 地图暂未完成，因此所有核心功能必须先支持"开发沙盒"测试。
- 正式地图以后只提供 marker，不应重新改核心玩法逻辑。
- 每完成一批实现，先跑静态自测，再更新本文状态。

## 二、1.21.11 格式规则

以下规则来自 1.21.5+ 之后的文本组件和物品组件格式，并作为本项目后续写法基准:

- `tellraw` / `title` / `bossbar` / `team` 文本组件使用新版字段。
- 点击事件使用 `click_event`，运行命令字段使用 `command`。
- 不再使用旧字段 `clickEvent`、`hoverEvent`、`value`。
- 物品名使用 `minecraft:custom_name={...}`，不要写成 `minecraft:custom_name='{"text":"..."}'`。
- 物品 lore 使用 `minecraft:lore=[{...},{...}]`，不要写成字符串数组。
- 实体名使用 `CustomName:{...}`，不要写成 `CustomName:'{"text":"..."}'`。
- `minecraft:custom_data` 只保存逻辑数据，不塞显示文本。
- 右键食物类技能道具一律附加 `minecraft:consumable {consume_seconds: 999, animation: "none"}` 防止意外消耗。

参考:

- https://minecraft.wiki/w/Text_component_format
- https://minecraft.wiki/w/Data_component_format

## 三、GDD / BALANCE 覆盖口径

实现计划不是复制 GDD 和 BALANCE 的全文，而是把它们拆成可落地、可验收的开发批次。判断“实现计划做完是否等于 v0.1 做完”，以本节为准。

### v0.1 完成定义

v0.1 视为完成需要同时满足：

- GDD 中所有标为正式玩法闭环的系统都有对应实现批次，并且批次状态为已完成。
- BALANCE 中所有会影响正式对局的数值都有 scoreboard / function / loot table / marker 规则承载，或明确标为暂缓。
- 4 人测试开局、正常开局、至少 1 条撤离路线、母体胜利路线都能在游戏内跑通。
- `/reload`、函数引用、JSON 解析、`git diff --check` 通过；关键路线完成游戏内手测。

### 设计覆盖矩阵

| GDD / BALANCE 模块 | 实现计划覆盖 | v0.1 状态 | 备注 |
|---|---|---|---|
| 对局阶段时间线、正式开局、测试开局 | Batch 1 / 4.5 / 12 / 17 | 基本完成，终局高压待手测 | 12:30 终局高压由 Batch 17 新增 |
| 阵营、母体、普通感染者、感染期、死亡转化 | Batch 3 / 4 / 17 | ✅ Team 系统已修 | survivors/mother/mother_hidden 均加 nametagVisibility:hideForOtherTeams；母体初始留 survivors team 防止变身前 PvP；普通感染者知道母体身份并在母体附近复活作为正式规则 |
| 母体两状态系统、成长时机、变异计时、PvP 架构、flag 迁移 | **Batch 4.6**（新增） | **已完成（2026-05-08 修订）** | 变身永久化：state.mutated（永久）与 state.hunting（当次狩猎）拆分；变身后不回退 mother_hidden；变身时清除所有人类武器/弹药/任务道具 |
| 全员转化立即结局、感染期登机转化驱离 | **Batch 4.7**（新增） | **已完成** | 全员转化、登载转化驱离、转化前撤离均已通过菜单手测 |
| 母体成长、腐痕感知、集群嚎叫、吞噬 | Batch 4 / 4.5 | 已完成，待 4.6 回归验收 | 成长数值和时机需随 4.6 更新 |
| 母体伪装期被动孢子脉冲 + 侵蚀光环 | **Batch 4.6 / 17** | **已实现，待手测回归** | 孢子脉冲、同目标贴近判定、修复降速、心跳/污染提示均已接入 |
| 10 职业技能 | Batch 5 / 6 | 基本完成，需回归 | 已发现并修过海军枪械精通；最终压测再覆盖 |
| 厨师热汤 v0.2 调整（120s/8格/优先队友） | Batch 17 | 已实现，待手测回归 | 感染期目标只暂停转化倒计时 8s + 回血，不清除感染期；已接入菜单测试 |
| 通讯员转化保留 | Batch 17F | 已实现，待手测回归 | 改为“污染干扰器”：公共异常噪声 + 扫描站干扰，不伪造私有扫描结果 |
| 感染者污染值由 +35 → +27 | Batch 17D | 已完成 | 恢复母体在感染效率上的绝对优势 |
| 特殊感染体：循声者（Clicker） | 新增补丁 | 已完成 | 母体吞噬编辑中切换；循声孢子追踪移动人类，可被手枪击碎 |
| M-7 手枪系统 | Batch 6 | 已完成，需回归 | 组员报错已修，仍需多人实战确认 |
| 直升机旧主线 | Batch 7 / 8 | 旧版已完成 | 已被 Batch 13 重构为 5 塔信号网络 |
| 5 塔信号网络（v0.1 版本） | Batch 13A / 13B | 已实现但数值过快 | 旧版 v0.1 数值会被 Batch 17 重构覆盖 |
| **5 塔信号网络（v0.2 重构）** | **Batch 17** | **实现已完成，待整局回归** | 核心塔贡献砍半 + 边塔速率减半 + 团队上限收敛；目标 4 人局 5–6 分钟 |
| **发电机奖励强化（v0.2）** | **Batch 17** | **已实现** | 从仅缩短倒计时升级为全图修复速率 ×1.2 + 倒计时 -15s；已接入菜单测试 |
| 轮船路线 | Batch 9 / 13C | 部件分散已实现，待 4 人验收 | 重点是地图刷点分散和 2.5 倍修复上限 |
| 轮船登船窗口按人数缩放（v0.2） | Batch 17H | 已完成 | 已通过菜单手测；4–7 人 45s / 8–12 人 50s / 13+ 60s |
| 实验室支援 / 潜艇隐藏路线 | Batch 9 / 17 | 已实现，需手测/回归 | 实验室优先作为疫苗、防毒面具、隔离扫描、文件支援路线；潜艇不作为常规胜率基准 |
| 实验室研究员数量 = 身份卡碎片数（v0.2） | Batch 17I | 已完成 | 已通过菜单手测；4/8/17 人为 3/4/5 |
| 多撤离路线并行处理 + 分层胜负（v0.2） | Batch 17G | 已实现，待手测回归 | 分层撤离结果、自爆优先级保护、后到路线保护均已接入 |
| 隔离扫描（社交推理补强） | Batch 17 | 已实现，待手测回归 | 2 人读条，正常 / 孢子异常 / 严重异常，病毒学家加速；已接入菜单测试 |
| 自爆真结局 | Batch 9 | 已实现，需回归 | 触发条件随新版信号网络改为 `signal_done` |
| 母体伪装结局 / X-7 | 后续彩蛋批次（暂缓） | 暂缓，不计入 v0.1 | 用户已确认可先放后；正常局闭环优先 |
| 病毒变异 Bad End | Batch 9 | 已实现，需回归 | 15:00 无人撤离触发；提前全员转化由 Batch 4.7 立刻触发 |
| 物资箱、关键线索、资源保底、物资道具功能 | Batch 10 / 14 / 16 | 已实现，待多人回归 | 开箱、保底、急救包、手电筒、防毒面具、烟雾/闪光/信号道具均已接入 |
| 环境事件 | Batch 11 | 已完成，需回归 | 频率统一为每 2 分钟（GDD 旧 3 分钟说法已修正） |
| 缩放规则、调参旋钮 | Batch 12 / 13 / 16 / 17 | 主要规则已实现，待整局校准 | 新版 `signal_*`、`ship_boarding_seconds`、发电机奖励、研究员数量在 Batch 17 写入 |
| 地图 marker 适配规则 | Batch 2 / 13 / MAP_GUIDE | 部分完成 | 5 塔 marker 校验需实现 |
| UI 提示、bossbar、actionbar、首局引导 | 各批次 + Batch 16 | 部分完成 | 最终做一次统一文本/提示收口 |
| 训练模式、复盘、结算观战 | Batch 2 / 8 / 16 | 部分完成 | 复盘 `debug/show_state` 需确认是否完整 |
| 天赋系统 | Batch 15 | 待实现 | GDD/BALANCE 已重设为人格牌组 |
| 生涯 / MVP / 专精系统 | Batch 18 | 待实现，主闭环稳定后做 | 只解锁展示、称号、预设和可选天赋牌，不提供永久数值优势 |

### 暂缓 / 不计入 v0.1 完成

| 模块 | 暂缓原因 | 后续条件 |
|---|---|---|
| 17–20 人局潜伏宿主 / 次级母体 | 新版主母体不可复活，旧规则会破坏清剿胜利 | 大人数压测后单独重设 |
| 母体伪装结局 / X-7 | 彩蛋路线，不影响正常局和主要胜负闭环 | 主玩法、物资道具和天赋稳定后再做 |
| 彩蛋结局易触发性优化 | 用户已确认彩蛋结局不容易触发也无所谓 | 主玩法稳定后再调 |
| 生涯系统 / MVP / 天赋长期解锁 | v0.1 先做单局人格牌组 | Batch 18；主玩法、结算与天赋基础池稳定后再做 |
| 高精度地图导出 / marker 存档工具 | 当前可用手工 marker + 自测菜单 | 正式地图定稿后再做工具化 |

## 四、实现批次

### Batch 1 — 框架底座

状态: **已完成静态自测和游戏内手测**

- [x] `load.mcfunction` 注册所有 scoreboard / team / bossbar。
- [x] 新增 `_tick_20`，集中调度 20 tick 系统。
- [x] `tick.mcfunction` 支持正式局和训练/开发沙盒两条 tick 路径。
- [x] 修复 `game/start` 的玩家数量统计。
- [x] 修复撤离人数和感染者数量统计。

### Batch 2 — 无地图开发沙盒

状态: **已完成静态自测和游戏内手测**

- [x] `dev/setup_markers`，在执行者附近生成临时 marker。
- [x] `dev/clear_markers`，清理所有 `dev.marker`。
- [x] `dev/start`，创建开发沙盒并进入可测试状态。
- [x] 自测菜单加入开发沙盒按钮。

### Batch 3 — 感染与死亡状态机

状态: **已完成并通过游戏内手测**

- [x] 母体/感染者命中增加 `spore_load`（advancement 检测），按新版母体攻击冷却重构：每次有效命中 +40，3 次达 120 ≥ 阈值 100 进感染期；冷却中命中播放擦刀弱音效（`entity.player.attack.weak`）。
- [x] 阈值到达进入 `state.infected_period`（金色名牌）。
- [x] 感染期玩家仍在幸存者阵营，不能攻击其他幸存者。
- [x] 任意幸存者死亡进入孢化倒计时，然后转感染者。
- [x] 感染者死亡：母体存活时围绕母体复活；母体死亡后不再复活（`$game mother_dead = 1` → `mother_respawn = -1` 永久锁定）。
- [x] 母体死亡：不复活，进入母巢崩坏（设置 `$game mother_dead = 1`，播放 warden death 音效）；感染者全灭后触发幸存者清剿胜利（新增 `end_purge` 结局）。
- [x] 神父十字架阻断感染期/死亡孢化。
- [x] 感染期、孢化、感染者复活、母巢崩坏均显示 actionbar 秒级状态。
- [x] 感染期补齐心跳音、脚下粒子；完全转化感染者补齐绿色孢子粒子（无 glowing）。
- [x] 污染值 ≥ 50 时给本人 actionbar + 轻微心跳音；音效每次在玩家当前位置播放。
- [x] 幸存者死亡进入倒地孢化：每 tick 在当前位置刷新个人重生点，真实死亡后原地立即重生并用隐形 marker 锚定，不进入 spectator，不可自由飞行；玩家本人站在原地僵直并显示 15 秒倒计时，结束后在原地转化为感染者。
- [x] 感染者死亡冷却期间不进入 spectator：原地重生后用隐形 marker 锚定，adventure + 移速 0 + 黑暗/隐形等待复活；母体死亡后同样锁定但不复活。
- [x] 修复 Tunable 加载顺序。
- [x] 修复孢子点选择使用 marker 实体。
- [x] 名牌变色系统（母体隐藏绿 / 感染期金 / 感染者红）。
- [x] 转化保留系统（retained.* tag 在 turn.mcfunction 中复制）。
- [x] 母体 HP 追踪（`mother_hp` scoreboard，起始 80）。
- [x] 母体脱战回血（`mother_regen_cd` 受伤重置 5s，冷却结束后 Regeneration II）、攻击冷却（`mother_hit_cd = 50 tick`，每 tick 递减 2.5s）+ 擦刀反馈（冷却中命中播放弱音效 + `attack_speed` 降至 0.1 + Slowness II 2s 惩罚）。
- [x] 母体成长阶段 80→90→100：每 300s（5 分钟）升级，`mother_phase_up.mcfunction` 提升 `max_health` +10 并补满 HP。

> ⚠️ **Batch 3 遗留问题（待 Batch 4.6 修正）**：母体 HP 基准已更新为 60（GDD/BALANCE），但本批次代码实现仍是 80；成长时机已更新为 T+5/8/11:00，但实现仍是每 5 分钟。Batch 4.6 将对这两项进行回炉修正，Batch 3 本身标为"已完成"但需回归验收。

### Batch 4 — 母体属性与首攻揭示

状态: **已完成并通过游戏内手测**

目标: 母体成为不可复活的感染阵营核心：三下有效命中进感染期，拥有变异、吞噬、腐痕感知、集群嚎叫四个技能，并随时间成长。

任务:

- [x] `_make_mother.mcfunction` 调整 attribute 命令:
  - `attribute @s minecraft:max_health base set 80`
  - `attribute @s minecraft:armor base set 4`
  - `attribute @s minecraft:armor_toughness base set 2`
  - `attribute @s minecraft:knockback_resistance base set 0.8`
  - `attribute @s minecraft:attack_damage base set 4`
  - `attribute @s minecraft:movement_speed base set 0.105`
  - 执行后用 `effect give @s minecraft:instant_health 1 10 true` 补满 HP，并给 `saturation` 保证可疾跑
- [x] `tick_mother.mcfunction` 维持 Resistance I、脱战回血、成长阶段（每 5 分钟 +10HP，80→90→100）、攻击冷却（`mother_hit_cd = 50 tick`，每 tick 递减 2.5s）
- [x] `on_hit_by_mother.mcfunction` 检查 `flag.first_attack`：
  - 若无此 tag → 全图广播"有人遭受了突袭……"→ 给母体 `tag add flag.first_attack`
  - 有效命中（`mother_hit_cd ≤ 0`）：`add_spore_load {amount:40}` + 设 `mother_hit_cd = 50` + `attack_speed → 0.4` + tag `state.attack_slowed`（冷却结束恢复 4.0）
  - 冷却中命中（`mother_hit_cd ≥ 1`）：仅播放擦刀弱音效，不叠孢子，不改变攻速
- [x] 母体技能重构：
  - `mother/mutate` → 变异（新增）：红色染料一次性使用，脱伪装，`mother_hidden → mother` team，开 pvp，全图广播，60s buff
  - `mother/eat/*` 保留吞噬技能
  - `mother/rotsense` → 腐痕感知：40 格内幸存者位置红色粒子（仅母体可见），全图广播暴露提示，冷却 60s，hotbar.5 冷却倒计时显示
  - `mother/howl` → 集群嚎叫：感染者 Speed II + Strength I 10s，冷却 90s，hotbar.6 冷却倒计时显示
- [x] `game/start.mcfunction` + `start_test`：tag 清理 + `$game mother_dead = 0` + `state.mutated` 初始化
- [x] `game/settle.mcfunction`：完整清状态（tag/scoreboard/属性/背包/效果），恢复 `natural_health_regeneration` + `pvp`
- [x] 阵营系统：全 team `friendlyFire false`，pvp 开局 `false`，母体变异后 `true`
- [x] 验收: 母体三次有效命中进感染期；冷却中擦刀仅音效；母体死亡不复活；感染者围绕母体复活、母体死后永久死
- [x] 验收: 母体成长阶段（80→90→100），技能腐痕感知/集群嚎叫/变异

> ⚠️ **Batch 4 遗留问题（待 Batch 4.6 修正）**：PvP 架构使用全局 `pvp` gamerule 开关，需迁移为永久 `pvp true` + team friendlyFire 控制。`flag.first_attack` 暴露机制需迁移为 `state.mutated`（猎手状态）。变异为一次性永久揭示，需改为 60s 计时 + 45s 冷却 + 自动回伪装。

### Batch 4.5 — 测试版开局 + 自测增强

状态: **已完成**

- [x] `game/start_test.mcfunction`：精简开局，自动发线缆+燃料电池，不含物资箱
- [x] 自测菜单：逐个放标记（出生点/孢子氛围点/信号塔/发电机/直升机坪）+ 预览标记 + 测试版开局按钮；感染者默认围绕母体复活，孢子点仅作视觉/旧兜底
- [x] `dev/show_markers.mcfunction`：生成发光名牌盔甲架标记所有点位，120s 自动清除
- [x] 常驻 buff：`_tick_20` 每秒刷新 Regeneration I + Saturation I，自然回血禁饱食度依赖
- [x] 吞噬吐人 `gamemode survival` → `adventure`
- [x] 感染者/母体复活 `effect clear @s` 全清，不再残留回血效果
- [x] 手枪命中反馈 title `@p` → 射击者 `skill.pistol.shooter` tag
- [x] 海军枪械精通 `gm_runtime` 卡住修复
- [x] `naturalRegeneration` → `natural_health_regeneration`（1.21.5+ snake_case）

### Batch 4.6 — 母体系统回炉（HP 校正 + 两状态 + PvP 架构）

状态: **已完成（Part 1–11 已通过单人菜单手测 / 用户确认）**

目标: 将 Batch 3/4 已实现的母体系统升级到新版 GDD 设计：HP 60、三阶成长 T+5/8/11:00、变异计时双向切换、PvP 改为 team 控制、flag.first_attack 迁移。

Part 1 已实现并通过单人菜单手测:
- `_make_mother.mcfunction` 现在读取 `Tunable tunable.mother_hp` 设置母体 HP
- `util/apply_scaling.mcfunction` 已写入小人数局母体 HP / 变异冷却 / 腐痕感知冷却缩放值
- 普通感染者转化后会收到核心母体身份提示；死亡后仍沿用既有母体附近复活逻辑
- 自测菜单已接入 `[母体HP: 4人局]`、`[母体HP: 8人局]`、`[单人模拟感染链提示]`

Part 2 已实现并通过单人菜单手测:
- 母体成长 HP 不再写死旧版 80/90/100，而是基于 `Tunable tunable.mother_hp` 计算 60→65→75 / 70→75→85
- 腐痕感知冷却读取 `tunable.rotsense_cd`，可被人数缩放影响
- 成长 II 后集群嚎叫持续时间从 10s 提升到 13s
- 自测菜单接入单人 `[母体成长: 4人局]`、`[母体成长: 8人局]`

Part 3 已实现并通过单人菜单手测:
- `role/tick_mother.mcfunction` 的成长触发从旧版个人计时 180/360/540 秒改为全局对局时间 T+5/8/11:00
- 成长触发点使用 `phase_timer = 6000 / 9600 / 13200`（tick 计时）
- 自测菜单接入单人 `[成长时机: 4人局]`、`[成长时机: 8人局]`，验证提前 1 tick 不成长、到点成长

Part 4 已实现并通过单人菜单手测:
- `skill:mother/mutate` 从一次性永久揭示改为基础循环：触发猎手 1200t（60s）→ 自动回 `mother_hidden` → 写入再次变异冷却
- 冷却读取 `Tunable tunable.mutate_cd`：4–7 人局 600t（30s），其余默认 900t（45s）
- 技能物品改为 `phantom_membrane` 变异脉冲；猎手/冷却期间热键栏显示剩余秒数，冷却结束后自动恢复可用
- 隐藏母体不再发放腐痕感知 / 集群嚎叫 / 吞噬，避免覆盖伪装期人类物品栏；这些技能只在猎手状态出现，回隐藏后清理
- 自测菜单接入单人 `[变异循环: 4人局]`、`[变异循环: 8人局]`
- 自测菜单接入单人 `[母体隐藏物品栏]`

Part 5 已实现并通过单人菜单手测:
- `interaction/on_hit_by_mother.mcfunction` 命中分流：隐藏母体普通命中不触发首攻广播、不加孢子、不写攻击冷却；猎手状态才叠孢子和进入擦刀冷却
- 自测菜单接入单人 `[母体命中分流]`

Part 6 已实现并通过单人菜单手测:
- `skill:radio/signal_scan/start.mcfunction` 母体扫描条件从 `flag.first_attack` / 任意母体改为仅 `state.mutated`
- 测试人偶母体也只有带 `state.mutated` 时进入扫描报告，避免训练/自测误导
- 自测菜单接入单人 `[扫描母体伪装]`

Part 7 已实现并通过单人菜单手测:
- 成长 II 后 `skill:mother/mutate` 猎手持续时间从 1200t 提升到 1500t（75s）
- 成长 II 后猎手结束回伪装冷却固定为 700t（35s）
- 成长 III 时对普通感染者发放 Speed I + Resistance I 3s 的感染者脉冲
- 自测菜单接入单人 `[成长变异强化]`

Part 8 已实现并通过单人菜单手测:
- `infection/turn.mcfunction` 在转化后 recount 感染者数量
- `infected_count = 1` 时仅母体收到 title + 私聊 + `warden.roar`
- `infected_count = 3` 时仅母体收到 actionbar + 私聊提示，鼓励组织围攻
- 自测菜单接入单人 `[母体里程碑反馈]`

Part 9 已实现并通过单人菜单手测:
- 新增 `mother/passive_disguise.mcfunction`：隐藏母体、非 X-7、非死亡状态下每秒检测 4 格内幸存者
- 连续贴近 6 秒后，对最近幸存者每 10 秒 +10 `spore_load`
- 受影响者收到极弱心跳 / 模糊 actionbar，使用 `cd_aura_heartbeat` 节流
- 猎手状态 `state.mutated` 和后续 `state.disguised` 会暂停该被动
- 自测菜单接入单人 `[伪装贴身孢子]`

Part 10 已实现并按用户反馈调整通过:
- 全局 `pvp` 改为长期 true：`load` / Phase 1 均设为 true，不再由 Phase 2 或母体变异打开
- `team mother` 的 `friendlyFire` 改为 true；幸存者 / 隐藏母体 / 感染者队伍仍保持队内友伤关闭
- Phase 1 不再额外补血；用户验收反馈认为无需受伤保护，保留正常伤害即可
- 自测方式改为 `/reload` 后确认数据包没有关闭全局 PvP 的命令残留，正常开局不再依赖全局 PvP 开关

Part 11 已实现并通过:
- 新增 `game/randomize_match.mcfunction`
- 每局开局随机 1 台 `marker.generator` 写入 `gen_overload = 8` 并标记 `gen.hidden_overload`
- 每局开局随机 1 个 `marker.loot_basic` 临时加上 `marker.loot_rare` / `marker.loot_hot`，在放物资箱前升级为热区稀有箱
- 自测菜单接入单人 `[随机局变量]`

任务:

- [x] `_make_mother.mcfunction`：`attribute @s minecraft:max_health base set 60`；读取 `tunable.mother_hp`（4–7人局 70，由 `apply_scaling` 写入）
- [x] `util/apply_scaling.mcfunction`：新增 `tunable.mother_hp`（4–7人 = 70，其余 = 60）；新增 `tunable.mutate_cd`（4–7人 = 600t / 30s，其余 = 900t / 45s）；新增 `tunable.rotsense_cd`（4–7人 = 600t，其余 = 800t）
- [x] 母体成长系统重构（移除旧"每 300s +10"逻辑）：
  - [x] `role/tick_mother.mcfunction`：`phase_timer = 6000` → 成长 I；`= 9600` → 成长 II；`= 13200` → 成长 III
  - [x] `role/mother_phase_up.mcfunction`：成长 I `max_health +5` + 满血补满 + 私聊 actionbar + 腐痕感知冷却写入新值
  - [x] `role/mother_phase_up.mcfunction` / `skill:mother/howl`：成长 II 后集群嚎叫持续时间 +3s + 私聊 actionbar
  - [x] `role/mother_phase_up.mcfunction`：成长 III `max_health +10` + 私聊 actionbar
  - [x] 成长 II 后变异猎手持续时间由 1200t 改为 1500t（75s）、冷却改为 700t（35s）
  - [x] 成长 III 感染者脉冲（Speed I + Resistance I 3s）
- [x] 变异脉冲 (`mother/mutate`) 重构为双向计时基础版：
  - [x] 道具改为 `phantom_membrane`（命名"变异脉冲"），`consume_item` advancement
  - [x] 触发 → `team join mother @s` + `tag add state.mutated` + 变异粒子爆发 + 低沉异声（8格内）+ 设 `cd_mother_hunt = 1200`（60s）
  - [x] `skill:mother/mutate/cooldown_tick`：`cd_mother_hunt > 0` → 每 tick -1；`cd_mother_hunt = 0 AND tag=state.mutated` → 自动回退（`team join mother_hidden` + `tag remove state.mutated`）+ 设 `cd_mother_mutate = tunable.mutate_cd`（再次变异冷却）
  - [x] 集群嚎叫冷却与变异独立（`cd_mother_howl`），确认在两种状态均可使用
- [x] PvP 架构迁移（取消全局 pvp gamerule 开关）：
  - `load.mcfunction`：`gamerule pvp true`（永久），移除 `pvp false` 初始化
  - `team mother friendlyFire true`；`team mother_hidden friendlyFire false`；`team survivors friendlyFire false`
  - `game/start.mcfunction` / `phase_1_load`：不再关闭 pvp；Phase 1 不做额外伤害补偿
  - `game/settle.mcfunction`：移除 `gamerule pvp` 恢复逻辑，改为 team friendlyFire 重置
- [x] `on_hit_by_mother.mcfunction`：污染条件改为猎手状态；`team=mother_hidden` / 非 `state.mutated` 命中不叠孢子、不触发擦刀反馈
- [x] `radio/signal_scan/start.mcfunction`：已暴露母体判定从 `flag.first_attack` 改为 `tag=state.mutated`；隐藏母体（`team=mother_hidden + !state.mutated`）不进入报告
- [x] 贴身孢子脉冲（伪装状态，取代无效的 +2/s）：
  - `tick_mother.mcfunction`：仅在隐藏母体且非 X-7 时执行；连续贴近幸存者 6s 后启动；`cd_mother_passive_spore > 0` → 每秒 -1；`= 0` → 对最近幸存者 `spore_load +10` + 重置 `cd_mother_passive_spore = 10`（10s）
  - 给受影响者极弱心跳/污染提示节流，不显示来源
  - 普通感染者转化后显示母体方向或母体身份提示；继续在母体附近 8–16 格复活
- [x] 母体里程碑反馈：首次感染（`infected_count` 从 0→1 时）私聊 title + `warden.roar`；转化第 3 人私聊 actionbar
- [x] 每局随机变量（`game/start.mcfunction` / `start_test` 放物资箱前）：
  - 随机 1 台发电机写入 `gen_overload = 8`（隐患发电机）
  - 随机 1 个 `loot_basic` marker 临时加 `loot_rare`（热区物资）

验收:
- [x] 母体觉醒 HP = 60（4人局测试 = 70）
- [x] 成长时机 T+5/8/11:00 正确触发，HP 变化正确（+5/0/+10）
- [x] 变异 60s 后静默回伪装，等 45s 冷却后可再次变异（4人局 30s）
- [x] 猎手状态命中叠孢子；伪装状态命中不叠
- [x] 伪装连续贴近目标 6s 后启动脉冲，4 格内每 10s 目标 +10 孢子，并给极弱反馈
- [x] radio scan 不报告 `team=mother_hidden` 且非 `state.mutated` 的母体
- [x] Phase 1 不再使用受伤补回；全局 PvP 长期 true，具体阵营伤害由 team / 玩法函数控制
- [x] 开局随机变量：恰好 1 台发电机 `gen_overload = 8`，恰好 1 个普通物资 marker 成为热区稀有物资

### Batch 4.7 — 结局闭环补丁

状态: **已完成（全员转化立即结局、登载窗口转化驱离、转化前撤离均已通过菜单手测）**

目标: 补全两个游戏闭环缺口：全员转化应立即结局；感染期玩家在登机窗口转化应被驱离。

任务:

- [x] `game/_tick_20.mcfunction`（每秒）：对局中若已无 `team.human`，进入全员转化结局入口
- [x] `game/end_all_infected.mcfunction`：全员 title "§8岛上再无生者……" + `entity.warden.death` 音效，3s 后调用 `game/end_mutate`
- [x] 感染期登机窗口转化驱离：
  - `escape/helicopter_boarding_tick.mcfunction`（每秒）：`execute as @a[tag=state.boarding,tag=infected.common] run function escape_island:escape/boarding_convert_kick`
  - `escape/boarding_convert_kick.mcfunction`：按登载路线传送回直升机坪 / 船坞 / 潜艇 marker 附近，再 `tag @s remove state.boarding` + `gamemode adventure @s` + `title @s actionbar {"text":"§c感染爆发——你被驱离"}`
  - 同样在 `ship_boarding_tick.mcfunction` 和 `sub_tick.mcfunction` 加入相同检测；`_helicopter_depart` / `_ship_go` / `_sub_go` 出发前再兜底检查一次
  - `escape/boarding_check.mcfunction`：成功撤离时清除 `state.infected_period` 和 `infect_time`，保证载具离开后不再触发转化驱离
- [x] 自测菜单增加：`[测试：全员转化结局]`
- [x] 自测菜单增加：`[测试：感染期登载驱离]`（给自己 state.boarding + 短感染期倒计时）
- [x] 自测菜单增加：`[测试：感染期起飞成功]`（感染期已登机但转化前起飞，验证成功撤离）
- [x] 自测菜单增加：`[测试：船艇感染期撤离]`（感染期已登船/艇但转化前离开，验证轮船/潜艇成功撤离）

验收:
- [x] 全部幸存者转化 → 3 秒内 Bad End，不等 15:00
- [x] 感染期玩家登机，窗口内转化 → 立刻被踢回载具附近，成为场上感染者
- [x] 感染期玩家登机，转化前飞离 → 计为成功撤离
- [x] 上述逻辑对轮船 / 潜艇同样生效

### Batch 5 — 幸存者 10 职业技能

状态: **Batch 5 职业实现已完成；运动员、船医、船长、工程师、机修工、神父已通过游戏内手测**

目标: 所有职业的主动技能均可在训练模式下触发和冷却，被动 tick 效果生效。

#### 命名空间与文件结构规则

参照运动员（`skill:athlete/`）格式，所有职业技能均在 `skill:` 命名空间实现：

```
data/skill/function/<职业>/
  init.mcfunction                      ← 注册所有 scoreboard，调用各技能 config
  tick.mcfunction                      ← 每秒分发各技能 tick
  cleanup_non_<职业>.mcfunction        ← 玩家失去职业 tag 时清理技能物品与状态
  <技能名>/
    config.mcfunction                  ← 所有可调参数（hotbar 槽、CD 刻数、时长、效果等级）
    init.mcfunction                    ← 注册技能专属 scoreboard
    use.mcfunction                     ← advancement 奖励入口（revoke → 守卫 → 分支）
    start.mcfunction                   ← 技能实际触发（给效果、设冷却、更新道具）
    tick.mcfunction                    ← 计时倒计时与 lore 刷新（若有持续效果）
    item_ready.mcfunction              ← 恢复就绪技能道具到对应 hotbar 槽
    item_cooldown.mcfunction           ← 宏函数：$item replace … lore "冷却剩余 $(sec) 秒"
data/skill/advancement/<职业>/<技能>/
  use.json
```

- ?? tag ???? `role.xxx`?? `tag=role.doctor`???????????? tag?
- 被动效果单独写在 `escape_island:role/tick_<职业>.mcfunction`，不放入 `skill:` 技能函数
- `escape_island:game/_make_<职业>.mcfunction` 末尾调用 `function skill:<职业>/init`
- 所有右键一次性触发技能统一使用 `consume_item` advancement + `consumable.consume_seconds:0` 模式（不用 `using_item`，因部分物品无原版右键动画）；ensure_item pattern 在 tick 中补回道具

#### 运动员（athlete）— 已完成，仅需接入

`data/skill/function/athlete/` 中滑铲（slide_tackle）+ 肾上腺素（adrenaline）已完整实现。

- [x] `escape_island:game/_tick_20.mcfunction` / `training/_tick_20.mcfunction`：将运动员职业 tag 统一为 `role.athlete`
- [x] `escape_island:function/load.mcfunction`：删除旧机动职业冷却 scoreboard 注册（运动员 scoreboard 已由 `skill:athlete/init` 注册）
- [x] 从旧 `skill:common/cooldown_tick` 移除废弃机动职业冷却递减
- [x] 确认 `data/minecraft/tags/function/tick.json` 包含 `skill:athlete/tick`
- [x] 训练发套件、正式分配、重置、转化清理均接入 `athlete`
- [x] 运动员游戏内手测通过

#### 船医（doctor）— 解毒针（antidote）

**触发**：`consume_item`，道具 `minecraft:tipped_arrow`（`consumable.consume_seconds:0`，`custom_data.skill:"doctor_antidote"`）

`data/skill/function/doctor/antidote/config.mcfunction`：
```
scoreboard players set #hotbar_slot    skill.antidote_cfg  6      # hotbar 槽
scoreboard players set #cooldown       skill.antidote_cfg  1800   # 90s
scoreboard players set #self_cooldown  skill.antidote_cfg  1800   # 自救同 CD
scoreboard players set #range          skill.antidote_cfg  5      # 治愈范围（格）
scoreboard players set #max_charges    skill.antidote_cfg  3      # 最大携带数
scoreboard players set #regen_cd       skill.antidote_cfg  1800   # 自动补给周期 90s
```

关键逻辑：
- 在 `use.mcfunction` 中：先检查 `@s[tag=state.infected_period]` → 自救分支；否则 `execute at @s as @a[tag=state.infected_period,tag=team.human,distance=..5,sort=nearest,limit=1]` → 清除感染期
- 自救分支：清除 `state.infected_period`，给本人短暂 Resistance（后续 spore_load 清零），消耗 1 份道具（scoreboard `antidote_charges` -1）
- 道具数量由 `antidote_charges` scoreboard 追踪，冷却结束时 tick 检测 `antidote_charges < #max_charges` → +1

**被动**（`escape_island:role/tick_doctor.mcfunction`）：
- `spore_threshold` 写入 130（普通 100）：`execute as @a[tag=role.doctor] run scoreboard players set @s spore_threshold 130`

#### 船长（captain）— 哨子（whistle）

**触发**：`consume_item`，道具 `minecraft:goat_horn`（`consumable.consume_seconds:0`，`custom_data.skill:"captain_whistle"`）

`data/skill/function/captain/whistle/config.mcfunction`：
```
scoreboard players set #hotbar_slot  skill.whistle_cfg  6
scoreboard players set #cooldown     skill.whistle_cfg  2400   # 120s
scoreboard players set #duration     skill.whistle_cfg  300    # 15s (给效果时长)
scoreboard players set #range        skill.whistle_cfg  8
scoreboard players set #speed_amp    skill.whistle_cfg  1      # Speed II
scoreboard players set #strength_amp skill.whistle_cfg  0      # Strength I
```

关键逻辑：
- 触发后：`execute at @s as @a[tag=team.human,tag=!state.dead,distance=..8]` → `effect give @s minecraft:speed 15 1 true` + `effect give @s minecraft:strength 15 0 true`（含自身）
- 播放 goat_horn 音效给使用者（原版音效节省资源包）

**被动**：kit 中给船长皮革甲（`attribute @s minecraft:armor base set 4`）

#### 工程师（engineer）— 微型电池（battery）

**触发**：`consume_item`，道具 `minecraft:redstone_torch`（`consumable.consume_seconds:0`，`custom_data.skill:"engineer_battery"`）

`data/skill/function/engineer/battery/config.mcfunction`：
```
scoreboard players set #hotbar_slot  skill.battery_cfg  6
scoreboard players set #cooldown     skill.battery_cfg  1200   # 60s
scoreboard players set #duration     skill.battery_cfg  1200   # 60s 持续
scoreboard players set #range        skill.battery_cfg  4      # 4 格半径
```

关键逻辑：
- 触发后：`summon minecraft:marker ~ ~ ~ {Tags:["skill.battery.marker","skill.battery.active"],CustomName:'{"text":"engineer_battery"}'}` 在玩家脚下
- 设置 `battery_timer` scoreboard；tick 每秒 -1，归零后 remove marker
- 任务系统（Batch 7）中检测距 `skill.battery.marker` ≤4 格时修复速度 ×3（覆盖原本 ×2 工程师被动）
- 同时上限 1：`execute if entity @a[tag=skill.battery.active]` 则不能再放
- 拆除：若同一工程师在 2 格内 sneak+use → 清除 marker，返还道具（`function skill:engineer/battery/recall`）

**被动**（Batch 7 中接入）：`tag=role.engineer` 在修复点旁时速度 ×2

#### 海军陆战队员（marine）— 压制射击（suppress）

**触发**：`shot_crossbow`，弩须有 `custom_data.skill:"marine_suppress"`

`data/skill/function/marine/suppress/config.mcfunction`：
```
scoreboard players set #hotbar_slot  skill.suppress_cfg  5     # hotbar 槽（与 M-7 分开）
scoreboard players set #cooldown     skill.suppress_cfg  900   # 45s
scoreboard players set #range        skill.suppress_cfg  5
scoreboard players set #slow_amp     skill.suppress_cfg  2     # Slowness III
scoreboard players set #slow_dur     skill.suppress_cfg  120   # 6s = 120 tick
```

关键逻辑：
- `shot_crossbow` advancement 条件：`item.components.custom_data.skill = "marine_suppress"`
- 触发后：前方约 5 格锥形范围内感染阵营目标 → `effect give @s minecraft:slowness 6 2 true`（包含母体和感染者，不含幸存者）
- 弩使用无伤害箭（`custom_data.item:"suppress_bolt"`）作弹药，不消耗但可触发 advancement

**被动**：
- kit 中给全套皮革甲
- 枪械精通：海军陆战队员持 M-7 手枪时，潜行右键会快速射空当前弹匣。该被动使用 M-7 的非弩载体（`minecraft:sugar` + `item_model="ie:glock_gun"`），与主动技能 `压制射击` 完全分离。

#### 厨师（chef）— 热汤（hot_soup）

**触发**：`consume_item`，道具 `minecraft:mushroom_stew`（`food.can_always_eat:true` + `consumable.consume_seconds:0`，`custom_data.skill:"cook_soup"`；使用后用 `use_remainder` 触发进度并立即回写技能物品）

`data/skill/function/chef/hot_soup/config.mcfunction`：
```
scoreboard players set #hotbar_slot  skill.soup_cfg  6
scoreboard players set #cooldown     skill.soup_cfg  2400   # 120s
scoreboard players set #heal_amp     skill.soup_cfg  3      # instant_health amplifier 3 ≈ 4 心
scoreboard players set #aura_range   skill.soup_cfg  8
scoreboard players set #priority_range skill.soup_cfg 5
scoreboard players set #priority_hp  skill.soup_cfg  8
scoreboard players set #infect_pause skill.soup_cfg  8
```

关键逻辑：
- 触发后：检查冷却 → 优先选择 5 格内感染期队友，其次 5 格内 HP ≤ 8 队友，否则自愈
- 目标获得 `effect give @s minecraft:instant_health 1 3 true`（约 8 HP = 4 心）；若目标处于感染期，只把 `infect_time` +8 秒并回血，不清除感染期
- 在玩家位置播放 `minecraft:entity.generic.drink` 音效 + 心形/村民快乐粒子
- Batch 5 先实现自用版（给自身）；后期扩展汤锅放置留给 Batch 10+

**被动**（`escape_island:role/tick_chef.mcfunction`）：
- `effect give @s minecraft:night_vision 3 0 true`
- 8 格内非厨师幸存者每 5 秒刷新 `minecraft:absorption 6 0 true`。当前全员不会消耗饱食度，所以不再使用饱和恢复。

#### 通讯员（radio）— 信号扫描（signal_scan）

**触发**：`consume_item`，道具 `minecraft:compass`（`consumable.consume_seconds:0`，`custom_data.skill:"radio_signal_scan"`）

> ⚠️ 原版指南针无右键动画，`using_item` 不会触发。必须用 `consume_item` + `consumable.consume_seconds:0`。

`data/skill/function/radio/signal_scan/config.mcfunction`：
```
scoreboard players set #hotbar_slot  skill.signal_scan_cfg  6
scoreboard players set #cooldown     skill.signal_scan_cfg  2400   # 120s
scoreboard players set #glow_dur     skill.signal_scan_cfg  100    # 废弃配置，保留兼容旧计分项
```

关键逻辑：
- 触发后：给使用者打临时 `skill.radio.viewer`，再对 `infected.common`、`state.infected_period`、猎手母体（`infected.mother` + `state.mutated`，且非 `state.disguised`）输出私有 `tellraw` 距离区间报告
- 不使用 `glowing`，也不使用目标头顶粒子；目标不会被全员看见，母体也不会收到通讯员报告
- `/particle ... force <viewers>` 只能解决“谁能看见”，不能解决远距离和穿墙问题，因此不作为通讯员主侦察手段
- 隐藏母体（`team=mother_hidden`）和伪装母体（`state.disguised`）不进入异常报告；单人测试人偶的感染者/母体会进入报告，方便训练模式验证

**被动**：近距离准心对准其他玩家时显示公开职业；隐藏/伪装母体显示为幸存者，暴露母体/感染者显示为信号异常

#### 病毒学家（virologist）— 检测剂（detector）

**触发**：`consume_item`，道具 `minecraft:potion`（`!minecraft:use_remainder` + `consumable.consume_seconds:0`，`custom_data.skill:"viro_detector"`）

> 船医解毒针也用 `tipped_arrow`，但 `custom_data` 不同，advancement 条件可区分。

`data/skill/function/virologist/detector/config.mcfunction`：
```
scoreboard players set #hotbar_slot  skill.detector_cfg  6
scoreboard players set #cooldown     skill.detector_cfg  900    # 45s
scoreboard players set #range        skill.detector_cfg  6
scoreboard players set #warn_dur     skill.detector_cfg  60     # 3s 警告窗口
```

关键逻辑：
- 触发后：`execute at @s if entity @a[tag=infected.mother,tag=!state.disguised,distance=..6]` OR `execute at @s if entity @a[tag=infected.common,distance=..6]` OR `if entity @a[tag=state.infected_period,distance=..6]`
- 任一条件为真 → `title @s title {"text":"⚠ 异常生命体征","color":"red","bold":true}` + 播放 `minecraft:block.bell.use` 音效
- 无目标时 → `title @s actionbar {"text":"未检测到异常","color":"gray"}`

**被动**：tick_mother.mcfunction 金色粒子已实现

#### 机修工（mechanic）— 机关陷阱（trap）

**触发**：`consume_item`，道具 `minecraft:tripwire_hook`（`consumable.consume_seconds:0`，`custom_data.skill:"mechanic_trap"`）

`data/skill/function/mechanic/trap/config.mcfunction`：
```
scoreboard players set #hotbar_slot  skill.trap_cfg  6
scoreboard players set #cooldown     skill.trap_cfg  1800   # 90s（充能时间=CD，非持续）
scoreboard players set #range        skill.trap_cfg  125    # 约 1.25 格触发半径
scoreboard players set #slow_amp     skill.trap_cfg  1      # Slowness II
scoreboard players set #slow_dur     skill.trap_cfg  80     # 4s = 80 tick
scoreboard players set #glow_dur     skill.trap_cfg  600    # 30s glowing
scoreboard players set #max_traps    skill.trap_cfg  3      # 场上最多 3 个
```

关键逻辑：
- 触发后：在玩家脚下 `summon minecraft:marker ~ ~ ~ {Tags:["skill.trap.marker"]}` + 绿粒子标记（幸存者可见）
- 充能：最多 3 次充能，场上最多 3 个陷阱；充能不满时每 90 秒恢复 1 次
- tick：`execute as @e[tag=infected.mother] at @s if entity @e[tag=skill.trap.marker,distance=..1.25,limit=1]` → 触发效果 + kill marker
- 同样检测 `tag=infected.common`
- 幸存者不触发；感染者阵营可 sneak+use 拆除
- 感染者机修工（转化保留）补发"感染者陷阱"（`custom_data.skill:"mechanic_infected_trap"`）

**被动**（Batch 8 中接入）：`tag=role.mechanic` 在直升机/轮船修复点旁时速度 +30%

#### 神父（priest）— 十字架（cross）

**触发**：被动，`entity_hurt_player` advancement（受到伤害时检查）

`data/skill/function/priest/cross/config.mcfunction`：
```
scoreboard players set #night_vision_amp  skill.cross_cfg  0    # 夜视 I
scoreboard players set #night_vision_dur  skill.cross_cfg  3    # 每秒刷新
```

关键逻辑：
- `entity_hurt_player` advancement 条件：`player.nbt` 含 `Tags:["role.priest","skill.priest.cross.active"]`
- `use.mcfunction`：检查 `@s[tag=skill.priest.cross.active]` → 给 Resistance 255 1 tick（阻断致死伤害）→ remove skill.priest.cross.active tag → 清除 `state.infected_period` → clear 十字架物品（`clear @s minecraft:nautilus_shell 1`）→ 粒子 + 钟声
- 感染期阻断：在 `tick_priest.mcfunction` 中：`execute as @a[tag=role.priest,tag=state.infected_period,tag=skill.priest.cross.active]` → 同上清除流程
- `_make_priest.mcfunction` 给 `tag skill.priest.cross.active` + `minecraft:nautilus_shell`（自定义命名）

**被动**（`escape_island:role/tick_priest.mcfunction`）：
- `execute as @a[tag=role.priest,tag=!state.dead] at @s run effect give @s minecraft:night_vision 3 0 true`

---

#### Batch 5 实现任务清单

运动员接入（已有代码，仅改引用）：
- [x] `escape_island:game/_tick_20` / `training/_tick_20`：运动员职业 tag 统一为 `role.athlete`
- [x] `escape_island:function/load`：删除旧机动职业冷却注册
- [x] `skill:common/cooldown_tick` 移除废弃机动职业冷却递减
- [x] 正式分配、训练套件、重置、转化清理接入 `athlete`
- [x] 运动员游戏内手测通过

船医：
- [x] `data/skill/function/doctor/{init,tick,cleanup_non_doctor}.mcfunction`
- [x] `data/skill/function/doctor/antidote/{config,init,use,start,tick,item_ready,item_cooldown}.mcfunction`
- [x] `data/skill/advancement/doctor/antidote/use.json`（`consume_item` + `custom_data.skill:"doctor_antidote"`）
- [x] `escape_island:role/tick_doctor.mcfunction`（被动 spore_threshold）
- [x] 船医游戏内手测通过

船长：
- [x] `data/skill/function/captain/{init,tick,cleanup_non_captain}.mcfunction`
- [x] `data/skill/function/captain/whistle/{config,init,use,start,tick,item_ready,item_cooldown}.mcfunction`
- [x] `data/skill/advancement/captain/whistle/use.json`
- [x] 船长游戏内手测通过

工程师：
- [x] `data/skill/function/engineer/{init,tick,cleanup_non_engineer}.mcfunction`
- [x] `data/skill/function/engineer/battery/{config,init,use,start,tick,item_ready,item_cooldown,recall}.mcfunction`
- [x] `data/skill/advancement/engineer/battery/use.json`
- [x] 工程师游戏内手测通过后再进入海军陆战队员实现

海军陆战队员：
- [x] `data/skill/function/marine/{init,tick,cleanup_non_marine}.mcfunction`
- [x] `data/skill/function/marine/suppress/{config,init,use,start,tick,item_ready,item_cooldown}.mcfunction`
- [x] `data/skill/advancement/marine/suppress/use.json`（`shot_crossbow`）
- [x] `data/skill/function/marine/gun_mastery/*`（被动：持 M-7 潜行右键快速射空弹匣）
- [x] `data/skill/advancement/marine/gun_mastery/use.json`（`using_item` + `custom_data.weapon:"pistol"`）

厨师：
- [x] `data/skill/function/chef/{init,tick,cleanup_non_chef}.mcfunction`
- [x] `data/skill/function/chef/hot_soup/{config,init,use,start,tick,item_ready,item_cooldown}.mcfunction`
- [x] `data/skill/advancement/chef/hot_soup/use.json`
- [x] `escape_island:role/tick_chef.mcfunction`（被动夜视 + 5格队友热餐护盾）

通讯员：
- [x] `data/skill/function/radio/{init,tick,cleanup_non_radio}.mcfunction`
- [x] `data/skill/function/radio/signal_scan/{config,init,use,start,tick,item_ready,item_cooldown,report_line}.mcfunction`
- [x] `data/skill/function/radio/inspect/{tick,show}.mcfunction`
- [x] `data/skill/advancement/radio/signal_scan/use.json`（`consume_item` + compass）

病毒学家：
- [x] `data/skill/function/virologist/{init,tick,cleanup_non_virologist,passive}.mcfunction`
- [x] `data/skill/function/virologist/detector/{config,init,use,start,tick,item_ready,item_cooldown}.mcfunction`
- [x] `data/skill/advancement/virologist/detector/use.json`

机修工：
- [x] `data/skill/function/mechanic/{init,tick,cleanup_non_mechanic}.mcfunction`
- [x] `data/skill/function/mechanic/trap/{config,init,use,start,tick,item_ready,item_cooldown}.mcfunction`
- [x] `data/skill/advancement/mechanic/trap/use.json`
- [x] 机修工游戏内手测通过后再进入神父实现

神父：
- [x] `data/skill/function/priest/{init,tick,cleanup_non_priest}.mcfunction`
- [x] `data/skill/function/priest/cross/{config,init,use,item_ready}.mcfunction`
- [x] `data/skill/advancement/priest/cross/use.json`（`entity_hurt_player`）
- [x] `escape_island:role/tick_priest.mcfunction`（被动夜视 + 感染期检查）
- [x] 神父游戏内手测通过

所有职业共用：
- [x] `skill:init.mcfunction` 调用所有 9 个新职业 + athlete 的 `init`
- [x] `skill:tick.mcfunction` 中为每个职业调用 `function skill:<职业>/tick`
- [x] 每个 `kit_<职业>.mcfunction` 开头调用对应 `function skill:<职业>/init`（确保 scoreboard 就绪后给道具）

验收: 训练模式下切换各职业，确认每个技能至少一次触发、一次冷却中被拒绝（actionbar 提示）；被动效果每秒生效。

### Batch 6 — M-7 手枪系统

状态: **已实现并通过静态检查，等待游戏内手测**

目标: 基于组员 demo 验证出的右键手枪输入框架实现 M-7；保留全员开局反抗能力；具体载体不限定为 sugar，可按实现手感替换；弹匣、装填、命中和伤害均由玩法函数结算，不采用原版弩伤害/一发一装填规则。

任务:

- [x] 手枪 demo 规格确认：`minecraft:sugar`，显示名 "克洛格"，`item_model="ie:glock_gun"`，`consumable.consume_seconds=0`，`use_cooldown.seconds=0.2`，`on_consume_effects` 播放 `ie:gunshot`。这是参考实现，不是最终载体限制。
- [x] 选定最终手枪载体：当前使用 `minecraft:sugar` + `item_model="ie:glock_gun"` + `custom_data.weapon="pistol"` + `custom_data.mag`。
- [x] `kit_*` 函数中全员开局给格洛克手枪 + 9mm 弹药 8 发；替换旧 crossbow 临时载体。
- [x] 海军陆战队员 kit：格洛克手枪 + 9mm 弹药 24 发。
- [x] 接入手枪玩法入口：`weapon/pistol/fire`、`weapon/pistol/reload_start`、`weapon/pistol/reload_finish`、`weapon/pistol/tick`。
- [x] 手枪玩法层读取 `custom_data.weapon = "pistol"`、弹匣剩余、装填状态和 9mm 弹药数量；开火/换弹同 tick 补回手枪。
- [x] 右键开火；F 键或空匣右键进入 2 秒装填；海军陆战队员保留潜行右键枪械精通；0.2 秒是输入冷却，实际扣弹/伤害按 0.4 秒门控。
- [x] 命中结算按目标类型分流：普通目标 6 damage；母体 4 damage 基础值；幸存者/感染期互相无伤，感染者/母体不可使用枪械。
- [x] 音效、枪口粒子、命中粒子均在玩家当前位置执行，避免声音留在触发点。
- [x] 验收: 开发沙盒中右键有枪模型/枪声反馈，枪不被消耗；可射击 8 发、空匣不能造成伤害、装填 2 秒、消耗 9mm 弹药、命中母体/感染者/幸存者符合阵营伤害规则。

### Batch 7 — 任务系统

状态: **已重构为 5 塔信号网络并通过单人测试**

目标: 5 座信号塔（4边+1核）形成网络，全局 100 触发直升机。发电机改为支线加速。

#### 7A — 信号塔修复

- [x] `signal_tower_tick.mcfunction` / `signal_tower_hold.mcfunction` / `signal_tower_repair.mcfunction`：
  - 检测玩家是否在 `marker.signal_tower` 2.5 格内 + 持有线缆（`custom_data.item="cable"`）
  - 使用线缆长按右键检测（`using_item` advancement + 近距离 marker 检查）
  - 完成一段 → `signal_progress ++` → 广播进度 + bossbar 更新
  - 中断条件: 受伤、离开范围、松开互动或放下线缆 → 当前阶段清空；已完成阶段不回退
  - 工程师在范围内: 速度 +50%；工程师电池在范围内: 每段约 2 秒
  - 感染期玩家修复速度 -50%
  - `signal_progress >= tunable.signal_stages` → 广播"信号塔修复完成" → 写入 `$game signal_done 1`
- [x] bossbar `escape_island:signal`：`signal_progress / tunable.signal_stages`，全员可见；进入直升机阶段后隐藏
- [x] 线缆道具：`custom_data.item = "cable"`；开发/测试通过 `task/give_cable.mcfunction` 给与
- [x] 线缆正式投放：loot_basic 概率 + `guarantee_supplies` 信号塔下方保底箱

#### 7B — 发电机启动

- [x] `generator_tick.mcfunction` / `generator_tick_one.mcfunction` / `generator_use.mcfunction`：
  - 玩家靠近 `marker.generator` + 持有燃料电池（`custom_data.item="fuel_cell"`）并面向发电机右键投入；每台发电机独立记录投入数
  - 小人数局需 2 块燃料电池，标准局需 3 块；全图保底至少 4 块
  - 投满后进入 10 秒预热，再进入稳定运行倒计时
  - 稳定运行时间按人数缩放：4–7 人 45 秒，8–12 人 60 秒，13+ 人 75 秒
  - 发电机启动后，玩家靠近发电机且副手为空时，副手临时替换为发电机交互器；离开范围自动移除
  - `team.infected` 玩家使用发电机交互器对发电机长按右键 → 暂停稳定倒计时并逐步积累过载；约 10 秒连续破坏才会打满
  - 幸存者使用发电机交互器对发电机长按右键 → 降低过载；故障状态下长按维修后重新预热
  - 技术限制: 空手右键实体只有单次点击事件，没有持续按住信号；真实长按必须通过 `using_item` + 可使用物品检测
  - `gen_overload >= 20` → 发电机熄火并进入故障状态；已投入燃料全部保留，不需要重新投入电池
  - 故障状态下幸存者靠近并长按维修，清空过载后重新进入 10 秒预热 / 稳定运行
  - 稳定运行倒计时完成 → 写入 `$game gen_done 1`
- [x] bossbar `escape_island:gen`：预热/稳定/故障阶段显示对应进度；进入直升机阶段后隐藏
- [x] actionbar 显示当前发电机预热、稳定倒计时、过载压力、维修进度，避免玩家不知道为什么倒计时暂停
- [x] 开发自测菜单接入：`test/generator_setup`、`test/generator_as_survivor`、`test/generator_as_infected`
- [x] 燃料电池正式投放：loot_basic 概率 + `guarantee_supplies` 发电机下方保底箱

#### 7C — 旧版：信号塔 + 发电机完成 → 直升机呼叫

- [x] `phase_check.mcfunction` 检查 `$game signal_done = 1 AND $game gen_done = 1`
  - → 广播"天边开始发白，直升机正在靠近……"
  - → `heli_countdown = tunable.helicopter_countdown`
  - → `escape/helicopter_call.mcfunction`
- [x] `check_helicopter_ready.mcfunction` 负责防重复呼叫与阶段推进
- [x] 呼叫直升机时隐藏信号塔/发电机/轮船/潜艇 bossbar，仅保留 `escape_island:heli`

#### 7D — 轮船修复（可选，后续批次）

暂缓，先跑通主线直升机路线后再实现。

验收: 旧版开发沙盒中通过自测菜单跑完信号塔 + 发电机 → 直升机广播出现；感染者靠近发电机可长按破坏并积累过载，过载熄火后幸存者长按维修即可恢复，不需要重新投入电池。7A/7B/7C 已游戏内手测通过；新版 5 塔信号网络待 Batch 13 实现。

### Batch 8 — 直升机撤离与结局

状态: **已实现并通过游戏内手测**

目标: 完整直升机路线：呼叫→倒计时→到达→登机→结算。

任务:

- [x] `escape/helicopter_call.mcfunction`:
  - 从 4 个 `marker.heli_pad` 中随机选 1 个，广播坐标
  - 选定降落点；倒计时最后 5 秒召唤 Animated Java 直升机模型并从远处飞入
  - 启动 `heli_countdown`
- [x] `escape/helicopter_tick.mcfunction`（每秒运行）:
  - `heli_countdown --`
  - bossbar `escape_island:heli` 更新
  - `heli_countdown <= 0` → `escape/helicopter_arrive.mcfunction`
- [x] `escape/helicopter_arrive.mcfunction`:
  - 广播"直升机降落！60 秒内上机！"
  - 召唤覆盖直升机整体的 `interaction` 实体作为右键登机判定
- [x] `escape/helicopter_door_interact.mcfunction`:
  - 右键直升机检测玩家阵营
  - 感染者：告知无法登机
  - 幸存者（含感染期）：给 `state.boarding` tag，并切旁观等待起飞
  - 登机倒计时 60s 后所有 `state.boarding` 玩家 → `state.escaped` + gamemode spectator
  - 满足胜利条件（至少 1 人撤离）→ `game/end_helicopter.mcfunction`
- [x] `game/end_helicopter.mcfunction`:
  - 广播结局字幕（"幸存者已撤离……"）
  - `in_game = 0`，清理所有 bossbar
  - 所有人进入结算
- [x] 直升机飞入 / 起飞动画第一版：`heli_motion` 每 tick 移动模型，起飞结束后清理模型并结算
- [x] 登机窗口调整为 60 秒；直升机整体 interaction 右键登机
- [x] 动态破晓：直升机接近/登机阶段每秒 `time add 120`，天色随倒计时渐亮
- [x] 验收: 开发沙盒中手动触发直升机路线，跑完完整流程，确认结算

### Batch 9 — 其余撤离路线与结局

状态: **进行中（9A 轮船路线待游戏内手测；轮船节奏待 Batch 13 平衡重构）**

轮船路线：
- [x] 收集本局所需船舶部件（默认 5 个：螺旋桨、燃油泵、舵机连杆、启动电瓶、锚机绞盘）→ 在 `marker.ship_dock` 附近手持对应部件长按右键投入；重复部件不计数
- [x] 站立修复进度 +1/s；工程师/机修工/微型电池提供修复加成；普通感染体 -1/s，母体 -2/s；满 100 → 30s 登船窗口
- [x] 登船判定：生成 `entity.ship_door` interaction，幸存者右键登船并进入 `state.boarding`；倒计时结束后 `state.boarding` → `state.escaped`，至少 1 名幸存者 → `end_ship`
- [x] 自测菜单接入：`test/ship_route_setup`，含快速到 95 进度、感染者干扰/幸存者切换按钮

潜艇路线：
- [x] 实验室感染研究员（HP 30，phase_3 自动生成于 `marker.mob_lab_researcher`）击杀掉落身份卡碎片（`lab_card_fragment`）
- [x] 4 张碎片 → `lab_terminal` 合成「实验室钥匙卡」（避免 recipe schema 变更影响 `/reload`）
- [x] 持钥匙卡站 `marker.lab_sub` 旁右键 → `sub_activate` → `submarine_depart`：45s 倒计时 + 登艇门
- [x] 右键登艇 → `board_sub` → 倒计时结束 `_sub_go` → `end_lab`
- [x] 菜单：`[快速潜艇]` + `[放标记: 潜艇]`

自爆路线：
- [x] 持 3 份普罗米修斯文件 + 信号塔完成 + `island_bomb` marker → 手持文件长按右键 30s（有面罩 15s）
- [x] `bomb_hold.mcfunction`：`using_item` advancement 每 tick +1，满 600 → `bomb_activate`
- [x] 激活后 3 分钟倒计时（`bomb_countdown=180`，每秒 -1，bossbar 显示）
- [x] `end_destroy` 已完成
- [x] 菜单：`[放标记: 自爆装置]` + 预览粒子

母体伪装结局（暂缓，不计入 v0.1 必做）：
- [ ] 实验室冷库终端 + 2 张母体专属身份卡碎片 → 伪装试剂 X-7
- [ ] 服用后 `state.disguised`，登载扫描 8 秒，病毒学家检测剂可破解
- [ ] `end_disguise`

病毒变异 Bad End：
- [x] 15:00 时间到 + 无人撤离 → `phase_5_mutate`：全员 darkness+slowness → `force_infect` → 20s 后 `end_mutate`
- [x] `phase_check` 已接入 `phase_timer >= 18000` 触发

### Batch 10 — 物资系统与 loot table

状态: **掉落表、开箱与基础物资道具已实现；多人效果待 Batch 14 回归**

目标: 地图上的物资箱可正常开启，掉落基础物品。注意：本批次只代表“能开箱、能掉落”，不代表所有物资道具的主动/被动功能已经完成。

任务:

- [x] `loot_table/world/basic_supply.json`：线缆 40w + 燃料电池 25w + 9mm 弹药 40w(1-2/抽) + 铁剑 5w + 空 40w；2-4 抽/箱
- [x] `loot_table/world/rare_supply.json`：线缆 50w(1-2) + 燃料电池 30w + 9mm 弹药 18w(6-8) + 铁剑 25w + 空 27w；2-3 抽/箱
- [x] `loot_table/world/keynote.json`：主任笔记 2w + 普罗米修斯文件 6w + 空 2w；1-2 抽/箱
- [x] `task/lab_research_killed.mcfunction` 直接发放身份卡碎片，并 20% 概率给防毒面具
- [x] `task/place_loot_chests.mcfunction`：在所有 `marker.loot_*` 处 setblock 箱子 + loot insert 注入对应 loot table
- [x] `start.mcfunction` + `start_test.mcfunction` 开局自动调用 `place_loot_chests`
- [x] 自测菜单：`[放标记: 普通物资]`/`[稀有物资]`/`[关键线索]` + `[脚下放物资箱]` 单人测试
- [x] 去掉面包（饱食度常驻无意义）
- [x] 急救包（载体：`glowstone_dust`）：右键回复 4HP
- [x] 信号燃焰 / 信号枪：右键或发射后标记附近感染体，并给予短暂 glowing / slowness
- [x] 应急手电筒（载体：`lantern`）：断电时手持给自己与 3 格内队友局部夜视
- [x] 急救冷藏箱 / 高级医疗物资：右键清除感染期，未处于感染期时退还
- [x] 防毒面具：背包持有或戴在头上时打 `has_gas_mask` tag，并在环境孢子 / 自爆终端等逻辑中生效
- [x] 烟雾弹 / 闪光弹：已进入物资投放并接入右键效果
- [x] 验收: 单人开箱测试通过，基础掉落分布符合预期；道具功能细项在 Batch 14 回归

### Batch 11 — 环境事件

状态: **已实现**

目标: 抢修期内每 2 分钟随机触发一个环境事件。

任务:

- [x] `event/pick_event.mcfunction`：每 2 分（`tunable.environment_event_minutes`）随机 0-4 触发
- [x] `event/blackout.mcfunction`: 全员 `darkness` 60s
- [x] `event/radio_static.mcfunction`: 乱码 title + 音效 30s
- [x] `event/storm.mcfunction`: 雷雨 90s + `storm_tick` 每 20tick 扣 1 HP
- [x] `event/spore_burst.mcfunction`: 随机幸存者位置孢子粒子 + 5 格内无防毒面具幸存者 +15 spore
- [x] `event/hallucination.mcfunction`: 随机玩家 nausea + 紫色粒子

### Batch 12 — 人数缩放与收尾

状态: **基本完成**

目标: 4–20 人局自动调整参数。

任务:

- [x] `game/start.mcfunction` + `start_test` 调用 `util/apply_scaling`
- [x] `util/apply_scaling.mcfunction`：感染期 40-55s / 旧版信号塔阶段 3-7 按人数；新版信号网络缩放待 Batch 13 更新
- [x] 小人数局船医保证：`role/_assign_doctor_guaranteed` 已接
- [ ] 潜伏宿主: 暂缓（新版母体不可复活，需重审）
- [ ] 完整流程压测

### Batch 13 — 主线节奏重构：5 塔信号网络 + 轮船线平衡

状态: **13A/13B 已实现；13C 轮船平衡 + 13D 验收待实现**

目标: 解决 4 人测试开局流程过快的问题。直升机路线从“单信号塔 + 发电机硬门槛”改为 5 塔信号网络；发电机变为支线奖励；轮船线改为中速物流路线，既能成为替代胜利，也不会因为抱团站船坞而瞬间完成。

#### 13A — 5 塔信号网络

- [x] 边塔 `marker.signal_tower`，核心塔 `marker.signal_tower` + `marker.signal_core`
- [x] 每塔 `signal_local` 0–100（边）/ 0–150（核），完成后 `marker.signal_done` 防重复
- [x] 边塔 1.0s +1→+25；核心塔用 150 目标等效 1.5s→+50
- [x] 多人：1 人 1.0/s、2 人 ~1.5/s、3 人 ~2.25/s、4+ 人 2.5/s
- [x] bossbar 显示全局 0–100，actionbar 显示当前塔/核心塔进度
- [x] 线缆为工具，不按点消耗但修完塔扣 1 根
- [x] 感染者/变异母体站塔旁→完全暂停修复
- [x] `signal_progress >= 100` → `signal_done = 1` → 直升机呼叫

#### 13B — 发电机改为支线奖励

- [x] `check_helicopter_ready` 只要求 `signal_done = 1`
- [x] `gen_done = 1` 用途：直升机倒计时 -15s + 信号修复 +25%
- [x] 发电机其余逻辑不变

#### 13C — 轮船线平衡重构

- [x] 部件数量保持按人数缩放
- [x] 船舶部件刷点强制分散：开局将所需部件（3/4/5）随机分散注入不同 `marker.loot_basic` 物资箱
- [x] 船体修复总进度 100
- [x] 修船多人叠加：1→1、2→1.6、3→2.1、4+→2.5/s（和信号塔一致，10 tick 循环实现）
- [x] 工程师/机修工/电池加成：已接入，各 2.5/10 tick（~25%），受团队上限约束
- [x] 感染者压制：普通感染者 -0.5/s（5/10 tick），母体 -1/s
- [x] 轮船旧版固定登船窗口：已有；Batch 17H 将改为 45/50/60 秒缩放窗口

#### 13D — 测试与验收

- [x] 自测菜单：`[快修信号塔]` 旧版设边塔99/核心塔149，`[放标记: 核心信号塔]` 放核心塔，`[跳 Phase 3]` 直接进抢修；Batch 17A 将核心快修阈值同步为 99
- [x] 单人完整流程：放全标记→单人开局→跳P3→修1核+2边→直升机登机→破晓→结算
- [ ] 4 人测试：不走轮船不修发电机时，6 分钟内不应触发直升机
- [ ] 4 人分兵：修发电机+多塔并行，约 6–8 分钟完成
- [x] 自测菜单新增 `[测试：轮船4人验收]`，用于单人快速准备 4 人参数和分散投放检查
- [ ] 回归测试：轮船/潜艇/自爆/坏结局/清理沙盒/枪械精通均不受影响

### Batch 14 — 物资箱道具功能收口

状态: **已实现，待多人 / 整局回归**

目标: 把物资箱中开出的道具从“能拿到”补成“能正常使用”。本批次优先处理会影响正常局体验的消耗品、投掷物和被动物品；母体伪装结局暂缓，不抢 v0.1 主线收口优先级。

#### 14A — 医疗与防护道具

- [x] 急救包：右键即时治疗，消耗 1 个；幸存者/感染期可用，母体/普通感染者是否可用按 BALANCE 最终确认
- [x] 高级医疗物资 / 急救冷藏箱：清除感染期或大幅降低孢子污染；必须有稀有度限制，避免船医职业失去价值
- [x] 防毒面具：背包持有时获得 `has_gas_mask`，实验室孢子伤害、自爆终端读条、环境孢子事件读取该 tag
- [x] 医疗道具使用时提供私人 actionbar 和音效，避免玩家不知道是否生效

#### 14B — 视野与断电道具

- [x] 应急手电筒：断电事件期间，手持者和 3 格内队友获得短夜视刷新
- [x] 手电筒不应在非断电状态提供永久夜视，避免稀释黑夜压迫
- [x] 断电事件结束后清除手电筒临时效果，避免残留

#### 14C — 投掷 / 控场道具

- [x] 烟雾弹：投掷后在落点生成 5 秒烟雾区，区域内给予黑暗/遮蔽效果；投掷者和队友不应完全免疫，但天赋可减免
- [x] 闪光弹：投掷后小范围致盲，避免穿墙大范围误伤；母体/感染者可被影响
- [x] 信号燃焰 / 信号枪：命中或落点附近标记感染体，给予 glowing + slowness 约 5–8 秒
- [x] 钢丝陷阱若进入物资池，必须和机修工职业陷阱区分强度，避免普通玩家抢走职业特色

#### 14D — 投放与经济

- [x] 更新 basic / rare loot table，使实际掉落项和 BALANCE 一致：急救包、手电筒、烟雾弹、闪光弹、9mm、线缆、燃料电池、铁剑等
- [x] 控制总量：一局物资箱中的烟雾/闪光/信号燃焰总量约够全队 2 次正面遭遇，不应变成无限控场
- [x] 更新物品命名、lore、`custom_data.item`，保证任务物品和战斗物品不会误判
- [x] 自测菜单增加：给急救包、给手电筒、给烟雾弹、给闪光弹、给信号燃焰、防毒面具状态检查

验收:

- [ ] 单人自测：每个物资道具可触发、可消耗或保持、效果持续和冷却符合设计
- [ ] 多人自测：烟雾/闪光/信号燃焰不会误伤到不可控程度，也不会对母体完全无效
- [ ] 断电事件中，手电筒能提供局部安全感；断电结束后不残留夜视
- [ ] 防毒面具能被实验室/自爆相关逻辑读取
- [ ] 物资箱开出的所有非剧情道具都有实际用途；没有“看起来有用但无功能”的废道具

### Deferred — 母体伪装结局与结局优先级收口

状态: **暂缓，不计入 v0.1 必做**

目标: 后续补齐 GDD / BALANCE 中的母体伪装试剂 X-7 彩蛋路线，并确认所有结局优先级不会互相抢结算。彩蛋路线不要求容易触发，因此排在主玩法、物资道具和天赋之后。

暂缓任务:

- [ ] 实验室冷库终端 `marker.lab_disguise` 可交互，只有母体可推进 X-7 路线
- [ ] 母体专属身份卡碎片 ×2 与幸存者实验室身份卡碎片分离，避免互相抢资源
- [ ] 合成 / 获取伪装试剂 X-7，服用后给予 `state.disguised`，持续 90 秒
- [ ] 伪装期间关闭感染者可见特征；对幸存者侦测只显示“幸存者/信号正常”，不直接暴露母体
- [ ] 直升机 / 轮船 / 潜艇登载时进入 8 秒扫描，扫描通过触发 `end_disguise`
- [ ] 扫描期间全员收到“生物识别异常”模糊提示；幸存者攻击或病毒学家检测剂可打断
- [ ] 结局优先级实现: 母体伪装通过扫描 > 毁灭岛屿真结局 > 直升机/轮船/潜艇幸存者撤离 > 病毒变异
- [ ] 自测菜单增加：给母体 X-7、强制伪装、快速扫描通过/打断

暂缓验收:

- [ ] 母体可从冷库终端拿到 X-7，并在 90 秒内登载触发母体彩蛋胜
- [ ] 未伪装母体不能登载；普通感染者不能登载
- [ ] 病毒学家检测剂可在扫描期间打断伪装
- [ ] 幸存者正常登机/登船/登艇结局不受伪装代码影响

### Batch 15 — 天赋系统 v0.1：人格牌组

状态: **已实现（最小闭环：scoreboard/tag/菜单/auto_assign/tick/show/clear 均已接入；游戏内手测待回归）**

目标: 将 GDD / BALANCE 的新版天赋系统落成可玩版本。v0.1 只做单局人格牌组，不做长期成长和复杂 UI；核心目标是让每局构筑和命运牌带来随机性，但不破坏母体隐藏和任务节奏。

#### 15A — 数据结构与选择流程

- [x] 新增天赋 scoreboard / tag 命名规范：`talent.core.*`、`talent.branch.*`、`talent.fate.*`（已在 `load.mcfunction` 注册）
- [x] Pre-game 大厅增加天赋选择入口：`talent/menu.mcfunction`，每人选 1 个核心人格 + 2 个支线人格
- [x] 未选择玩家开局自动分配默认通用天赋，避免卡开局（`talent/auto_assign.mcfunction`，在 `start` / `start_test` 调用）
- [x] 开局随机补 1 张命运牌（`talent/random_fate.mcfunction`）
- [ ] 母体觉醒时将已选人格翻到母体面（暂缓，v0.1 只需幸存者面）

#### 15B — v0.1 天赋池

- [x] 核心人格先实现 4 个：化险为夷（safe）、破窗余势（breakaway）、临危专注（focus）、旧讯号（old_signal）
- [x] 支线人格每条路线先实现 2 个：救援（rescue）、修理（repair）、牵制（kite）、情报（info）
- [x] 命运牌先实现 4 个（`talent/random_fate.mcfunction` 随机分配 fate 1–4）
- [x] 位移/追逐类统一接 `talent_exhaustion`；救援类接 `talent_rescue_cd`；情报类接 `talent_info_cd`
- [x] `talent/tick.mcfunction` 接入 `_tick_20`，管理冷却倒计时

#### 15C — 信息安全与母体面

- [x] 情报类天赋不直接显示母体姓名（`pick_branch_info.mcfunction` 只给方向/距离段提示）
- [ ] 母体面效果（暂缓，v0.1 主玩法优先）
- [ ] 感染者继承天赋感染回声（暂缓）

#### 15D — 自测与平衡

- [x] 自测菜单增加：`[人格牌组]` 选择菜单、`[测试：天赋写入]` 验证核心/支线/命运牌和冷却（`test/talent_smoke.mcfunction`）
- [ ] 4 人局平衡压测（待整局回归后进行）
- [x] 天赋关闭时，原有职业/任务/撤离路线仍能正常运行（天赋 scoreboard 独立，不影响现有系统）

### Batch 18 — 生涯 / MVP / 专精系统

状态: **已实现最小闭环（scoreboard 注册、award_xp、award_mastery、update_level、mvp compute/select、career/settle 接入 game/settle、career/profile 查看；游戏内手测待回归）**

目标: 在主玩法、结算与天赋基础池稳定后，加入长期成长和每局高光反馈。编号为后续批次，实际执行应排在 Batch 17 主闭环和 Batch 15 天赋基础池稳定之后。生涯系统只解锁称号、徽章、天赋选择范围和预设栏位，不提供永久伤害、移速、生命、修理速度或感染效率。

#### 18A — 数据结构与持久化

- [ ] `load.mcfunction` 注册长期 scoreboard：
  - `career_xp`
  - `career_level`
  - `mastery_rescue`
  - `mastery_repair`
  - `mastery_kite`
  - `mastery_info`
  - `mastery_infect`
  - `career_mvp_total`
- [ ] 注册每局 scoreboard：
  - `mvp_score`
  - `mvp_survivor_score`
  - `mvp_infected_score`
  - `match_repair_score`
  - `match_rescue_score`
  - `match_kite_score`
  - `match_info_score`
  - `match_infect_score`
- [ ] `game/start` 清空所有 `match_*` / `mvp_*` 本局分数；不清空 `career_*` / `mastery_*`
- [ ] 新增 OP debug 函数：
  - `career/debug/show`
  - `career/debug/reset_self`
  - `career/debug/reset_all`

#### 18B — 贡献计分接入

- [ ] 修理贡献：
  - 信号塔本地进度每 10 点给 `match_repair_score +4`
  - 完成一座塔给额外 `mvp_survivor_score +25`
  - 船体修复每 10 点给 `match_repair_score +4`
  - 投入船舶部件给 `match_repair_score +15`
- [ ] 救援贡献：
  - 解毒针 / 备用疫苗清除感染期给 `match_rescue_score +35`
  - 厨师热汤暂停转化救援给 `match_rescue_score +20`
  - 护送感染期队友成功撤离给 `match_rescue_score +40`
- [ ] 牵制贡献：
  - 控制 / 击退猎手母体按事件给 `match_kite_score +10..25`
  - 被追击后存活时间按上限折算，避免绕圈刷分
- [ ] 情报贡献：
  - 通讯扫描有效报告给 `match_info_score`
  - 隔离扫描得到异常结果给 `match_info_score +20`
- [ ] 感染贡献：
  - 母体使玩家进入感染期给 `match_infect_score +35`
  - 完成转化给 `match_infect_score +45`
  - 普通感染者参与污染 / 击倒给 `match_infect_score +10..30`
  - 压制任务点每 10 秒给 `match_infect_score +8`

#### 18C — MVP 判定

- [ ] `career/mvp/compute_scores.mcfunction`：
  - 将 `match_*` 分类分合成 `mvp_score`
  - 幸存者玩家写入 `mvp_survivor_score`
  - 感染阵营玩家写入 `mvp_infected_score`
- [ ] `career/mvp/select_global.mcfunction`：选出全局 MVP
- [ ] `career/mvp/select_survivor.mcfunction`：选出幸存者 MVP（人数足够时显示）
- [ ] `career/mvp/select_infected.mcfunction`：选出感染 MVP（感染阵营有人时显示）
- [ ] 高光奖项：
  - 最佳救援
  - 最佳修理
  - 最佳牵制
  - 最佳情报
  - 最佳猎手
  - 最佳感染者
  - 绝境生还
  - 岛屿之心

#### 18D — XP / 专精结算

- [ ] `career/award_xp.mcfunction`：
  - 完整胜利 +100 XP
  - 惨胜 / 部分撤离 +70 XP
  - 阵营失败但坚持到终局 +40 XP
  - 真结局 +120 XP
  - 清剿胜利 +100 XP
  - 全局 MVP +50 XP
  - 阵营 MVP +35 XP
  - 高光奖项 +20 XP
- [ ] `career/award_mastery.mcfunction`：根据 `match_*` 给对应专精 XP
- [ ] 每局基础生涯 XP 软上限 220；真结局可到 260
- [ ] `career/update_level.mcfunction`：按 BALANCE 等级阈值更新 `career_level`
- [ ] 达成新等级 / 新专精等级时给私聊提示，不全图刷屏

#### 18E — 天赋依赖生涯

- [ ] 天赋菜单读取 `career_level` 和 `mastery_*`：
  - 默认开放每条路线基础核心 / 支线人格
  - 对应专精 Lv.2 解锁额外支线人格
  - 对应专精 Lv.4 解锁高级核心人格或命运牌变体
  - 生涯 Lv.5 解锁第 2 套天赋预设
  - 生涯 Lv.15 解锁第 3 套天赋预设
- [ ] 未解锁天赋在菜单中显示为灰色，并提示所需专精 / 生涯等级
- [ ] 天赋槽数量固定为 1 核心 + 2 支线 + 1 命运牌，不随生涯提升
- [ ] 已解锁天赋数值不随生涯提升

#### 18F — 结算面板与大厅档案

- [ ] `game/settle` 末尾调用 `career/settle`
- [ ] 结算面板显示：
  - 结局名称
  - 完整胜利 / 惨胜 / 母体胜 / 真结局
  - 全局 MVP
  - 阵营 MVP
  - 高光奖项
  - 每名玩家本局主要贡献标签
  - 本局获得 XP / 专精 XP
  - 新解锁的称号 / 天赋 / 预设
- [ ] 大厅新增生涯 NPC 或菜单：
  - 查看生涯等级 / XP
  - 查看五类专精
  - 查看最近 MVP / 高光
  - 查看称号 / 徽章
  - 查看天赋解锁状态

#### 18G — 防刷与验收

- [ ] 同一目标 90 秒内反复救援计分递减
- [ ] 同一任务点反复中断 / 回滚不重复给完成奖励
- [ ] 同两名玩家之间污染-治疗循环设计分冷却
- [ ] 玩家点赞每局最多 +25 XP（若实现点赞）
- [ ] 旁观 / 已结算玩家不再累积 `match_*`
- [ ] 4 人局完整结算：能选出全局 MVP 和至少 1 个高光奖项
- [ ] 8 人局完整结算：能选出全局 MVP、幸存者 MVP、感染 MVP
- [ ] 新玩家无生涯等级时仍可选择基础天赋并正常开局
- [ ] 高等级玩家只拥有更多可选天赋 / 预设，不获得永久局内属性优势

### Batch 17 — v0.2 玩法平衡重构

状态: **实现已完成，待整局游戏内回归（17A–17L 已落地；整局节奏验收仍需多人实测）**

目标: 解决 v0.1 暴露出的几项关键平衡问题，统一为 v0.2 玩法基线。本批次不改动地图 marker 结构，只改函数行为和 scoreboard 数值，保证现有自测沙盒和正式地图都不需要重摆 marker。

设计来源: `docs/GDD.md` v0.2 / `docs/BALANCE.md` v0.2 已同步；本批次只做实现落地。BALANCE.md §七 信号网络末尾保留了"信号网络（旧版 v0.1，已归档）"小节，便于实现时对照差异。

#### 17A — 信号网络节奏重构

- [x] `util/apply_scaling.mcfunction`：写入新数值
  - `tunable.signal_edge_progress = 25`（不变）
  - `tunable.signal_core_progress = 25`（**v0.1 是 50**）
  - `tunable.signal_side_tick_seconds = 2.0`（**v0.1 是 1.0**）
  - `tunable.signal_core_tick_seconds = 1.5`（不变）
  - `tunable.signal_team_cap_2p = 125`、`_3p = 140`、`_4p = 150`（**v0.1 是 160/210/250**）
  - `tunable.signal_global_target = 100`（不变）
- [x] `task/signal_tower_tick.mcfunction` / `signal_tower_repair.mcfunction`：
  - 边塔每段读条改为 `signal_side_tick_seconds × 20 tick`（默认 40 tick）
  - 核心塔每段读条改为 `signal_core_tick_seconds × 20 tick`（默认 30 tick）
  - 完成时全局 +`signal_edge_progress` / `signal_core_progress`
  - 多人速率乘子改用新 cap（按修复点上玩家数读 `signal_team_cap_*`）
- [x] `task/_signal_complete.mcfunction`：核心塔完成不再单独写入 `+50`，统一走 `+signal_core_progress`
- [x] bossbar 文案更新：原"信号网络 X/100"保留；自测菜单 `[快修信号塔]` 阈值更新为 99/99（不再 99/149）
- [x] 自测菜单新增：`[快修边塔到 99]`、`[快修核心到 99]` 各自分开，便于验证两条路径

#### 17B — 发电机奖励强化

- [x] `task/generator_complete.mcfunction`（或现有 gen_done 写入处）：
  - 仍写入 `$game gen_done = 1`
  - 新增 `scoreboard players set $game power_buff 1`
  - 直升机倒计时仍由 `check_helicopter_ready` 读 `gen_done` 后改 75s
- [x] `task/signal_tower_repair_tick.mcfunction` + `task/ship_dock_tick.mcfunction`：
  - 检测 `$game power_buff matches 1` → 当前修复速率 ×1.2（实现上可在每段 tick 末尾以 6/5 加权）
  - 与团队上限叠加：先算团队 cap，再乘 power_buff 乘子
- [x] `game/phase_4_escape.mcfunction`：进入 Phase 4 时清除 `power_buff`，避免后期还在加速无意义任务点
- [x] `tunable.power_buff_multiplier = 120`（÷100，作为整数化乘子）

#### 17C — 母体伪装期被动重构

- [x] 新建 `mother/passive_disguise.mcfunction`，由 `tick_mother.mcfunction` 在 `team=mother_hidden AND !state.disguised` 分支每秒调用
- [x] 被动孢子脉冲：
  - 使用 `mother.passive.target` tag + `mother_passive_stick` 追踪连续贴近同一幸存者；连续 6 秒后才启动脉冲
  - `cd_mother_passive_spore` 每秒 -1；归零时按 `tunable.mother_passive_pulse_dmg` 给目标增加孢子污染，并设回 10（秒）
  - 给予受影响者极弱心跳/污染提示；自测菜单已有 `[伪装贴身孢子]`
- [x] 侵蚀光环（修复降速）：
  - 在 `signal_tower_repair_tick.mcfunction` / `ship_dock_tick.mcfunction` 末尾计算修复贡献时，检测隐藏母体 3 格侵蚀光环 → 该 tick 修复贡献 ×0.85
  - 信号塔用 `progress *= 17; progress /= 20`；轮船用累计误差近似 0.85，避免 1 点贡献被整除为 0
- [x] 侵蚀光环（心跳音）：
  - 受影响幸存者每 4 秒触发一次极轻 `entity.warden.heartbeat`（音量 0.15，pitch 0.8）
  - 用 `cd_aura_heartbeat` 个人 scoreboard 节流，避免每秒重复
- [x] 侵蚀光环（文字反馈）：
  - 受影响修复者每 12 秒最多 1 次 actionbar `信号受污染`
  - 不显示来源，不直接暴露母体
- [x] 旧"+2/s"代码清理：`tick_mother.mcfunction` 已无每秒 +2 spore 旧实现

#### 17D — 普通感染者污染值调整

- [x] `interaction/on_hit_by_infected.mcfunction`：每次有效命中由 `+35` 改为 `+27`
- [x] `tunable.infected_spore_hit = 27`（开局写入）
- [x] 自测菜单 `[+35污染]` 按钮改名为 `[+27污染]`（可选，便于读数对齐）

#### 17E — 厨师热汤 v0.2 调整

- [x] `data/skill/function/chef/hot_soup/config.mcfunction`：
  - `#cooldown` 由 3600 → **2400**（120 秒）
  - 新增 `#aura_range = 8`（被动光环范围）
  - 新增 `#priority_range = 5`（优先治愈队友半径）
  - 新增 `#priority_hp = 8`（队友 HP 阈值，含 ≤）
- [x] `data/skill/function/chef/hot_soup/use.mcfunction` + `start.mcfunction`：
  - 先 `execute at @s if entity @a[tag=team.human,tag=state.infected_period,distance=..5,sort=nearest,limit=1] run` → 优先释放在该队友（暂停转化倒计时 8s + 回复 4 心，不清除感染期）
  - 其次 `execute at @s if entity @a[tag=team.human,scores={hp_current=..8},distance=..5,sort=nearest,limit=1] run` → 释放在低血队友
  - 否则自愈
- [x] `escape_island:role/tick_chef.mcfunction`：被动光环范围 5 → 8 格；吸收 I 每 5 秒刷新

#### 17F — 通讯员转化保留重设计

- [x] 旧版"虚假扫描"方案废弃：真实信号扫描保持私发给通讯员本人，不向随机幸存者伪造私报
- [x] 不采用"只给使用者本人假结果"：改为有公共影响的干扰工具
- [x] 新设计落地：通讯员感染后保留 `retained.radio`，获得一次性循环技能道具“污染干扰器”
  - 触发后向附近幸存者广播公共异常噪声（社交压力）
  - 干扰附近扫描站：增加站点冷却并打断正在进行的隔离扫描读条
  - 不篡改 `skill:radio/signal_scan` 的私有结果内容，避免机制穿帮
- [x] 新增道具、advancement 和自测菜单
  - `data/skill/function/radio/jam/*`
  - `data/skill/advancement/radio/jam/use.json`
  - 自测菜单新增 `[测试：通讯员转化保留]`

#### 17G — 多撤离路线并行处理 + 分层胜负

- [x] `escape/_ending_resolve.mcfunction`（新建）：统一结局判定入口
  - 各撤离路线（直升机/轮船/潜艇）的成功登载完成时调用此函数
  - 函数内检查 `$game ending_triggered` 标志位：若已结算，则丢弃后续登载结果（让先到的赢）
  - 同 tick 多次调用按调用顺序优先：直升机 → 轮船 → 潜艇（实现上由各路线注册顺序保证）
- [x] `util/apply_scaling.mcfunction` 写入 `tunable.escape_full_win_count`：
  - 4–7 人 = 1
  - 8–12 人 = 2
  - 13–16 人 = 3
  - 17–20 人 = 4
- [x] `escape/_ending_resolve.mcfunction` 统计 `escaped_survivors`：
  - `escaped_survivors = 0` → 不触发幸存者撤离结局
  - `escaped_survivors < escape_full_win_count` → `escape_result = 1` 惨胜 / 部分撤离
  - `escaped_survivors >= escape_full_win_count` → `escape_result = 2` 完整幸存者胜利
- [x] `escape/helicopter_motion_tick.mcfunction` / `_ship_go.mcfunction` / `_sub_go.mcfunction`：原本直接 `function game/end_xxx` 改为先调用 `escape/_ending_resolve`，再由 resolve 决定是否触发结局函数
- [x] 后到路线保护：各撤离路线在 `ending_triggered` 已置位后不再覆盖 `escape_route`
- [x] 自爆 `bomb_tick.mcfunction`：保持独立倒计时，归零时直接走 `end_destroy`；`end_destroy` 使用 `ending_triggered` 保护结局优先级
- [x] 自测菜单：`[测试：分层撤离结局]`
- [x] 自测菜单：`[测试：多路线结局锁]`

#### 17H — 轮船登船窗口缩放

- [x] `util/apply_scaling.mcfunction` 写入 `tunable.ship_boarding_seconds`：
  - 4–7 人 = 45s
  - 8–12 人 = 50s
  - 13+ 人 = 60s
- [x] `escape/ship_dock_tick.mcfunction` / `ship_depart` 起：登船倒计时初值由硬编码 30s 改为读 `tunable.ship_boarding_seconds`
- [x] 自测菜单增加 `[测试：轮船窗口缩放]`
- [x] BALANCE 表 §一 阶段时间已记录新值
- [x] 游戏内菜单手测通过

#### 17I — 实验室研究员数量缩放

- [x] `util/apply_scaling.mcfunction` 写入 `tunable.lab_researcher_count` / `tunable.lab_card_required`：
  - 4 人 = 3；5–7 人 = 3；8–12 人 = 4；13–16 人 = 4；17–20 人 = 5
- [x] `task/spawn_lab_zombies.mcfunction`：按 `tunable.lab_researcher_count` 限制生成数量
- [x] `task/lab_terminal.mcfunction`：身份卡碎片需求读取 `tunable.lab_card_required`，避免 4 人局 3 个研究员却仍需 4 张卡
- [x] 现有 `marker.mob_lab_researcher` 数量保持不变（4–5 个候选点），生成时随机抽取所需数量；多余候选点不生成实体
- [x] 自测菜单增加 `[测试：研究员数量缩放]`
- [x] 游戏内菜单手测通过

#### 17J — 终局高压

- [x] `phase_check.mcfunction`：`phase_timer = 15000`（T+12:30）且无撤离倒计时进行中 → 调用 `game/final_pressure_start`
- [x] `game/final_pressure_start.mcfunction`：
  - 全员 title / actionbar 提示孢子浓度上升
  - `$game final_pressure = 1`
  - 若母体存活，刷新或缩短一次 `cd_mother_mutate`，让母体获得终局开团窗口
  - 环境事件权重偏向风暴 / 菌丝爆发：延缓，不影响先玩整局
- [x] 15:00 坏结局逻辑保持由 Batch 4.7 / `end_mutate` 处理
- [x] 自测菜单增加 `[测试：终局高压]`

#### 17K — 隔离扫描

- [x] 新增 `scan/*` 函数组：
  - `scan/start.mcfunction`
  - `scan/tick.mcfunction`
  - `scan/resolve.mcfunction`
  - `scan/cancel.mcfunction`
- [x] 可用站点：
  - 中心核心塔 marker
  - `marker.lab_terminal`
  - `marker.ship_dock` 附近医疗箱 / 后续 `marker.scan_station`
- [x] 启动条件：
  - 2 名幸存者参与
  - 目标玩家在站点 3 格内
  - 基础读条 6s；病毒学家参与时 4s
  - 目标离开、参与者离开会取消；受玩家攻击取消待补
- [x] 结果分级：
  - `正常`
  - `孢子异常`
  - `严重异常`
- [x] 母体伪装保护：
  - 伪装母体不能被稳定 100% 验出
  - 刚结束猎手、长期触发侵蚀光环联动待补；当前已保证伪装母体走异常档而非稳定严重异常
- [x] 站点冷却：`tunable.scan_station_cd = 90s`
- [x] UI：扫描读条 bossbar / actionbar；结果只给参与者和目标附近玩家，不全图广播
- [x] 自测菜单：`[测试隔离扫描: 正常]`、`[测试隔离扫描: 异常]`、`[测试隔离扫描: 严重异常]`

#### 17L — 文档一致性扫描

- [x] grep 搜索 `每 3 分钟`、`+2/s`、`+35` 等旧描述；剩余命中均为归档旧版说明、MVP/XP 奖励，或“原 +35”备注
- [x] grep 搜索旧版登船固定窗口、旧版核心塔快修、旧版伪装孢子脉冲、旧版厨师清感染描述；当前 v0.2 正文已同步，旧值仅保留在归档/历史批次说明中
- [x] BALANCE.md §二 母体 HP 备注 ⚠️ 已确认不存在待清理警告

验收:

- [ ] 4 人测试开局，无干扰修信号网络（路径 A）：约 5–6 分钟完成；6 分钟内不应触发直升机
- [ ] 4 人测试开局，无干扰修信号网络（路径 B，跳过核心塔）：约 5.7 分钟，比路径 A 略慢
- [ ] 发电机完成后，重新计时同样的修复路径，应缩短约 1 分钟
- [ ] 母体伪装状态连续贴同一幸存者 6s 后开始脉冲；纯贴身约 100s 才单独触发感染期，叠加其他来源时明显加速；受影响者可收到极弱反馈
- [ ] 母体伪装状态站修复点 3 格内：受影响幸存者修复贡献 ×0.85，并听到极轻心跳；离开范围立刻恢复正常
- [ ] 母体猎手命中 3 次进感染期；普通感染者命中 4 次进感染期（差值符合 v0.2 设计）
- [ ] 厨师 5 格内有感染期队友时，热汤优先作用于该队友，暂停转化倒计时 8s + 回血但不清除感染期；无队友时自愈；冷却 120s
- [ ] 通讯员转化保留：旧版干扰器方案已废弃，待 17F 新设计确定后补验收项
- [ ] 直升机和轮船同时进入登载窗口：先完成飞离/离港结算的路线决定结局，另一路线倒计时清理
- [ ] 8 人局只有 1 名幸存者撤离 → 惨胜 / 部分撤离；2 名及以上撤离 → 完整胜利
- [ ] T+12:30 且无撤离倒计时时触发终局高压；已进入撤离倒计时时不重复触发
- [ ] 隔离扫描 2 人 6s 读条可得模糊结果；病毒学家参与缩短到 4s；伪装母体不被稳定 100% 验出
- [ ] 8 人局轮船修复完成 → 50 秒登船窗口；4 人局 → 45 秒
- [ ] 4 人局实验室生成 3 名研究员；8 人局生成 4 名

### Batch 16 — v0.1 收口压测与文档同步

状态: **待实现**

目标: 实现计划全部功能完成后，不再继续扩功能，集中做覆盖验证、数值回炉和文档同步。通过 Batch 16 才能说“实现计划做完 = v0.1 做完”。

任务:

- [ ] 静态检查：全包 JSON 解析、函数引用扫描、旧文本组件扫描、`git diff --check`
- [ ] 自测菜单完整走查：创建开发沙盒、清理开发沙盒、一键结束游戏、放/清 marker、全部快速路线
- [ ] 4 人正常开局完整局：不使用自测作弊，至少跑通一次直升机或轮船撤离
- [ ] 4 人测试开局完整局：验证新主线不会过快，轮船不会开局秒修
- [ ] 8 人结算抽样：1 人撤离应为惨胜 / 部分撤离，2 人撤离才是完整幸存者胜利
- [ ] 隔离扫描抽样：正常 / 孢子异常 / 严重异常三档均可触发，病毒学家参与缩短读条
- [ ] 终局高压抽样：12:30 未触发撤离路线时生效，已触发撤离路线时不重复打断
- [ ] 母体胜利完整局：击杀/转化胜利、15:00 病毒变异 Bad End 至少各跑通一次
- [ ] 彩蛋路线抽样：自爆用自测菜单跑通一次；母体伪装已暂缓，不计入 v0.1 收口
- [ ] 结局优先级回归：同 tick 多路线触发时只进入一个结局
- [ ] BALANCE 回炉：根据 4 人测试结果调整 `signal_*`、`ship_*`、感染期时长、母体 HP / 冷却
- [ ] MAP_GUIDE 同步：确认正式地图所需 marker 列表、校验输出、放置示例和实际代码一致
- [ ] GDD / BALANCE / IMPLEMENTATION_PLAN 状态统一：删除或标注所有旧版单塔/发电机硬门槛残留说明

验收:

- [ ] 房主可以按 `MAP_GUIDE.md` 放 marker，正常开始 4 人局并完成一整局
- [ ] 实现计划所有非暂缓项均为 `[x]`
- [ ] 暂缓项只剩“母体伪装 / 潜伏宿主 / 长期天赋成长 / 工具化 marker 导出”等不影响 v0.1 闭环的内容

### Batch 19 — 打靶训练场

状态: **已完成可玩闭环（2026-05-08 修订：mannequin 玩家模型靶、全武器命中路由、计时器修正、3 种挑战、重置清理；游戏内手测待回归）**

目标: 在大厅/训练区提供独立的射击训练模式，玩家可用任意武器打靶练手感、测精准度、刷个人最佳分。不依赖正式局 scoreboard，训练结束后数据保留供复玩对比。本批次在 Batch 6 M-7 系统基础上扩展，通过 `range.target` 标签将训练场命中路由到独立结算逻辑，不影响正式局战斗。训练靶使用 `minecraft:mannequin`（原版 1.21.11 玩家模型实体，`immovable:true`）；M-7/AK47 走 pistol 三段射线检测，步枪/霰弹枪/狙击枪在各自 fire.mcfunction 加入靶场分支检测。

#### 19A — 数据结构与入口

- [x] `load.mcfunction` 注册训练场 scoreboard：
  - `range_score`（本局得分）
  - `range_best`（个人最佳得分）
  - `range_hits`（本局命中数）
  - `range_shots`（本局开枪数）
  - `range_combo`、`range_timer`、`range_mode`、`range_lives`、`range_seq`、`range_wave`、`range_target_state`
- [x] 自测菜单新增 `[进入训练场]` / `[退出训练场]` / `[靶场重置]` 按钮
- [x] `range/enter.mcfunction`：
  - 给玩家 `tag range.active`
  - 传送到训练场区域（`marker.range_spawn`）
  - 清空 `range_score`、`range_hits`、`range_shots`；不清空 `range_best`
  - 给 M-7 + 64 发 9mm 弹药（无限练习用）
  - 显示操作提示 actionbar
- [x] `range/exit.mcfunction`：
  - 移除 `tag range.active`
  - 更新 `range_best`（若 `range_score > range_best` 则覆盖）
  - 广播本局结果和个人最佳

#### 19B — 靶标实体

- [x] `range/targets/static_target.mcfunction`：
  - 在 `marker.range_static` 处 summon `minecraft:mannequin`（Steve 皮肤，`immovable:true`），添加 `tag range.target`、`tag range.target.static`
  - 被任意武器命中后路由到 `range/target_hit`，静态靶 +10 分
- [x] `range/targets/moving_target.mcfunction`：
  - 在 `marker.range_moving` 处生成 mannequin（Alex 皮肤），每 tick 根据 `range_target_state` 左右移动
  - 波次越高，移动速度越快；命中移动靶 +20 分
- [x] `range/targets/reaction_target.mcfunction`：
  - 初始隐藏（`range.reaction.hidden` + `Invisible:1b`），40 tick 后弹出
  - 弹出 60 tick 未命中则自动隐藏；隐藏态不会被射线判定；弹出期间命中 +20 分
- [x] `range/targets/sequence_targets.mcfunction`：
  - 5 个靶按顺序编号（`range.seq.1`~`range.seq.5`）；当前序号靶 `Glowing:1b` 高亮
  - 命中当前序号靶 → `range_seq ++`；命中非当前序号靶不计分且提示"顺序错误"
  - 全部命中 → +30 连击加成，序列重置

#### 19C — 命中结算路由

- [x] M-7/AK47/gun_mastery：`raycast_hitbox` 三段射线（头/躯/腿 Y 偏移）优先检测 `tag range.target`，命中 → `range/target_hit`
- [x] 步枪/霰弹枪/狙击枪：各自 `fire.mcfunction` 加入靶场分支；`#hit skill.pistol_tmp` 重置→检测→`on_shot`，精准/生存模式 miss 判定与手枪统一
- [x] 所有路径仅对 `tag range.active` 玩家生效，避免正式局误触发
- [x] `range/target_hit.mcfunction`：
  - 根据靶标 tag 区分靶类型给分：
    - `range.target.static`：+10 分
    - `range.target.moving`：+20 分（移动靶精度奖励）
    - `range.target.reaction`（弹出期间）：+20 分
    - `range.target.sequence`：当前序靶 +15 分（序列全中额外 +30）
  - `range_hits ++`，actionbar 私人显示当前分 / 命中数 / 开枪数 / 连击
  - 播放命中粒子和靶型区分音效

#### 19D — 挑战模式

- [x] `range/mode/precision.mcfunction`（精准挑战）：
  - 限 10 次开枪机会；不限时
  - 每次开枪消耗 `range_timer`，归零后调用 `range/finish`
  - 结算显示得分、命中、开枪数、最佳对比
- [x] `range/mode/timed.mcfunction`（限时挑战）：
  - 30 秒倒计时（`range_timer = 30`，tick 函数每秒 -1）
  - 开始时补给大量 9mm 与 7.62 弹药，保证 M-7/AK47 测试不会被弹药打断
  - 倒计时 bossbar `escape_island:range_timer` 仅对 `tag range.active` 显示
  - 时间到 → 结算；得分排行私人显示
- [x] `range/mode/survival.mcfunction`（生存挑战）：
  - 无时间限制；每 30 秒 `range_wave ++`，移动靶速度提升
  - 任意开枪未命中会扣 1 点生命；3 次未命中结束挑战
  - 难度波次与得分在 actionbar 显示，得分参与 `range_best`
- [x] 自测菜单新增三个模式按钮：`[精准挑战]`、`[限时挑战]`、`[生存挑战]`

#### 19E — 复位与清理

- [x] `range/reset.mcfunction`：kill 所有 `tag range.target` 实体，清空分数/模式/计时/生命/连击/命中/开枪数，重新初始化四类靶
- [x] `range/cleanup.mcfunction`（游戏开始时调用）：确保训练场靶实体全部清除，`tag range.active` 全部移除，并关闭 `escape_island:range_timer`
- [x] `game/start.mcfunction` 与 `game/start_test.mcfunction` 开头调用 `range/cleanup`，避免训练场状态泄漏到正式局
- [x] marker 需求：`marker.range_spawn`、`marker.range_static`、`marker.range_moving`、`marker.range_reaction`、`marker.range_seq_1`~`range_seq_5`；缺少 marker 时会在玩家前方生成 fallback 靶组

验收:

- [ ] 游戏内回归：进入训练场后传送、得到枪弹、分数归零；个人最佳不清零
- [ ] 游戏内回归：4 种靶均可被所有武器（M-7/AK47/步枪/霰弹枪/狙击枪）命中并计分；正式局开火不触发训练场分支
- [ ] 游戏内回归：移动靶持续左右移动；反应靶弹出后 60tick 未命中自动隐藏
- [ ] 游戏内回归：序列靶只有当前靶可得分；全序列命中触发连击加成
- [ ] 游戏内回归：3 种挑战模式各跑通一次：精准（10 发结算）、限时（30s bossbar 结算）、生存（3 次 miss 结束）
- [ ] 游戏内回归：退出训练场时 `range_best` 更新，结果广播，靶标与状态清理干净

---

### Batch 20 — Last Stand 枪战小游戏

状态: **已实现最小闭环（lobby/start/combat_tick/on_death/respawn/end/supply_tick/cleanup/quick_2p + 测试菜单接入；游戏内手测待回归）**

目标: 在大厅提供独立的 PvP 枪战模式，2–8 名玩家使用 M-7 对战，每人 3 条命，最后存活者或得分最高者获胜。使用独立 team `gunfight` 避免与正式局阵营逻辑交叉；结束后完整清理并返回大厅状态。

#### 20A — 数据结构与组局

- [ ] `load.mcfunction` 注册枪战 scoreboard：
  - `gs.lives`（剩余命数）
  - `gs.kills`（本局击杀数）
  - `gs.deaths`（本局死亡数）
  - `gs.score`（本局积分：击杀 +10，存活到最后 +20）
- [ ] 注册 team：`gunfight`（friendlyFire true，collisionRule always，nametagVisibility always，color red）
- [ ] `gunfight/lobby.mcfunction`：大厅中等待区，`tag gs.ready`；自测菜单 `[枪战大厅]`
- [ ] `gunfight/start.mcfunction`：
  - 检查 `@a[tag=gs.ready]` 数量 ≥ 2 才能开始
  - 将所有 `tag gs.ready` 玩家加入 team `gunfight`
  - `gs.lives = 3`（所有参与者）；清空 `gs.kills`、`gs.deaths`、`gs.score`
  - 给每人 M-7 + 16 发 9mm 弹药
  - 传送到竞技场各 spawn 点（`marker.gs_spawn_*`，4 个）
  - 3 秒倒计时后开始（title 显示 3/2/1/Go!）
  - 设 `$game gs_active = 1`

#### 20B — 战斗规则与伤害

- [ ] `gunfight/combat_tick.mcfunction`（每 tick 由 `_tick_1` 调用，仅 `$game gs_active = 1` 时）：
  - 检测 `tag gs.respawn_immune` 玩家（重生无敌）：`gs_immune_timer --`；归零时移除 tag + 移除无敌效果
  - 检测 HP = 0（`scores={hp_rounded=..0}`）且无 `tag gs.dead`：调用 `gunfight/on_death`
- [ ] `gunfight/on_death.mcfunction`：
  - `gs.lives -= 1`
  - 给击杀者 `gs.kills += 1` + `gs.score += 10` + 补 4 发 9mm 弹药（击杀奖励）
  - 广播击杀提示（kill feed）：`tellraw @a[tag=gs.ready] [{"selector":"@s"},{"text":" 被 "},{"selector":"<attacker>"},{"text":" 击倒"}]`
  - `gs.lives > 0`：3 秒后重生（`gs_immune_timer = 60`，重生传送到随机 spawn，给无敌 Resistance 255 + `tag gs.respawn_immune`）
  - `gs.lives = 0`：给 `tag gs.eliminated`，spectator，actionbar"你已出局"
- [ ] `weapon/pistol/fire.mcfunction` 中，`$game gs_active = 1` 分支：
  - 对 team `gunfight` 成员有效命中固定 6 伤害（不读原版 M-7 母体/幸存者分流）
  - `gs.deaths` 由 `on_death` 在被杀者身上结算
- [ ] 重生无敌期间不可受到任何来源伤害（Resistance 255 覆盖）

#### 20C — 结束判定

- [ ] `gunfight/combat_tick.mcfunction` 每秒检查：
  - `@a[tag=gs.ready,tag=!gs.eliminated]` 数量 ≤ 1 → `gunfight/end`
  - 或 `$game gs_timer` 归零（可选时间限制：`gs_timer = 18000` → 5分钟，`_tick_1` 每秒 -20）→ `gunfight/end`
- [ ] `gunfight/end.mcfunction`：
  - `$game gs_active = 0`
  - 最后存活者 `gs.score += 20`（最后存活加成）
  - 结算面板（`tellraw @a` + score display）：
    - 标题：`赢了！XX 是最后的幸存者` 或 `时间到！`
    - 积分排行：前 3 名姓名 + 击杀数 + 积分
    - MVP：`gs.kills` 最高者标注 ⭐ 最佳猎手
  - 全员传送回大厅（`marker.lobby_spawn`）
  - 移除 team `gunfight` 所有成员，清除所有 `gs.*` tag，游戏模式改回 adventure

#### 20D — 竞技场与补给点

- [ ] 补给点 tick（`gunfight/supply_tick.mcfunction`，每秒）：
  - 3 个 `marker.gs_supply` 处各有一个装备箱
  - `gs_supply_timer` 倒计时 500 tick（25s）；归零时刷新为 8 发 9mm 弹药（loot insert）
  - 仅 `tag gs.ready` 玩家可开箱；不阻止 `tag gs.eliminated`（旁观者）观看
- [ ] marker 需求：`marker.gs_spawn_1`~`4`（4 个出生点），`marker.gs_supply_1`~`3`（3 个补给点），`marker.gs_lobby`（等待区）
- [ ] 竞技场建议：封闭空间，有掩体，禁止飞行（`gamemode adventure` 已保证）；建议地图制作时用告示牌标记 spawn 和 supply 位置

#### 20E — 清理与安全

- [ ] `gunfight/cleanup.mcfunction`：
  - kill 所有 `marker.gs_*` 生成的临时实体
  - 清除所有 `gs.*` tag
  - 设 `$game gs_active = 0`
  - team `gunfight` removeAllPlayers（不销毁 team，避免重复注册冲突）
  - 恢复所有受影响玩家的 gamemode → adventure
- [ ] `game/start.mcfunction` 开头调用 `gunfight/cleanup`，避免枪战状态泄漏到正式局
- [ ] 自测菜单：`[快速枪战 (2人)]`（直接将当前玩家 + 1 个测试人偶加入枪战）、`[清理枪战]`

验收:

- [ ] 2 人组局：得到 M-7 + 16 发弹药，传送到各自 spawn，3 秒倒计时后可互相造成伤害
- [ ] 击杀对手：击杀者 +10 积分 +4 弹药；kill feed 广播；对手 3 命扣 1，3 秒后重生并有 3 秒无敌
- [ ] 对手 3 命耗尽：进入旁观，游戏结束，最后存活者 +20 积分，结算面板显示正确
- [ ] 重生无敌期间不可受伤；无敌结束后正常可受伤
- [ ] 补给点 25 秒刷新 8 发弹药；开箱正常消耗弹药
- [ ] 枪战结束后传回大厅，所有 gs.* 状态清除；之后可以正常开始正式局
- [ ] 正式局中 `$game gs_active = 0`，枪战伤害分支不触发

---

### Batch 21 — 武器扩展：步枪 / 霰弹枪 / 狙击枪

状态: **已实现（SR-17 步枪 / SG-5 霰弹枪 / SP-1 狙击枪 全部落地；scoreboard 注册、give/use/fire/reload/tick/advancement 完整；weapon/tick 已接入 rifle/tick；游戏内手测待回归）**

目标: 在 Batch 6 M-7 手枪系统基础上扩展三把武器，形成完整枪械池。武器统一走 `weapon/` 命名空间，主手物品 `custom_data.weapon` 区分类型，伤害/冷却/弹匣均由 datapack 结算，不依赖原版近战或弩弹道。本批次同步更新打靶训练场（Batch 19）和 Last Stand（Batch 20）以支持新武器。

#### 武器规格速查

| 武器 | 道具载体 | `weapon` 值 | 伤害 | 弹匣 | 换弹 | 射速门控 | 特性 |
|---|---|---|---|---|---|---|---|
| M-7 手枪 | `sugar` | `pistol` | 6（母体 4） | 8 | 2.0s | 0.4s | 已实现 |
| SR-17 步枪 | `sugar` variant | `rifle` | 4（母体 3） | 30 | 2.5s | 0.12s | 连射，感染者可伤 |
| SG-5 霰弹枪 | `sugar` variant | `shotgun` | 5×5（母体 4×5） | 6 | 2.0s | 1.0s | 扇形 5 弹，近距叠加 |
| SP-1 狙击枪 | `spyglass` | `sniper` | 14（母体 9） | 5 | 3.5s | — | 右键开镜 / 左键击发 |

弹药：步枪/霰弹枪使用现有 `9mm`（同手枪）；狙击枪使用新弹药 `sniper_round`。

#### 21A — 数据结构

- [ ] `load.mcfunction` 新增 scoreboard：
  - `cd_rifle_fire`（步枪射速门控 per-player）
  - `cd_rifle_reload`（步枪换弹）
  - `cd_shotgun_fire`（霰弹枪射速门控）
  - `cd_shotgun_reload`
  - `cd_sniper_reload`（狙击枪换弹）
  - `sniper_hitbox_owner`（用于 interaction 实体←→玩家绑定，见 21D）
- [ ] `tunable` 写入（`util/apply_scaling.mcfunction`）：
  - `tunable.rifle_damage = 4`、`tunable.rifle_damage_mother = 3`
  - `tunable.shotgun_pellets = 5`、`tunable.shotgun_damage = 5`、`tunable.shotgun_damage_mother = 4`
  - `tunable.sniper_damage = 14`、`tunable.sniper_damage_mother = 9`
- [ ] 弹药道具：`sniper_round`（`custom_data.ammo:"sniper_round"`，载体 `arrow`，display name "狙击弹"）
- [ ] 自测菜单：`[给步枪]`、`[给霰弹枪]`、`[给狙击枪]`

#### 21B — SR-17 步枪

道具载体: `minecraft:sugar`（`custom_data.weapon:"rifle"`，`item_model:"ie:rifle"`，`consumable.consume_seconds:0`，`use_cooldown.seconds:0.1`）

- [ ] `weapon/rifle/fire.mcfunction`：
  - 射速门控：`if score @s cd_rifle_fire matches 1.. → actionbar "冷却中" return`；`cd_rifle_fire` 每 tick -1
  - 弹匣检查：`custom_data.mag <= 0` → `function weapon/rifle/empty_click`（音效提示）return
  - 命中结算：`execute as @a[tag=team.infected,...] at @s positioned ... if entity @s[distance=..30]` 范围内最近目标，伤害 4 / 母体 3
  - 扣弹：`custom_data.mag -= 1`；`cd_rifle_fire = 3`（3 tick ≈ 0.15s 连射间隔）
  - 弹匣归零 → `function weapon/rifle/auto_reload_start`
- [ ] `weapon/rifle/reload_start.mcfunction` / `reload_finish.mcfunction`：同 M-7 结构，换弹 2.5s（50 tick）
- [ ] advancement `weapon/rifle/use.json`：`consume_item` + `custom_data.weapon:"rifle"`
- [ ] `kit_*` 函数：海军陆战队员额外可选配步枪（替换或补充 M-7）

#### 21C — SG-5 霰弹枪

道具载体: `minecraft:sugar`（`custom_data.weapon:"shotgun"`，`item_model:"ie:shotgun"`，`consumable.consume_seconds:0`，`use_cooldown.seconds:0.5`）

- [ ] `weapon/shotgun/fire.mcfunction`：
  - 射速门控：`cd_shotgun_fire` 20 tick（1.0s）
  - 扇形 5 弹：循环 5 次 `execute rotated ~ <随机偏差 ±15°> run ...` 命中结算
    - 每弹独立检测最近目标（距离 ≤ 12）；同一目标最多叠加 5 弹
    - 远距离（> 6 格）：每弹伤害 ×0.6（近距全伤，远距衰减）
    - 实现上用 `random value` 或 5 个固定角度偏移模拟散射
  - 弹匣 6 → 每发扣 1；空匣不能射击
- [ ] `weapon/shotgun/reload_start.mcfunction` / `reload_finish.mcfunction`：换弹 2.0s
- [ ] advancement `weapon/shotgun/use.json`：`consume_item` + `custom_data.weapon:"shotgun"`

#### 21D — SP-1 狙击枪（重点）

道具载体: `minecraft:spyglass`（`custom_data.weapon:"sniper"`，`item_model:"ie:sniper"`）

**状态机：**
- `sniper.unscoped`（默认持枪状态）：使用一个 consumable 道具切换
- `sniper.scoped`（已开镜）：持真 spyglass（原版 FOV 缩放生效），interaction 实体启用
- `sniper.reload`（换弹中）：锁定所有操作

**开镜 / 关镜：**

- [ ] 狙击枪切换载体：
  - **未开镜时**主手为 `custom_data.weapon:"sniper"` + `custom_data.scoped:0b`（仍是 spyglass 物品，但我们用 `using_item` advancement 区分状态）
  - 右键 → `using_item` advancement（`item.components["custom_data"].scoped:0b AND weapon:"sniper"`）→ `weapon/sniper/scope_in`
  - `scope_in.mcfunction`：
    - `item replace entity @s weapon.mainhand with minecraft:spyglass{...custom_data:{weapon:"sniper",scoped:1b}}`（替换为开镜变体）
    - `summon minecraft:interaction ~ ~0.9 ~ {Tags:["sniper.hitbox"],width:0.6f,height:1.8f,response:1b}`
    - `tag @s add sniper.scoped`
    - `effect give @s slowness 999 1 true`（开镜期间移动减速）
    - 私人 actionbar: `开镜中 | 左键击发 | 潜行退镜`

- [ ] `using_item` advancement（`scoped:1b`）触发 `scope_in` 后立即替换道具为 scoped 版本，实际 spyglass 缩放由客户端控制，scoped 版也是 spyglass 物品因此原版 FOV 缩放继续生效

**击发（右键按住 + Shift）：**

> 左键在"使用中"状态被引擎阻断，无法用于击发。确定方案：右键持续按住保持 FOV 缩放，同时按 Shift 触发击发。潜行不会取消望远镜缩放，`Sneaking:1b` 可每 tick 检测。

- [ ] advancement `weapon/sniper/zoom.json`（`using_item`）：
  - 条件：`item.components["custom_data"].weapon = "sniper"`
  - 每 tick 使用中触发 → `weapon/sniper/zoom_flag`
  - advancement 须每 tick 撤销再重颁（`revoke` + `grant`），保证每 tick 均可触发

- [ ] `weapon/sniper/zoom_flag.mcfunction`（as 玩家，每 tick 使用望远镜时）：
  - `scoreboard players set @s sniper_zoom_flag 1`

- [ ] `weapon/sniper/state_tick.mcfunction`（`_tick_1` 中对持狙击枪玩家调用）：
  - `execute if score @s sniper_zoom_flag matches 1 run tag @s add sniper.zooming`
  - `execute if score @s sniper_zoom_flag matches 0 run tag @s remove sniper.zooming`
  - `scoreboard players set @s sniper_zoom_flag 0`（重置，下 tick 由 advancement 重新打）
  - 击发检测：`execute as @s[tag=sniper.zooming,nbt={Sneaking:1b},scores={cd_sniper_bolt=0,cd_sniper_reload=0}] run function weapon/sniper/fire`

- [ ] `weapon/sniper/fire.mcfunction`（as 玩家）：
  - 弹匣检查：`custom_data.mag <= 0` → `weapon/sniper/empty_click` return
  - 命中结算：射线投射检测（距离 ≤ 60 格），伤害 14 / 母体 9
  - 扣弹：`custom_data.mag -= 1`
  - **强制退镜**：`item replace entity @s weapon.mainhand with <bolt_placeholder>`（非 spyglass 占位道具）→ FOV 缩放自动终止，防止 Shift 持续按住连续触发
  - `scoreboard players set @s cd_sniper_bolt 10`（0.5s 拉栓动画）
  - `tag @s remove sniper.zooming`
  - 粒子 + 枪声
  - 弹匣归零 → `weapon/sniper/reload_start`

- [ ] `weapon/sniper/bolt_tick.mcfunction`（`_tick_1` 中对 `cd_sniper_bolt > 0` 玩家调用）：
  - `scoreboard players remove @s cd_sniper_bolt 1`
  - `execute if score @s cd_sniper_bolt matches 0 run` → 若非换弹中则还原狙击枪道具（玩家需重新按右键开镜）

**退镜（松开右键 = 自然退出）：**

- [ ] 松开右键 → `using_item` 不再触发 → `sniper_zoom_flag` 不再被设为 1 → 下一 tick `state_tick` 检测到 flag=0 → `remove sniper.zooming`，无需额外函数
- [ ] 换弹/拉栓期间道具为占位物（非 spyglass），不可开镜，天然阻止缩放

**换弹：**

- [ ] `weapon/sniper/reload_start.mcfunction` / `reload_finish.mcfunction`：
  - 换弹时 `scope_out`（强制退镜）→ 开始 3.5s（70 tick）换弹倒计时
  - 换弹完成：恢复弹匣 5 发，扣 `sniper_round` 数量

#### 21E — 游戏内集成与清理

- [ ] `weapon/pistol/fire.mcfunction` 中检测目标类型时，新增对 `custom_data.weapon:"rifle"` / `"shotgun"` 的分流（避免手枪命中结算影响其他武器）；各武器 fire 函数独立，通过 advancement 路由
- [ ] `weapon/sniper/cleanup.mcfunction`：kill 所有 `tag sniper.hitbox` 实体；清除所有 `sniper.*` tag；供 `game/start`、`gunfight/cleanup`、`range/cleanup` 调用
- [ ] `_tick_20.mcfunction` 新增：`execute as @a[tag=sniper.scoped] run function weapon/sniper/tick`
- [ ] `kit_*`：目前仅手枪；未来可在海军陆战队员 kit 中提供步枪选择，其余职业保持手枪
- [ ] `Last Stand`（Batch 20）：枪战中提供手枪/步枪选择；`gs_active=1` 时步枪/霰弹枪伤害统一 6（与手枪对齐）
- [ ] 打靶训练场（Batch 19）：新增步枪靶道和霰弹枪靶道区域，命中路由检测 `custom_data.weapon` 分别计分

验收:

- [ ] SR-17 步枪：30 发连射（0.15s 间隔），弹匣耗尽自动换弹，换弹 2.5s；命中感染者/母体伤害符合设计
- [ ] SG-5 霰弹枪：5 弹扇形散射，6 格内全伤，12 格外每弹 ×0.6；换弹 2.0s
- [ ] SP-1 狙击枪：右键按住 → FOV 缩小（原版 spyglass 行为）；右键按住 + Shift → 击发；松开右键 → 退镜；弹匣 5 发
- [ ] 击发后强制退镜（道具替换为拉栓占位）；0.5s 拉栓后还原狙击枪；必须重新按右键开镜才能再次击发（防连发）
- [ ] 狙击枪换弹：弹匣耗尽 → 3.5s 换弹 → 弹匣恢复；换弹中道具为占位物，不可开镜
- [ ] 进入正式局：`sniper/cleanup` 清除所有 `sniper.*` tag 和 `sniper_zoom_flag`；新游戏开始后枪械状态干净

---

## 五、自测记录

| 日期 | 批次 | 检查 | 结果 | 备注 |
|---|---|---|---|---|
| 2026-04-27 | 文档初始化 | 新建实施计划 | PASS | 等待 Batch 1 实现 |
| 2026-04-27 | Batch 1 | 全包 JSON 解析 | PASS | `pack.mcmeta` 与所有 `.json` 可解析 |
| 2026-04-27 | Batch 1 | 旧文本组件格式扫描 | PASS | 未发现 `clickEvent`、`hoverEvent`、字符串式 `custom_name/lore/CustomName` |
| 2026-04-27 | Batch 1 | 函数引用检查 | PASS | 所有 `escape_island:` 函数引用均能找到实际文件 |
| 2026-04-27 | Batch 1 | 计数逻辑扫描 | PASS | 已替换已知 `execute as ... return 0` 计数写法 |
| 2026-04-27 | Batch 2 | 全包 JSON 解析 | PASS | `pack.mcmeta` 与所有 `.json` 可解析 |
| 2026-04-27 | Batch 2 | tellraw JSON 解析 | PASS | 新增菜单、沙盒、地图检查文本组件可解析 |
| 2026-04-27 | Batch 2 | 旧文本组件格式扫描 | PASS | 未引入旧 `clickEvent` / 字符串式组件 |
| 2026-04-27 | Batch 2 | 函数引用检查 | PASS | 新增 `dev/*` 引用均能找到实际文件 |
| 2026-04-27 | Batch 2 | 开发 marker 覆盖 | PASS | 共 66 个临时 marker；8 spawn、4 heli、5 spore、20 basic、5 rare、5 keynote、4 researcher |
| 2026-04-27 | Batch 3 | 全包 JSON 解析 | PASS | `pack.mcmeta` 与所有 `.json` 可解析 |
| 2026-04-27 | Batch 3 | tellraw JSON 解析 | PASS | 新增感染测试菜单和状态提示可解析 |
| 2026-04-27 | Batch 3 | 旧文本组件格式扫描 | PASS | 未引入旧 `clickEvent` / 字符串式组件 |
| 2026-04-27 | Batch 3 | 函数引用检查 | PASS | 新增感染测试入口、死亡检测入口均能找到实际文件 |
| 2026-04-27 | Batch 3 反馈修复 | 全包 JSON 解析 | PASS | `pack.mcmeta` 与所有 `.json` 可解析 |
| 2026-04-27 | Batch 3 反馈修复 | 旧格式与旧计时残留扫描 | PASS | 未发现旧文本组件字段、旧心跳音效、旧 tick 倒计时残留 |
| 2026-04-27 | Batch 3 反馈修复 | 函数引用检查 | PASS | 新增 `infection/respawn_tick` 引用可解析 |
| 2026-04-27 | Batch 3 原地倒地/污染预警补丁 | 静态检查 | PASS | JSON 可解析，`git diff --check` 无错误；等待游戏内复测 |
| 2026-04-27 | Batch 4 | 静态检查 | PASS | JSON 可解析，`git diff --check` 无错误；母体速度旧值已清除 |
| 2026-04-27 | Batch 4 反馈修复 | 静态检查 | PASS | `immediate_respawn` 语法、饱食度恢复、母体补血与狂暴 0 分误触发已修复 |
| 2026-04-27 | Batch 5 运动员接入 | 静态检查 | PASS | 运动员接入新 `skill:` 结构；等待游戏内手测 |
| 2026-04-27 | Batch 5 船医解毒针 | 静态检查 | PASS | 新 `skill:doctor/antidote` 结构已接入；等待游戏内手测 |
| 2026-04-27 | Batch 5 船长哨子 | 静态检查 | PASS | 新 `skill:captain/whistle` 结构已接入；等待游戏内手测 |
| 2026-04-27 | Batch 5 工程师微型电池 | 静态检查 | PASS | 新 `skill:engineer/battery` 结构已接入；等待游戏内手测 |
| 2026-04-28 | Batch 6 格洛克手枪 | 静态检查 | PASS | JSON 可解析，`git diff --check` 无错误；等待游戏内手测 |
| 2026-05-04 | Batch 3 感染状态机重构 | 静态检查 + 游戏内手测 | PASS | 母体 80HP/攻击4/2.5s 冷却/擦刀反馈/母巢崩坏/感染者母体死亡后永久死/actionbar 倒计时/清剿胜利均已通过手测 |
| 2026-05-04 | Batch 4 母体属性与攻击冷却 | 静态检查 + 游戏内手测 | PASS | attack_speed 冷却手感/首攻广播/first_attack 清理/mother_dead 计分板注册/自测菜单辅助均已通过手测 |
| 2026-05-04 | Batch 4 Part 2 成长阶段 + 技能 | 静态检查 + 游戏内手测 | PASS | 母体 Phase 1→2→3、腐痕感知/集群嚎叫冷却显示、有效命中降攻速擦刀不叠加 |
| 2026-05-04 | Batch 4.5 测试版开局 + 自测增强 | 静态检查 + 游戏内手测 | PASS | start_test/自测菜单放标记/发光标记预览/常驻回血饱食/吞噬吐人修复/手枪命中/海军连射/变异系统 |
| 2026-05-04 | 文档更新 | — | PASS | 同步 Batch 3/4/4.5 最新状态到 IMPLEMENTATION_PLAN |
| 2026-05-04 | Batch 10 物资系统 | 静态检查 + 单人开箱测试 | PARTIAL | basic/rare/keynote loot table + place_loot_chests + 菜单测试按钮通过；物资道具实际功能移至 Batch 14 |
| 2026-05-08 | Batch 10/14 物资道具收口 | 静态检查 | PASS | 通用道具进度初始化、防毒面具背包/头戴识别、环境孢子免疫、闪光弹致盲、测试菜单信号枪补入口已更新；仍需多人实机回归 |

---

## 六、游戏内手测清单

### Batch 1 + Batch 2 最小手测

1. 执行 `/reload`。
2. 聊天中应出现 `[打开自测菜单]` 和 `[开始游戏]`，两个按钮都应可点击。
3. 点击 `[打开自测菜单]`，应出现自测菜单。
4. 点击 `[创建开发沙盒]`。
5. 预期: 聊天显示临时 marker 数量；进入训练模式；出现职业选择/退出按钮。
6. 点击 `[地图标记检查]`：关键项不应出现红色 `MISS`。
7. 点击 `[选择职业]` 中任一职业：背包只获得该职业套件，玩家只拥有该职业 tag，名称 lore 正常显示。
8. 点击 `[退出训练]`：背包清空，临时实体和 marker 清理。

### Batch 3 感染状态机手测

1. 开发沙盒 → `[感染测试]`
2. `[+27污染]` × 3 → 不进入感染期，actionbar 显示孢子值；到达 50 后本人听到轻微心跳音，其他玩家不可见不可听
3. `[+27污染]` 第 4 次 → 进入感染期，金色名牌，actionbar 显示转化倒计时，心跳音，脚下粒子
4. 等待 45 秒 → 自动转化为感染者，名牌变红
5. `[设为幸存者]` → `[模拟幸存者死亡]` → 原地倒地孢化，不能移动/飞行/交互，actionbar 显示 15 秒倒计时，结束后转感染者
6. `[设为感染者]` → `[模拟感染者死亡]` → 母体存活时 25–30 秒复活倒计时，结束后在母体附近复活
7. `[设为母体]` → `[模拟母体死亡]` → 母体进入母巢崩坏，不复活；感染者随后死亡不再复活
8. `[设为神父]` → `[强制感染期]` → 十字架触发阻断

### Batch 4 母体属性手测

1. `[设为母体]` → 检查 HP = 40 心，成长后最高约 50 心
2. 攻击幸存者：有效攻击冷却约 2.5 秒，冷却中命中播放擦刀反馈但不叠污染
3. 连续 3 次有效命中幸存者：目标进入感染期
4. 使用腐痕感知：附近幸存者脚印显示 5–8 秒，首次使用触发模糊暴露广播
5. 使用集群嚎叫：感染者获得短暂速度和母体方向提示
6. 首次攻击测试人偶：全图出现"有人遭受了突袭"广播，第二次攻击不再广播

### Batch 5 技能手测

对每个职业，验证:
- 技能物品名称 / lore 正常显示
- 右键/放置触发技能，效果正确
- 冷却期间再次尝试触发：被拒绝（actionbar 提示"技能冷却中"）
- 冷却结束后可再次触发

### 游戏内手测记录

| 日期 | 批次 | 测试者 | 结果 | 问题 |
|---|---|---|---|---|
| 2026-04-27 | Batch 1 + Batch 2 | TreeHey | PASS | `/reload`、自测菜单、开发沙盒、地图检查、发套件、刷人偶、退出训练均未发现问题 |
| 2026-04-27 | Batch 3 | TreeHey | FAIL | 初版缺少明确倒计时和感染提示；幸存者转化、感染者/母体复活未按预期体感生效 |
| 2026-04-27 | Batch 3 反馈修复 | 待手测 | PENDING | 已修复倒计时、提示、Tunable 加载顺序、孢子点选择、污染 50 私人预警、幸存者原地倒地孢化，等待二次手测 |
| 2026-04-27 | Batch 4 | 待手测 | PENDING | 已补母体属性、Resistance I、首次攻击广播和 first_attack 清理 |
