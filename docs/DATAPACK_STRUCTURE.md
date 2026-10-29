# DATAPACK_STRUCTURE — 数据包目录导览

这份文档给后续维护者 / agent 快速定位代码用。它描述的是当前数据包目录职责，不替代玩法规格；玩法规则以 [GDD.md](GDD.md) 为准，实现排期以 [IMPLEMENTATION_PLAN.md](IMPLEMENTATION_PLAN.md) 为准，数值以 [BALANCE.md](BALANCE.md) 为准。

## 快速入口

- `pack.mcmeta`：数据包元信息。当前目标为 Java 1.21.x，使用 `min_format: [94, 1]` / `max_format: [94, 1]`，并过滤原版 recipe / advancement。
- `data/minecraft/tags/function/load.json`：加载入口，依次调用 `animated_java:global/on_load`、`escape_island:load`、`skill:init`、`escape_island:game/reload`。
- `data/minecraft/tags/function/tick.json`：tick 入口，调用 `escape_island:tick` 与 `escape_island:player/tick_skills`；后者只在存在活跃玩家时分发技能更新。
- `data/escape_island/function/load.mcfunction`：主 scoreboard / team / bossbar / gamerule 注册入口。
- `data/escape_island/function/tick.mcfunction`：每 tick 主调度；死亡检查、任务读条、状态刷新、训练模式兜底都从这里进。
- `data/escape_island/function/game/_tick_20.mcfunction`：正式局每秒调度；阶段推进、感染/任务/结局、职业 tick 的主要汇合点。
- `data/escape_island/function/game/start.mcfunction`：正式开局。
- `data/escape_island/function/game/start_test.mcfunction`：测试开局。
- `data/escape_island/function/game/settle.mcfunction`：结算与清理。

当前基础重构的模块约定见 [ARCHITECTURE.md](ARCHITECTURE.md)。新增 `function/player/` 管理玩家临时状态和个人计时，`game/result/` 管理结果接受/演出/结束，`game/rules/v01/` 隔离旧时间线。状态清理由 `tools/state_contract.json` 生成，`python tools/check.py` 统一验证。

## 顶层结构

| 路径 | 用途 |
|---|---|
| `docs/` | 设计、数值、实现计划、测试计划和本目录导览。后续改动如果改变玩法规则，先同步这里的对应文档。 |
| `data/` | 数据包实际内容，按 namespace 分为 `escape_island`、`skill`、`animated_java`、`minecraft`。 |
| `mcdoc/` | mcdoc / Spyglass 相关定义或辅助材料，用于编辑器理解命令、storage、数据结构。 |
| `pack.mcmeta` | 数据包元信息和过滤规则。 |
| `spyglass.json` / `data.ajmeta` | 工具配置；通常不要在玩法改动里动它们。 |

## Namespace 总览

| Namespace | 主要职责 | 维护建议 |
|---|---|---|
| `escape_island` | 游戏主流程：开局、阶段、阵营/感染状态、任务、撤离、结局、训练/自测、UI、地图 marker。 | 玩法流程、状态机、任务路线优先在这里找。 |
| `skill` | 职业技能、武器、通用道具、母体技能、特殊感染体技能。 | 具体技能的 `use/start/tick/update_item/config` 逻辑优先在这里找。 |
| `animated_java` | Animated Java 生成的直升机模型与动画函数。 | 视为生成代码，除兼容 wrapper 外尽量不要手改。 |
| `minecraft` | 原版标签入口，目前主要是 `tags/function/load.json` 和 `tick.json`。 | 修改入口顺序时要小心，避免 load/tick 丢注册。 |

## `data/escape_island`

| 路径 | 用途 |
|---|---|
| `advancement/interaction/` | 原版 advancement 触发器，用于右键交互、受击、持有物品、击杀研究员等事件转发到函数。 |
| `dialog/` | 规则菜单、职业说明、天赋、剧情 lore 等对话 JSON。 |
| `function/` | 主玩法函数，详见下一节。 |
| `loot_table/world/` | 世界物资箱：普通补给、稀有补给、关键笔记、保底物资。 |

### `data/escape_island/function`

