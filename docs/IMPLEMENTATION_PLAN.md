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

## 三、实现批次

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

状态: **反馈修复中：污染预警与倒地孢化已补实现，等待游戏内复测**

- [x] 母体/感染者命中增加 `spore_load`（advancement 检测）。
- [x] 阈值到达进入 `state.infected_period`（金色名牌）。
- [x] 感染期玩家仍在幸存者阵营，不能攻击其他幸存者。
- [x] 任意幸存者死亡进入孢化倒计时，然后转感染者。
- [x] 感染者/母体死亡进入各自复活倒计时，并分流到对应复活函数。
- [x] 神父十字架阻断感染期/死亡孢化。
- [x] 感染期、孢化、感染者复活、母体复活均显示 actionbar 秒级倒计时。
- [x] 感染期补齐心跳音、脚下粒子；完全转化感染者补齐绿色孢子粒子（无 glowing）。
- [x] 污染值 ≥ 50 时给本人 actionbar + 轻微心跳音；音效每次在玩家当前位置播放。
- [x] 幸存者死亡进入倒地孢化：每 tick 在当前位置刷新个人重生点，真实死亡后原地立即重生并用隐形 marker 锚定，不进入 spectator，不可自由飞行；玩家本人站在原地僵直并显示 15 秒倒计时，结束后在原地转化为感染者。
- [x] 感染者/母体死亡冷却期间不进入 spectator：原地重生后用隐形 marker 锚定，adventure + 移速 0 + 黑暗/隐形等待复活，避免自由飞行侦察。
- [x] 修复 Tunable 加载顺序。
- [x] 修复孢子点选择使用 marker 实体。
- [x] 名牌变色系统（母体隐藏绿 / 感染期金 / 感染者红）。
- [x] 转化保留系统（retained.* tag 在 turn.mcfunction 中复制）。
- [x] 母体 HP 追踪（data get Health → scoreboard）。
- [x] 母体脱战回血、狂暴检测（tick_mother.mcfunction）。

### Batch 4 — 母体属性与首攻揭示

状态: **已实现，等待游戏内手测**

目标: 母体有正确的战斗属性，首次攻击触发全图广播（不暴露姓名）。

任务:

- [x] `_make_mother.mcfunction` 补齐 attribute 命令:
  - `attribute @s minecraft:max_health base set 60`
  - `attribute @s minecraft:armor base set 4`
  - `attribute @s minecraft:armor_toughness base set 2`
  - `attribute @s minecraft:knockback_resistance base set 0.8`
  - `attribute @s minecraft:attack_damage base set 6`
  - `attribute @s minecraft:movement_speed base set 0.105`
  - 执行后用 `effect give @s minecraft:instant_health 1 10 true` 补满 60 HP，并给 `saturation` 保证可疾跑
- [x] `tick_mother.mcfunction` 加 `effect give @s minecraft:resistance 2 0 true`（永久 Resistance I，20% 减伤）
- [x] `on_hit_by_mother.mcfunction` 检查 `flag.first_attack`：
  - 若无此 tag → 全图 `tellraw @a` 广播"有人遭受了突袭……"（不含玩家名）→ 给母体 `tag add flag.first_attack`
- [x] `game/start.mcfunction` 加 `tag @a remove flag.first_attack` 清理
- [x] `training/reset.mcfunction` 同步清理 first_attack tag
- [ ] 验收: 训练沙盒中以母体攻击玩家或点击单人调试按钮，确认属性正确 + 首攻广播仅触发一次

### Batch 5 — 幸存者 10 职业技能

状态: **进行中：运动员、船医、船长已通过游戏内手测；工程师已实现，等待游戏内手测**

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

- 职业 tag 在 `skill:` 内使用简写，如 `tag=doctor`（对应 `_make_doctor` 给予的 tag）
- 被动效果单独写在 `escape_island:role/tick_<职业>.mcfunction`，不放入 `skill:` 技能函数
- `escape_island:game/_make_<职业>.mcfunction` 末尾调用 `function skill:<职业>/init`
- 所有右键一次性触发技能统一使用 `consume_item` advancement + `consumable.consume_seconds:0` 模式（不用 `using_item`，因部分物品无原版右键动画）；ensure_item pattern 在 tick 中补回道具