| 子目录 | 职责 |
|---|---|
| 根目录 | `load.mcfunction`、`tick.mcfunction`、`_tick_20.mcfunction` 等入口/全局调度。 |
| `career/` | 单局/长期成长结算：XP、mastery、MVP 选择、profile、settle。 |
| `debug/` | 管理员调试函数：强制母体、强制阶段、显示状态、地图验证、揭示职业。 |
| `dev/` | 开发沙盒和手测工具：放 marker、切换身份、模拟感染/母体攻击、启动/停止开发局。 |
| `dialog/` | 对话触发入口，连接 `data/escape_island/dialog`。 |
| `escape/` | 撤离路线：直升机、轮船、潜艇、登载、伪装母体登载扫描、撤离结局分流。 |
| `event/` | 环境事件：断电、风暴、无线电杂讯、幻觉、孢子爆发及其结束/持续 tick。 |
| `game/` | 对局生命周期：开局、阶段切换、母体选择、终局高压、结局、随机局变量、结算。 |
| `gunfight/` | 独立枪战小游戏 / Last Stand：开局、复活、补给、死亡、结算。 |
| `infection/` | 感染状态机：污染值、感染期、转化、死亡孢化、感染者复活、母体死亡、不可复活 spectator。 |
| `interaction/` | 受击 advancement 回调：感染者命中、母体命中、首次突袭提示。 |
| `item/` | 预留目录，目前没有函数文件。 |
| `mother/` | 母体主流程补充：伪装期被动孢子/侵蚀光环、感染者里程碑反馈。 |
| `pvp/` | 预留目录，目前没有函数文件。当前 PvP 依靠原版 `team friendlyFire` 与玩法函数过滤。 |
| `range/` | 靶场训练：模式、目标生成、命中反馈、波次、退出清理。 |
| `role/` | 职业分配、职业 kit、职业每秒 tick、母体成长、清人类物品。 |
| `scan/` | 隔离扫描读条、取消、结算，给社交推理提供模糊证据。 |
| `talent/` | 天赋初始化、选择、应用、tick、重置。 |
| `task/` | 主任务系统：信号塔、发电机、船坞部件、实验室、扫描站、自爆装置、物资箱。 |
| `test/` | 菜单化自测函数。这里允许为测试构造状态，但不要把测试状态机复制到正式流程。 |
| `training/` | 非正式局训练 tick、训练 reset、练习装备/职业状态清理。 |
| `ui/` | actionbar、bossbar、孢子条、提示/面板等 UI 层。 |
| `util/` | 通用工具：人数统计、缩放数值、掉落物清理、感染者重计数、地图/marker 工具。 |
| `visual/` | 视觉身份 helper：清头饰、普通感染者头饰、猎手母体头饰、伪装母体/旁观清理。 |

## `data/skill`

| 路径 | 用途 |
|---|---|
| `advancement/` | 技能/武器右键、使用、缩放镜、母体技能等触发器。多数 `use.json` 最终调用同名 `function/.../use.mcfunction`。 |
| `damage_type/` | 自定义枪械伤害类型，如 `pistol`、`ak47`。 |
| `function/` | 职业技能、武器、母体技能、通用道具。 |
| `predicate/` | 移动/输入/姿态判断：WASD、潜行、跳跃、冲刺、滑铲、是否在地面、准心朝向感染体。 |
| `tags/` | 技能相关 block/item 标签，例如子弹可穿透方块、滑铲可通过方块、职业物品、可消耗技能物品。 |

### `data/skill/function`

| 子目录 | 职责 |
|---|---|
| 根目录 | `init.mcfunction` 和 `tick.mcfunction`，负责技能系统初始化和全局技能 tick。 |
| `athlete/` | 运动员：肾上腺素、滑铲、体力条。 |
| `captain/` | 船长：集合哨 / 团队机动相关技能。 |
| `chef/` | 厨师：热汤、汤锅实体、感染期暂停/回血支持。 |
| `clicker/` | 循声者：听觉孢子、追踪移动目标、孢子实体 tick。 |
| `common/` | 通用道具：医疗包、烟雾弹、闪光弹、信号枪、信号照明、油桶、冷冻医疗包等。 |
| `doctor/` | 船医：解毒针、自救/救援、充能与冷却。 |
| `engineer/` | 工程师：电池放置/召回/发电支援。 |
| `marine/` | 海军陆战队员：枪械精通、压制技能、专属命中反馈。 |
| `mechanic/` | 机修工：陷阱放置、召回、触发、感染者保留效果。 |
| `mother/` | 母体技能：变异脉冲、腐痕感知、集群嚎叫、吞噬、突进、X-7 伪装相关。 |
| `priest/` | 神父：十字架祝福、阻断感染期/死亡。 |
| `radio/` | 通讯员：职业查看、异常信号扫描、干扰/误报类逻辑。 |
| `virologist/` | 病毒学家：检测剂、近距被动金粒子、异常检测。 |
| `weapon/` | 武器系统：手枪、AK、霰弹枪、狙击枪，包含弹匣、换弹、射线、头部/身体命中。 |

### 技能目录常见命名

- `config.mcfunction`：技能数值和 hotbar 槽位配置。
- `init.mcfunction`：获得角色/技能时初始化计分项和物品。
- `tick.mcfunction`：每秒或每 tick 状态刷新。
- `use.mcfunction`：advancement 触发后的入口，通常先 revoke advancement，再判断状态。
- `start.mcfunction`：技能真正生效的逻辑入口。
- `cooldown_tick.mcfunction`：冷却倒计时。
- `item_ready.mcfunction` / `item_cooldown.mcfunction` / `update_item.mcfunction`：技能物品显示状态。
- `cleanup_non_<role>.mcfunction`：角色切换、死亡、结算时清理不该保留的物品/状态。

## `data/animated_java`

这是 Animated Java / MC-Build 生成的直升机模型与动画代码。

| 路径 | 用途 |
|---|---|
| `function/global/` | Animated Java 全局 load/tick、UUID、实体栈清理工具。 |
| `function/helicopter/` | 直升机模型 summon、移动、默认姿态、变体、locator、动画帧。 |
| `function/helicopter/animations/` | 直升机门、旋翼等动画。 |
| `function/helicopter/root/on_tick/` | 模型根实体每 tick 变换。 |
| `tags/function/` | Animated Java 自己的 function tag。 |

维护建议：不要在普通玩法改动中大范围编辑生成文件。若发现生成器引用路径缺口，优先加极薄 wrapper，并在注释里说明是兼容层。

## `data/minecraft`

只放原版 namespace 的 function tag。

| 路径 | 用途 |
|---|---|
| `tags/function/load.json` | 数据包加载入口。 |
| `tags/function/tick.json` | 每 tick 调度入口。 |

## 外部依赖

当前世界同级 `datapacks/` 下还有外部依赖：

- `FastMotion`：提供 `motion:apply_scoreboard` 等 motion 库函数。不要在本数据包内新增同名 `data/motion/...` shim 覆盖它。
- `dc_v2.1.0`：外部数据包依赖，改动前先确认其 namespace 和加载顺序。

做函数引用检查时，应该把同级依赖数据包也纳入函数集合，否则会把真实外部函数误判为缺失。

## 状态与职责边界

- 实际 `team` 只负责原版免伤：`survivors`、`infected`、`spectator` 是局内核心队伍。
- 逻辑身份用 tag：例如 `team.human`、`team.infected`、`infected.mother`、`infected.common`、`state.hunting`、`state.infected_period`、`state.dead`、`state.spectator`。
- 对外显示集中走 `escape_island:visual/*`，不要在各处散落头饰替换逻辑。
- 感染/死亡状态集中在 `escape_island:function/infection/`，不要在技能函数里直接复制完整死亡流程。
- 职业 kit 和职业 tick 集中在 `escape_island:function/role/`，技能细节在 `skill:function/<role>/`。
- 任务进度集中在 `escape_island:function/task/`，撤离倒计时和登载在 `escape_island:function/escape/`。

## 函数注释约定

- 新增或修改 `.mcfunction` 时，能写中文注释就写中文注释。
- 注释要解释“为什么这样分支/过滤/清理”，不要重复命令字面意思。
- 每个复杂函数建议在顶部写 1–3 行中文说明：入口是谁调用、`@s` 代表什么、会改哪些关键 tag / scoreboard。
- 对于易踩坑逻辑，靠近命令写短注释，例如“伪装母体实际在 survivors team，不能用 team.infected 判断其可战斗状态”。
- 生成代码、热路径重复命令、纯 item lore 刷新函数可以少写或不写注释，避免噪声。

## 静态检查建议

改完目录或函数引用后至少跑：

```powershell
rg -n "^\s*/" data --glob "*.mcfunction"
rg -n "team join (mother|mother_hidden|infected_period)|team=mother_hidden" data docs
git diff --check
```

如果检查函数引用，需要包含同级依赖数据包（尤其 `FastMotion`），否则 `motion:*` 会被误报。