#### 运动员（athlete）— 已完成，仅需接入

`data/skill/function/athlete/` 中滑铲（slide_tackle）+ 肾上腺素（adrenaline）已完整实现。

- [x] `escape_island:game/_tick_20.mcfunction` / `training/_tick_20.mcfunction`：将 `role.sailor` 改为 `role.athlete`
- [x] `escape_island:function/load.mcfunction`：删除 `cd_sailor` scoreboard 注册（运动员 scoreboard 已由 `skill:athlete/init` 注册）
- [x] 从旧 `skill:common/cooldown_tick` 移除水手冷却递减
- [x] 确认 `data/minecraft/tags/function/tick.json` 包含 `skill:athlete/tick`
- [x] 训练发套件、正式分配、重置、转化清理均接入 `role.athlete`
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
- 在 `use.mcfunction` 中：先检查 `@s[tag=state.infected_period]` → 自救分支；否则 `execute at @s as @a[tag=state.infected_period,tag=role.survivor,distance=..5,sort=nearest,limit=1]` → 清除感染期
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
- 触发后：`execute at @s as @a[tag=role.survivor,tag=!state.dead,distance=..8]` → `effect give @s minecraft:speed 15 1 true` + `effect give @s minecraft:strength 15 0 true`（含自身）
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
- 触发后：`summon minecraft:marker ~ ~ ~ {Tags:["skill.battery_marker","skill.battery_active"],CustomName:'{"text":"engineer_battery"}'}` 在玩家脚下
- 设置 `battery_timer` scoreboard；tick 每秒 -1，归零后 remove marker
- 任务系统（Batch 7）中检测距 `skill.battery_marker` ≤4 格时修复速度 ×3（覆盖原本 ×2 工程师被动）
- 同时上限 1：`execute if entity @a[tag=skill.battery_active]` 则不能再放
- 拆除：若同一工程师在 2 格内 sneak+use → 清除 marker，返还道具（`function skill:engineer/battery/recall`）

**被动**（Batch 7 中接入）：`tag=engineer` 在修复点旁时速度 ×2

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

**触发**：`consume_item`，道具 `minecraft:mushroom_stew`（`!minecraft:use_remainder` + `food.can_always_eat:true` + `consumable.consume_seconds:0`，`custom_data.skill:"cook_soup"`）

`data/skill/function/chef/hot_soup/config.mcfunction`：
```
scoreboard players set #hotbar_slot  skill.soup_cfg  6
scoreboard players set #cooldown     skill.soup_cfg  3600   # 180s
scoreboard players set #heal_amp     skill.soup_cfg  3      # instant_health amplifier 3 ≈ 4 心
```

关键逻辑：
- 触发后：检查冷却 → `effect give @s minecraft:instant_health 1 3 true`（约 8 HP = 4 心）
- 在玩家位置播放 `minecraft:entity.generic.drink` 音效 + 心形/村民快乐粒子
- Batch 5 先实现自用版（给自身）；后期扩展汤锅放置留给 Batch 10+

**被动**（`escape_island:role/tick_chef.mcfunction`）：
- `effect give @s minecraft:night_vision 3 0 true`
- 5 格内非厨师幸存者获得短暂 `minecraft:absorption 3 0 true`。当前全员不会消耗饱食度，所以不再使用饱和恢复。

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
- 触发后：给使用者打临时 `skill.radio_viewer`，再对 `role.infected`、`state.infected_period`、已暴露母体（`role.mother` + `flag.first_attack`，且非 `state.disguised`）输出私有 `tellraw` 距离区间报告
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
- 触发后：`execute at @s if entity @a[tag=role.mother,tag=!state.disguised,distance=..6]` OR `execute at @s if entity @a[tag=role.infected,distance=..6]` OR `if entity @a[tag=state.infected_period,distance=..6]`
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
- 触发后：在玩家脚下 `summon minecraft:marker ~ ~ ~ {Tags:["skill.trap_marker"]}` + 绿粒子标记（幸存者可见）
- 充能：最多 3 次充能，场上最多 3 个陷阱；充能不满时每 90 秒恢复 1 次
- tick：`execute as @e[tag=role.mother] at @s if entity @e[tag=skill.trap_marker,distance=..1.25,limit=1]` → 触发效果 + kill marker
- 同样检测 `tag=role.infected`
- 幸存者不触发；感染者阵营可 sneak+use 拆除
- 感染者机修工（转化保留）补发"感染者陷阱"（`custom_data.skill:"mechanic_infected_trap"`）

**被动**（Batch 8 中接入）：`tag=mechanic` 在直升机/轮船修复点旁时速度 +30%

#### 神父（priest）— 十字架（cross）

**触发**：被动，`entity_hurt_player` advancement（受到伤害时检查）

`data/skill/function/priest/cross/config.mcfunction`：
```
scoreboard players set #night_vision_amp  skill.cross_cfg  0    # 夜视 I
scoreboard players set #night_vision_dur  skill.cross_cfg  3    # 每秒刷新
```

关键逻辑：
- `entity_hurt_player` advancement 条件：`player.nbt` 含 `Tags:["role.priest","cross_active"]`
- `use.mcfunction`：检查 `@s[tag=cross_active]` → 给 Resistance 255 1 tick（阻断致死伤害）→ remove cross_active tag → 清除 `state.infected_period` → clear 十字架物品（`clear @s minecraft:nautilus_shell 1`）→ 粒子 + 钟声
- 感染期阻断：在 `tick_priest.mcfunction` 中：`execute as @a[tag=role.priest,tag=state.infected_period,tag=cross_active]` → 同上清除流程
- `_make_priest.mcfunction` 给 `tag cross_active` + `minecraft:nautilus_shell`（自定义命名）

**被动**（`escape_island:role/tick_priest.mcfunction`）：
- `execute as @a[tag=role.priest,tag=!state.dead] at @s run effect give @s minecraft:night_vision 3 0 true`

---

#### Batch 5 实现任务清单

运动员接入（已有代码，仅改引用）：
- [x] `escape_island:game/_tick_20` / `training/_tick_20`：`role.sailor` → `role.athlete`
- [x] `escape_island:function/load`：删除 `cd_sailor` 注册
- [x] `skill:common/cooldown_tick` 移除旧水手冷却递减
- [x] 正式分配、训练套件、重置、转化清理接入 `role.athlete`
- [ ] 等待游戏内手测通过

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
- [ ] `data/skill/function/priest/{init,tick,cleanup_non_priest}.mcfunction`
- [ ] `data/skill/function/priest/cross/{config,init,use,item_ready}.mcfunction`
- [ ] `data/skill/advancement/priest/cross/use.json`（`entity_hurt_player`）
- [ ] `escape_island:role/tick_priest.mcfunction`（被动夜视 + 感染期检查）

所有职业共用：
- [ ] `skill:init.mcfunction` 调用所有 9 个新职业 + athlete 的 `init`
- [ ] `escape_island:game/_tick_20` 中为每个职业调用 `function skill:<职业>/tick`
- [ ] 每个 `_make_<职业>.mcfunction` 末尾加 `function skill:<职业>/init`（确保 scoreboard 就绪后给道具）

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
- [ ] 验收: 开发沙盒中右键有枪模型/枪声反馈，枪不被消耗；可射击 8 发、空匣不能造成伤害、装填 2 秒、消耗 9mm 弹药、命中母体/感染者/幸存者符合阵营伤害规则。

### Batch 7 — 任务系统

状态: **待实现**

目标: 信号塔修复、发电机启动、轮船修复在开发沙盒中可完整跑通。

#### 7A — 信号塔修复

- [ ] `signal_tower_tick.mcfunction`（每秒运行）:
  - 检测玩家是否在 `marker.signal_tower` 2 格内 + 持有线缆（`custom_data.item="cable"`）
  - 持续 5 秒 `interact_item` 检测（`using_item` advancement + 近距离 marker 检查）
  - 完成一段 → `signal_progress ++` → 广播进度 + bossbar 更新
  - 中断条件: 受伤 or 离开范围 → 进度条暂停（不回退）
  - 工程师在范围内: 速度 ×2（每段 2.5 秒）；工程师电池在范围内: 速度 ×3（每段 1.7 秒）
  - `signal_progress >= tunable.signal_stages` → 广播"信号塔修复完成" → 写入 `$game signal_done 1`
- [ ] bossbar `escape_island:signal`：`signal_progress / tunable.signal_stages`，全员可见
- [ ] 线缆道具：`custom_data.item = "cable"`，loot_basic 30% 概率出现

#### 7B — 发电机启动

- [ ] `generator_tick.mcfunction`（每秒运行）:
  - 玩家靠近 `marker.generator` + 持有燃料电池（`custom_data.item="fuel_cell"`）右键投入
  - 投入 3 个后启动，`gen_countdown = 60`
  - 每秒 `gen_countdown --`；感染者/母体靠近 2 格 → `gen_countdown -= 3`（破坏加速）
  - `gen_countdown <= 0` → 发电机损坏（进度归零，电池需重投）
  - `gen_countdown` 从 60 倒计时完成无破坏 → 写入 `$game gen_done 1`
- [ ] bossbar `escape_island:gen`：显示发电机维持剩余时间，全员可见

#### 7C — 信号塔 + 发电机完成 → 直升机呼叫

- [ ] `phase_check.mcfunction` 检查 `$game signal_done = 1 AND $game gen_done = 1`
  - → 广播"天边开始发白，直升机正在靠近……"
  - → `heli_countdown = tunable.helicopter_countdown`（默认 90）
  - → `escape/helicopter_call.mcfunction`

#### 7D — 轮船修复（可选，后续批次）

暂缓，先跑通主线直升机路线后再实现。

验收: 开发沙盒中手动置入线缆和电池，跑完信号塔 + 发电机 → 直升机广播出现。

### Batch 8 — 直升机撤离与结局

状态: **待实现**

目标: 完整直升机路线：呼叫→倒计时→到达→登机→结算。

任务:

- [ ] `escape/helicopter_call.mcfunction`:
  - 从 4 个 `marker.heli_pad` 中随机选 1 个，广播坐标
  - 召唤直升机 armor_stand（临时用普通 armor_stand，资源包后期加模型）
  - 启动 `heli_countdown`
- [ ] `escape/helicopter_tick.mcfunction`（每秒运行）:
  - `heli_countdown --`
  - bossbar `escape_island:heli` 更新
  - `heli_countdown <= 0` → `escape/helicopter_arrive.mcfunction`
- [ ] `escape/helicopter_arrive.mcfunction`:
  - 广播"直升机降落！30 秒内上机！"
  - 召唤可坐 boat 实体作为登机判定（或 2 格内接触判定）
- [ ] `escape/boarding_check.mcfunction`（每秒）:
  - 检测 `marker.heli_pad` 2 格内玩家
  - 母体/感染者：击退 + 告知无法上机
  - 幸存者（含感染期）：给 `state.boarding` tag
  - 登机倒计时 30s 后所有 `state.boarding` 玩家 → `state.escaped` + gamemode spectator
  - 满足胜利条件（至少 1 人撤离）→ `game/end_helicopter.mcfunction`
- [ ] `game/end_helicopter.mcfunction`:
  - 广播结局字幕（"幸存者已撤离……"）
  - `in_game = 0`，清理所有 bossbar
  - 所有人进入结算
- [ ] 动态破晓（可后期添加）: 每秒 `/time add X` 让天色渐亮，X 根据 `heli_countdown` 反比例计算
- [ ] 验收: 开发沙盒中手动触发直升机路线，跑完完整流程，确认结算

### Batch 9 — 其余撤离路线与结局

状态: **待实现（Batch 8 完成后推进）**

轮船路线：
- [ ] 收集 5 个船舶部件 → 投入 `marker.ship_dock`
- [ ] 站立修复进度 +1/s（感染者 -2/s），满 100 → 30s 倒计时
- [ ] 登船判定（同直升机），至少 1 名幸存者 → `end_ship`

潜艇路线：
- [ ] 实验室 4 张身份卡碎片 → `lab_terminal` 合成 → 潜艇启动 45s
- [ ] 实验室感染研究员（HP 30 自定义僵尸）击杀掉落身份卡碎片
- [ ] 登艇判定 → `end_lab`

自爆路线：
- [ ] 持 3 份普罗米修斯文件 + 信号塔完成 + `island_bomb` marker → 长按右键 30s（有面罩 15s）
- [ ] 激活后 3 分钟倒计时 → 任意撤离方式的人获胜
- [ ] `end_destroy`

母体伪装结局：
- [ ] 实验室冷库终端 + 2 张母体专属身份卡碎片 → 伪装试剂 X-7
- [ ] 服用后 `state.disguised`，登机扫描 8 秒，病毒学家检测剂可破解
- [ ] `end_disguise`

病毒变异 Bad End：
- [ ] 15:00 时间到 + 无人撤离 → `phase_5_mutate` → 全员强制感染期 → 20s 后转化 → `end_mutate`

### Batch 10 — 物资系统与 loot table

状态: **待实现**

目标: 地图上的物资箱可正常开启，掉落正确物品。

任务:

- [ ] `loot_table/world/basic_supply.json`（按 BALANCE.md §八 表格写）
- [ ] `loot_table/world/rare_supply.json`
- [ ] `loot_table/world/keynote.json`（主任笔记 + 普罗米修斯文件）
- [ ] `loot_table/mob/researcher_drops.json`（身份卡碎片 + 偶发防毒面具）
- [ ] `dev/setup_markers.mcfunction` 升级: 在物资点位置放置对应方块（箱子），`/loot insert` 注入对应 loot table
- [ ] 验收: 开发沙盒中打开物资箱，确认掉落品分布正确

### Batch 11 — 环境事件

状态: **待实现**

目标: 抢修期内每 3 分钟随机触发一个环境事件，制造紧张感。

任务:

- [ ] `event/pick_event.mcfunction`（每 180s 运行一次）:
  - random 选 1-5 → 对应事件函数
- [ ] `event/blackout.mcfunction`: 全员黑暗 II 60s；持手电筒 3 格内给夜视 I
- [ ] `event/radio_static.mcfunction`: 30s 随机 title 干扰
- [ ] `event/hallucination.mcfunction`: 随机位置生成 5 个 glowing display entity，1.5s 后消失
- [ ] `event/storm.mcfunction`: 户外玩家每 5s 扣 1 心 90s（修复点范围豁免）
- [ ] `event/spore_burst.mcfunction`: 随机 5 处生成临时孢子云区域（`particle` + 感染者近距离加孢子）

### Batch 12 — 人数缩放与收尾

状态: **待实现**

目标: 4–20 人局自动调整参数；潜伏宿主（17–20 人局）可觉醒。

任务:

- [ ] `game/start.mcfunction` 调用 `util/apply_scaling`，按 player_count 写入 tunable.*
- [ ] `util/apply_scaling.mcfunction`（参见 BALANCE.md §九 表格）
- [ ] 潜伏宿主: `game/pick_latent_host.mcfunction` → T+8:00 / 第一名普通幸存者转化后 15s / 主母体复活冷却时觉醒
- [ ] 小人数局（4–7 人）保证船医出现在非母体幸存者职业池
- [ ] 完整 15 分钟流程压测（`debug_speed = 1` 压缩时间）
- [ ] 验收: 4 人局 + 12 人局各跑通 1 次完整流程

---

## 四、自测记录

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

---

## 五、游戏内手测清单

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
2. `[+35污染]` × 2 → 不进入感染期，actionbar 显示孢子值；到达 50 后本人听到轻微心跳音，其他玩家不可见不可听
3. `[+35污染]` 再次 → 进入感染期，金色名牌，actionbar 显示转化倒计时，心跳音，脚下粒子
4. 等待 45 秒 → 自动转化为感染者，名牌变红
5. `[设为幸存者]` → `[模拟幸存者死亡]` → 原地倒地孢化，不能移动/飞行/交互，actionbar 显示 15 秒倒计时，结束后转感染者
6. `[设为感染者]` → `[模拟感染者死亡]` → 30 秒复活倒计时，结束后在 `spore_spot` 复活
7. `[设为母体]` → `[模拟母体死亡]` → 60 秒复活倒计时，结束后复活并重新获得母体道具
8. `[设为神父]` → `[强制感染期]` → 十字架触发阻断

### Batch 4 母体属性手测

1. `[设为母体]` → 检查 HP = 30 心
2. 被攻击：血量正确减少，回血触发（5 秒不受伤后 Regen）
3. HP ≤ 9 心：狂暴触发，速度提升可感知
4. 首次攻击测试人偶：全图出现"有人遭受了突袭"广播，第二次攻击不再广播

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
