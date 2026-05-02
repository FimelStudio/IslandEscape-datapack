# TECH — 数据包技术架构

实现端的"single source of truth"。规则与数值见 [GDD.md](GDD.md) 和 [BALANCE.md](BALANCE.md)。资源包模型、贴图与音效需求见 [RESOURCE_PACK_ASSETS.md](RESOURCE_PACK_ASSETS.md)。

## 目录

1. [Minecraft 版本与 pack format](#一minecraft-版本与-pack-format)
2. [完整目录树](#二完整目录树)
3. [Scoreboard 全表](#三scoreboard-全表)
4. [Tag 命名规范](#四tag-命名规范)
5. [Team 与 Bossbar](#五team-与-bossbar)
6. [函数调用图](#六函数调用图)
7. [关键技术问题与方案](#七关键技术问题与方案)
8. [Predicate / Loot Table / Item Modifier 列表](#八predicate--loot-table--item-modifier-列表)
9. [Advancement 触发器列表](#九advancement-触发器列表)
10. [tellraw 颜色规范](#十tellraw-颜色规范)

---

## 一、Minecraft 版本与 pack format

- 目标版本: **Minecraft Java Edition 1.21.11**
- pack_format: 检查 `1.21.11` 对应的 `pack_format` 数字（1.21 起为 48，每个次版本 +1，1.21.11 预计为 ~58）

```json
{
  "pack": {
    "pack_format": 58,
    "supported_formats": [55, 60],
    "description": "孤岛逃生：感染 v0.1"
  }
}
```

依赖的 1.21.x 特性:
- `consumable` 物品组件（任意物品可消耗）
- `equippable` 物品组件
- `use_remainder` 组件
- `item_model` 组件指向资源包模型
- `data_components` 通用化（取代 NBT tag）
- 函数宏 (`$()` 参数)
- `function` 命令支持 with 子句
- `loot` 命令带 `loot_table` 参数
- `random` 命令带种子
- `return` 命令
- Display entity (`text_display`, `item_display`, `block_display`)
- Marker entity
- Camera shake / vignette via display entity overlay
- Bossbar 命令

---

## 二、完整目录树

当前目录按命名空间分工：

- `data/escape_island/`：游戏进程、阶段、感染状态、任务、撤离、职业分配、界面与调试工具。
- `data/skill/`：职业技能、技能触发进度、技能判定、技能道具标签与技能公共工具。
- `data/minecraft/`：原版标签入口，例如 `#minecraft:load`、`#minecraft:tick`、暂停菜单入口。
- `data/animated_java/`：动画模型生成库，只保留生成内容，不承载游戏流程或职业技能逻辑。

```text
IslandEscape-datapack/
├── pack.mcmeta
├── data/
│   ├── escape_island/
│   │   ├── advancement/
│   │   │   ├── interaction/
│   │   │   └── infection/
│   │   ├── dialog/
│   │   │   ├── menu.json
│   │   │   └── profession/
│   │   └── function/
│   │       ├── load.mcfunction
│   │       ├── tick.mcfunction
│   │       ├── game/
│   │       ├── role/
│   │       ├── infection/
│   │       ├── task/
│   │       ├── escape/
│   │       ├── event/
│   │       ├── ui/
│   │       ├── util/
│   │       ├── training/
│   │       ├── debug/
│   │       └── test/
│   ├── skill/
│   │   ├── advancement/
│   │   │   ├── athlete/
│   │   │   ├── mother/
│   │   │   └── common/
│   │   ├── function/
│   │   │   ├── init.mcfunction
│   │   │   ├── tick.mcfunction
│   │   │   ├── athlete/
│   │   │   ├── captain/
│   │   │   ├── chef/
│   │   │   ├── common/
│   │   │   ├── doctor/
│   │   │   ├── engineer/
│   │   │   ├── mechanic/
│   │   │   ├── mother/
│   │   │   ├── priest/
│   │   │   ├── radio/
│   │   │   ├── virologist/
│   │   │   └── ...
│   │   ├── predicate/
│   │   └── tags/
│   │       ├── block/
│   │       └── item/
│   │           ├── role_items.json
│   │           └── consumable_skill_items.json
│   ├── minecraft/
│   │   └── tags/
│   │       ├── function/
│   │       └── dialog/
│   └── animated_java/
└── docs/
```

---

## 三、Scoreboard 全表

| Objective | 类型 | 用途 |
|---|---|---|
| `phase_timer` | dummy | 阶段全局计时（tick 数） |
| `cur_phase` | dummy | 当前阶段 1–5 |
| `dawn_timer` | dummy | 直升机主线动态破晓过渡计时，默认与 `heli_countdown` 同步 |
| `dawn_active` | dummy | 0/1，信号塔+发电机完成后触发动态破晓 |
| `role` | dummy | 玩家职业 ID（0=未分配, 1–10=幸存者职业, 11=母体, 12=感染者, 13=潜伏宿主/次级母体） |
| `infect_time` | dummy | 个体感染期剩余 tick |
| `spore_load` | dummy | 个体孢子污染值 0–100，达到阈值进入感染期 |
| `spore_decay_cd` | dummy | 污染值衰减等待计时，15 秒未新增污染后开始衰减 |
| `is_mother` | dummy | 0/1 |
| `mother_hp` | dummy | 母体 HP（独立追踪不依赖 vanilla health 显示） |
| `mother_respawn` | dummy | 旧母体复活计时，后续重构为母巢崩坏状态兼容字段 |
| `mother_stage` | dummy | 母体成长阶段 0–3 |
| `mother_attack_cd` | dummy | 母体有效攻击冷却，冷却中命中只擦刀 |
| `cd_doctor`, `cd_captain`, ... | dummy | 各职业冷却（10 个 + 母体 3 个 = 13 个） |
| `kit_remaining` | dummy | 解毒针剩余、信号弹剩余等 |
| `signal_progress` | dummy | 信号塔修复阶段 |
| `signal_done` | dummy | 0/1 信号塔已修复 |
| `gen_progress` | dummy | 当前发电机燃料/运行阶段进度 |
| `gen_done` | dummy | 0/1 任一发电机已稳定完成 |
| `gen_countdown` | dummy | 发电机预热/稳定运行剩余秒数 |
| `gen_overload` | dummy | 发电机过载压力，达到上限后熄火 |
| `ship_progress` | dummy | 轮船 0–100 |
| `ship_parts` | dummy | 已交部件数 |
| `ship_bonus_tick` | dummy | 轮船修复加成的 10 秒循环计数 |
| `lab_cards` | dummy | 收集的身份卡碎片 |
| `bomb_armed` | dummy | 0/1 自爆已激活 |
| `bomb_countdown` | dummy | 自爆秒数 |
| `heli_countdown` | dummy | 直升机阶段秒数；正数=抵达倒计时，负数=登机窗口剩余秒数 |
| `heli_motion` | dummy | 直升机模型动画状态；1..90 飞入，201..300 起飞 |
| `ship_countdown` | dummy | 轮船倒计时 |
| `sub_countdown` | dummy | 潜艇倒计时 |
| `escaped_count` | dummy | 已撤离玩家数 |
| `infected_dead` | dummy | 感染者已死人数（用于复活倒计时） |
| `tunable.*` | dummy | 数值旋钮全集（见 BALANCE §十） |
| `trigger_*` | trigger | 玩家可主动触发（如训练模式 `/trigger train_choose 5` 选职业） |

---

## 四、Tag 命名规范

```
<scope>.<noun>[.<modifier>]
```

### 玩家 tag

| Tag | 含义 |
|---|---|
| `team.human` | 幸存者阵营 |
| `infected.mother` | 母体（专属，全局唯一） |
| `state.latent_host` | 17–20 人局潜伏宿主，觉醒前仍按幸存者处理 |
| `infected.secondary_mother` | 潜伏宿主觉醒后的次级母体 |
| `infected.common` | 普通感染者（游戏进程内部身份） |
| `zombie` | 感染者技能目标标签；普通感染者转化/调试赋予时同步添加 |
| `role.doctor`, `role.captain`, ..., `role.priest` | 具体职业（10 个） |
| `state.infected_period` | 感染期中 |
| `state.boarding` | 已上交通工具 |
| `state.escaped` | 已撤离结算 |
| `state.dying` | 0 HP 但未结算 |
| `state.sporifying` | 幸存者死亡后的 15 秒倒地孢化倒计时；玩家锁定在死亡位置，不进入 spectator |
| `state.dead` | 感染者死亡后的复活等待；母体死亡后的母巢崩坏锁定也使用该状态 |
| `state.spectator` | 主动放弃、撤离结算或整局结束后的观战状态；普通死亡不使用 |
| `state.disguised` | 母体伪装中 |
| `state.disguise_scanning` | 伪装母体正在登载扫描中 |
| `state.infection_resist` | 刚被治愈后的短暂污染抗性 |
| `state.mother_broken` | 母体死亡后的母巢崩坏状态，感染者不再复活 |
| `state.infect_immune` | 神父祝福生效中 |
| `flag.has_inject` | 解毒针道具持有标志 |
| `flag.has_keynote` | 持有主任笔记 |
| `flag.has_promfile` | 持有普罗米修斯文件（某一份） |
| `flag.has_disguise` | 母体持有伪装试剂 |
| `flag.tutorial_seen` | 训练模式已看过引导 |

### 实体 / Marker tag

| Tag | 用于 |
|---|---|
| `marker.lobby_ship` | 海风号开始大厅 |
| `marker.dining_room` | 海风号餐厅准备区 |
| `marker.spawn_island` | 正式开局分散出生点（多个） |
| `marker.spawn_beach` | 兼容旧地图的备用出生点 |
| `marker.signal_tower` | 信号塔修复点 |
| `marker.generator` | 发电机（多个） |
| `marker.heli_pad` | 直升机降落候选 |
| `marker.lab_entrance` | 实验室入口 |
| `marker.lab_terminal` | 实验室终端 |
| `marker.lab_sub` | 撤离潜艇 |
| `marker.lab_disguise` | 母体伪装终端 |
| `marker.island_bomb` | 自爆装置 |
| `marker.ship_dock` | 船坞 |
| `marker.spore_spot` | 感染者复活点 |
| `marker.loot_basic` | 普通物资箱位置 |
| `marker.loot_rare` | 稀有物资箱位置 |
| `marker.loot_keynote` | 关键剧情点 |
| `marker.mob_lab_researcher` | 感染研究员刷点 |
| `marker.event_blackout` | 断电中心点 |
| `entity.helicopter` | Animated Java 直升机 root；若模型函数不可用则回退 armor_stand |
| `entity.helicopter_door` | 直升机登机舱门 interaction |
| `entity.helicopter_door_hint` | 直升机舱门文字提示 |
| `entity.disguise_potion` | 伪装试剂掉落物 |
| `entity.researcher` | 实验室僵尸 |
| `entity.engineer_battery` | 工程师电池 marker |
| `entity.mechanic_trap` | 机修陷阱 |
| `entity.chef_stew_pot` | 厨师汤锅 |

---

## 五、Team 与 Bossbar

### Team

```
/team add survivors       {"text":"幸存者","color":"green"}   friendlyFire=false
/team add mother_hidden   {"text":"幸存者","color":"green"}   friendlyFire=false  # 母体隐藏态：绿名牌，与幸存者视觉完全一致
/team add infected_period {"text":"幸存者","color":"gold"}    friendlyFire=false  # 感染期：金色名牌，仍属幸存者阵营
/team add infected        {"text":"感染者","color":"red"}     friendlyFire=false
/team add mother          {"text":"母体","color":"dark_red"}  friendlyFire=false  # 仅在母体被临时暴露（15s）时使用
/team add spectator       {"text":"旁观者","color":"gray"}
```

**团队逻辑说明**:
- 母体全程在 `mother_hidden`（绿名牌），任何人（含感染者）都无法从名牌分辨母体身份
- 进入感染期时: `team join infected_period @s`（金名牌），其他玩家可视别
- 转化完成时: `team join infected @s`（红名牌）
- 病毒学家检测剂抓到母体 → 15秒内 `team join mother @s`（暗红），暴露结束后 `team join mother_hidden @s`
- Team 只负责名牌颜色和同队误伤兜底，不作为完整阵营伤害系统
- 近战、手枪和技能伤害必须在对应 hit/fire 函数中做阵营判断：幸存者/感染期之间无伤；感染者之间无伤；母体对幸存者有效；幸存者对母体/普通感染者有效

### Bossbar

| ID | 用途 | 可见对象 |
|---|---|---|
| `escape_island:phase` | 当前阶段进度 | 全员 |
| `escape_island:signal` | 信号塔修复进度 | 全员 |
| `escape_island:gen` | 发电机维持时间 | 全员 |
| `escape_island:heli` | 直升机倒计时 | 全员 |
| `escape_island:ship` | 轮船倒计时 | 全员 |
| `escape_island:sub` | 潜艇倒计时 | 全员 |
| `escape_island:bomb` | 自爆倒计时 | 全员 |
| `escape_island:infection` | 感染期个人倒计时 | 仅感染期玩家 |
| `escape_island:disguise` | 母体伪装倒计时 | 仅母体本人 |
| `escape_island:mother_respawn` | 旧母体复活倒计时，后续改为母巢崩坏 debug | 仅服务端 OP debug |

---

## 六、函数调用图

### 主入口

```
load (#minecraft:load)
  ├─ tunable
  ├─ scoreboard objectives 注册
  ├─ team 注册
  ├─ bossbar 创建（隐藏）
  └─ ensure_marker（校验地图至少有必要标记）

tick (#minecraft:tick)
  └─ if(in_game) → game/phase_check
```

### 开局

```
game/start
  ├─ 校验在线人数 ≥ 4
  ├─ 写入 cur_phase=1, phase_timer=0
  ├─ role/assign（随机分 10 职业）
  ├─ role/give_kit 各人套件
  ├─ tp 全员到不重复随机 marker.spawn_island（不足时允许复用，兜底 spawn_beach）
  ├─ ui/tellraw_phase 开场叙事
  └─ 启用 phase 计时
```

### 阶段切换

```
game/phase_check (每秒)
  ├─ phase_timer >= 2*60*20 且 cur_phase=1 → game/phase_2_awakening
  │     ├─ pick_mother
  │     ├─ if(player_count >= 17) pick_latent_host
  │     ├─ 启 PvP
  │     └─ 全员公屏 + 母体私聊
  ├─ phase_timer >= 3*60*20 且 cur_phase=2 → game/phase_3_repair
  ├─ 任意逃生路线完成 → game/phase_4_escape（按路线启动直升机/船/潜艇/自爆倒计时）
  └─ phase_timer >= 15*60*20 → game/phase_5_mutate
```

### 主 tick 调度

```
tick (每 tick)
  ├─ phase_timer++
  ├─ skill/cooldown_tick (每 20t)
  ├─ skill/cooldown_lore_update (每 20t)
  ├─ infection/tick_infected_state (每 20t)
  ├─ infected_respawn 检查 (每 20t)
  ├─ role/tick_<role>（每个职业有自己的 tick 频率，多数 20t）
  ├─ task/signal_tower_tick
  ├─ task/generator_tick
  ├─ task/ship_dock_tick
  ├─ task/bomb_tick
  ├─ escape/helicopter_tick
  ├─ event/pick_event (每 60s 检查)
  └─ ui/update_actionbar (每 5t)
```

### 事件回调（advancement → function）

```
skill/doctor/inject.json (advancement)
  trigger: minecraft:player_interacted_with_entity
  conditions: 物品有 role.doctor.inject 标签 + 目标是感染期玩家
  reward: function skill:doctor/inject

infection/consume_antidote.json
  trigger: minecraft:consume_item
  conditions: 物品 custom_data.antidote=1
  reward: function escape_island:infection/cure
```

---

## 七、关键技术问题与方案

### 7.1 右键队友触发（解毒针）

1.21 中 `minecraft:player_interacted_with_entity` advancement 在右键实体时触发。配合物品 `consumable` 组件控制行为。

```json
// data/skill/advancement/doctor/inject.json
{
  "criteria": {
    "trigger": {
      "trigger": "minecraft:player_interacted_with_entity",
      "conditions": {
        "item": {
          "items": ["minecraft:carrot_on_a_stick"],
          "components": {
            "minecraft:custom_data": {"role_item": "doctor.inject"}
          }
        },
        "entity": {
          "type": "minecraft:player"
        }
      }
    }
  },
  "rewards": {
    "function": "skill:doctor/inject"
  }
}
```

`skill:doctor/inject` 中先 advancement revoke 自己，然后判断目标 player 是否在感染期，是则治愈。

### 7.1b 右键技能道具（食物类）通用方案

凡是需要"右键触发"但不希望被消耗的食物类道具（`spider_eye`、`fermented_spider_eye` 等），均附加以下组件：

```json
"minecraft:consumable": {
  "consume_seconds": 999,
  "animation": "none"
}
```

- `consume_seconds: 999` = 持续右键 16.65 分钟才消耗，正常游玩不可能发生
- `using_item` advancement 在第 1 tick 触发（右键按住即触发）→ revoke → skill 函数执行
- 道具永不消失，无需补充机制
- `animation: "none"` 可选，避免播放咀嚼动画

### 7.1c 死亡倒地与孢化锁定

幸存者死亡不进入 `gamemode spectator`。`infection/survivor_death` 进入 `state.sporifying` 后：

- 记录死亡位置到个人 scoreboard 或临时 marker（`death_x/y/z` 或 `marker.death_body`）。
- 立刻把玩家拉回死亡点，设置 adventure，给 `slowness 255`、`weakness 255`、`mining_fatigue 255`、`jump_boost 128` 等锁定效果，清理可交互手持道具。
- 每 tick 或每 2 tick `tp @s <death_pos>`，防止玩家借击退、载具或水流移动；保留视角转动，避免完全失去信息。
- 生成隐形位置锚点：使用 `minecraft:marker` 锁定死亡位置，玩家本体原地僵直显示；孢化结束或中断时清理。
- actionbar 显示 `孢化中: Ns`；本人播放低频心跳/孢化音，其他玩家只看到粒子和倒地代理。
- 15 秒结束后执行 `infection/turn`，移除锁定效果、清理代理，并在转化点或最近 `spore_spot` 恢复为普通感染者。

污染值 `spore_load >= 50` 的预警只对本人可见：actionbar + 轻微心跳音。音效必须在每次提示时 `execute at @s run playsound ... @s ~ ~ ~`，而不是在旧触发点播放，保证玩家移动后仍从当前位置听到。

### 7.2 投掷物触发（信号弹、烟雾蛋）

使用 `egg` / `firework_rocket` 投掷物，附加 `custom_data` 标记。监听 advancement `shot_crossbow` / `entity_hurt_player` / 自定义 marker 实体监听 Item 落地。

具体方案: 当 `egg` 落地，本身会消失，需要在投掷瞬间召唤 marker 跟随：

```mcfunction
# 投掷瞬间（advancement 触发）
execute as @s at @s run summon marker ~ ~ ~ {Tags:["entity.smoke_bomb"], data:{owner:"<uuid>"}}
# tick 检查 marker 是否在 Item 实体附近，否则爆炸
```

或更简单: 用箭矢 (arrow) 替代蛋，附 custom_data 检测落地（`arrow.inGround=1`）。

### 7.2b M-7 手枪框架接入

M-7 不走原版弩战斗模型。实现目标是一个可替换的"手枪适配层"：载体物品只负责右键输入、枪模型、枪声和必要的冷却提示；弹匣、装填、命中、伤害和阵营过滤都由玩法函数结算。

当前 demo 命令如下，仅作为输入/模型/音效参考，不是最终载体限制：

```mcfunction
give @a minecraft:sugar[custom_name={text:"克洛格",color:"gray",bold:true,italic:false},lore=[{text:"右键使用",color:"gray",italic:false}],consumable={animation:"spyglass",consume_seconds:0,has_consume_particles:false,sound:{sound_id:""},on_consume_effects:[{type:"play_sound",sound:{sound_id:"ie:gunshot"}}]},use_cooldown={seconds:0.2},item_model="ie:glock_gun"] 1
```

接入规则：

- 载体可沿用当前 demo，也可以换成其他更适合的物品；硬要求是：可右键触发、可应用手枪模型、可携带 `custom_data={weapon:"pistol",mag:<n>}`、不会与其他职业道具误判。
- 若使用 demo 命令：`item_model="ie:glock_gun"` 显示枪模型，`consume_seconds:0` 让右键即时触发，`use_cooldown.seconds=0.2` 做输入防抖，`ie:gunshot` 播放开火音效。
- 发给玩家时必须携带 `custom_data={weapon:"pistol",mag:8,role_item:"survivor.pistol"}` 或等价数据；9mm 弹药仍使用 `minecraft:iron_nugget` + `custom_data={ammo:1}`。
- 右键触发后进入手枪玩法函数（建议命名 `escape_island:weapon/pistol/fire`）；若弹匣为 0 或玩家潜行右键，则进入 `reload_start`，2 秒后 `reload_finish` 消耗 9mm 补满弹匣。
- 框架输入冷却为 0.2 秒，但实际扣弹/伤害门控为 0.4 秒（8 tick），防止全员手枪射速过高。
- 如果所选载体会被消耗，`fire` / `reload_start` 必须在同 tick 用 `item replace` 或等价逻辑补回手枪，保证武器不丢失。
- 命中检测由 raycast 或等效命中系统完成，命中后统一调用 `on_hit`。
- `on_hit` 必须先做阵营过滤：幸存者/感染期之间无伤；感染者阵营之间无伤；母体隐藏队不影响伤害规则。
- 伤害按目标类型写死到玩法层：普通目标 6 damage，母体 4 damage 基础值，再交给护甲/抗性处理。
- 枪口粒子、命中粒子、额外命中音效都 `execute at @s` 或 `execute positioned` 到当前射击/命中位置；基础枪声由 `on_consume_effects` 播放，但仍需实测玩家移动时声音是否跟随当前位置。

### 7.3 物品冷却显示（lore 倒计时）

每秒一次:

```mcfunction
# skill/cooldown_lore_update (在持有道具的玩家上下文运行)
execute as @a[predicate=escape_island:role/is_doctor, scores={cd_doctor=1..}] run function skill:_lore_doctor

# _lore_doctor.mcfunction
$item modify entity @s weapon.mainhand escape_island:add_cooldown_lore {seconds:$(cd_doctor)}
```

或者用更简单的方法: 每秒重 give 一次（性能消耗中等，5 心跳问题不大）。

更优方案: 1.21+ 物品 `use_cooldown` 组件直接做冷却显示：

```json
"minecraft:use_cooldown": {
  "seconds": 90,
  "cooldown_group": "escape_island:doctor_inject"
}
```

冷却由原版处理，UI 自动显示。但要配合"计时未到不许触发"的逻辑——通过 advancement 条件检查 cooldown 状态。

### 7.4 母体 HP > 20

直接使用 `attribute` 命令修改母体各项属性，在 `_make_mother.mcfunction` 中执行：

```mcfunction
attribute @s minecraft:max_health base set 60
attribute @s minecraft:armor base set 4
attribute @s minecraft:armor_toughness base set 2
attribute @s minecraft:knockback_resistance base set 0.8
attribute @s minecraft:attack_damage base set 6
attribute @s minecraft:movement_speed base set 0.105
heal @s
```

- `mother_hp` scoreboard 通过 `data get entity @s Health` 每秒同步，用于追踪回血、成长和 UI 显示。新版母体不复活，死亡后进入母巢崩坏，感染者失去复活能力
- Resistance I（永久）通过 `tick_mother.mcfunction` 每秒刷新（duration 2 秒，每秒重给，effectivelyly 永久）
- 母体 HP 显示用 bossbar（仅 OP debug 可见）或 actionbar（母体本人可见）

### 7.5 隐秘选母体

```mcfunction
# game/pick_mother
# 把所有幸存者临时打 state.role_candidate tag
tag @a[tag=team.human] add state.role_candidate
# 用 random 选 1
execute as @r[tag=state.role_candidate] run function escape_island:game/_make_mother
# _make_mother
tag @s remove team.human
tag @s add infected.mother
team join mother @s
attribute @s minecraft:max_health base set 80
function escape_island:role/give_kit_mother
tellraw @s [{"text":"§4§l你被柯尔文咬伤了。\\n","color":"dark_red"}, ...]
```

关键点: 不要用任何 `tellraw @a`、不要播放任何全图音效，不要 `setblock` 任何可见效果。其他玩家**完全感知不到**有人被选中。

17–20 人局的潜伏宿主需要随新版母体规则重审。主母体不可复活，潜伏宿主不应在主母体死亡后自动顶替，否则会破坏清剿胜利路线。

### 7.6 隐藏伪装

伪装态: `state.disguised` tag。所有"识别母体"逻辑都先检查这个 tag 是否存在，是则跳过。

但是！通讯员的"全员高亮幸存者"包不包括伪装母体？设计是**包括**——这是伪装的卖点。同样，治愈系道具试图用在伪装母体上会失败（不在感染期），但不会暴露身份。

伪装母体上交通工具时不立刻结局，而是给 `state.disguise_scanning` 8 秒:

- 扫描开始时全员收到一次模糊提示，不包含玩家名
- 扫描期间若 8 格内病毒学家触发检测剂，则移除 `state.disguised`，击退母体，给予 15 秒 glowing / 暴露提示，并取消登载
- 8 秒结束仍在交通工具内且 `state.disguised` 存在 → `game/end_disguise`

### 7.6.1 孢子污染与感染期

`infection/on_attack` 不直接给 `state.infected_period`，而是按攻击者类型调用 `infection/add_spore_load`:

```mcfunction
# 伪代码
execute if entity @s[tag=infected.mother] run function escape_island:infection/add_spore_load {amount:50}
execute if entity @s[tag=infected.secondary_mother] run function escape_island:infection/add_spore_load {amount:50}
execute if entity @s[tag=infected.common] run function escape_island:infection/add_spore_load {amount:35}
```

`add_spore_load` 增加目标 `spore_load`，重置 `spore_decay_cd` 为 15 秒；若目标有 `state.infection_resist` 则本次污染值减半。`spore_load >= tunable.spore_threshold` 时才进入 `state.infected_period`，同时清空污染值。

感染期玩家仍在幸存者队伍，不能伤害其他幸存者，也不会传播污染；实现上保持 `team survivors` 且 `friendlyFire=false`，不要把感染期玩家提前移入 `infected` 队伍。

### 7.7 直升机/船/潜艇上车判定

直升机路线当前采用“模型视觉 + interaction 舱门判定”的分离方案。Animated Java 模型 root 加 `entity.helicopter`，登机点单独生成 `entity.helicopter_door` interaction 和 `entity.helicopter_door_hint` 文本提示。玩家右键舱门触发 `escape/helicopter_door_interact`。

幸存者右键舱门 → `state.boarding` + spectator，等待起飞；感染者右键舱门 → 提示无法登机；伪装母体右键舱门 → `state.boarding` + `state.disguise_scanning`，8 秒扫描后未识破则触发 `game/end_disguise`。

`heli_countdown` 为正数时表示直升机抵达倒计时；倒计时最后 5 秒调用 `helicopter_start_approach`，设置 `heli_motion=1` 并从远处生成模型。`heli_motion` 每 tick 移动模型：飞入为水平接近后垂直下降，起飞为垂直升空后向机头方向飞离。登机窗口为 60 秒，结束后 `_helicopter_depart` 将 `state.boarding` 玩家转为 `state.escaped`，飞离动画结束后清理模型并 `function game/end_helicopter`。

船/潜艇路线后续可复用 interaction 舱门判定，不建议把玩家真实骑乘到撤离模型上。

### 7.8 性能预算

- 主 tick 每秒约 20 次调度，单次开销目标 < 1 ms
- 大头是 `tick_infected_state`（per-player）和 `update_actionbar`（per-player）
- 优化: 把 per-player 逻辑用 `execute as @a[predicate=...] run function ...` 而不是 schedule 每个玩家
- 大量用 predicate 而非命令链 if 判断（predicate 在 Java 端 JIT 缓存）

测试目标: 20 名玩家，主 tick 单次 < 5ms（用 `/perf start` profiler 验证）。

### 7.9 已知 vanilla 限制与方案

| 限制 | 方案 |
|---|---|
| 没有真正的"右键空气"事件 | 用 `using_item` advancement（持有物品时按住右键）+ `consumable` 配合 |
| 没有原生伤害减免百分比 | 给护甲 attribute + 测算 |
| 没有原生 PvP 队伍开关 | `team modify <team> friendlyFire false` |
| 没有原生 boss bar 个人 | bossbar 创建后 `players` 限定到玩家 |
| 没有原生 camera shake | display entity overlay 短暂位移模拟 |
| 没有原生 vignette | `text_display` 全屏覆盖 + alpha 渐变 |
| 玩家不能强制播放真正的倒地动画 | 锁定玩家本体 + 隐形 `minecraft:marker` 位置锚点；不使用可见盔甲架身体代理 |
| 原版弩不符合 M-7 手枪体感 | 使用可替换右键枪载体（当前为 `minecraft:sugar` + `item_model="ie:glock_gun"`），弹匣、装填、伤害和阵营过滤全部由函数结算 |
| 物品 NBT 体积 | 用最简 custom_data + 索引到 lookup table，避免内联巨大数据 |

---

## 八、Predicate / Loot Table / Item Modifier 列表

### Predicate（精选）

```
role/is_survivor.json       — 玩家有 team.human tag 且无 state.spectator / state.escaped
role/is_mother.json         — 玩家有 infected.mother tag
role/is_infected.json       — 玩家有 infected.common、infected.mother 或 infected.secondary_mother
role/is_latent_host.json    — 玩家有 state.latent_host
infection/is_infected_period.json — state.infected_period tag
infection/has_spore_load.json     — spore_load >= 1
infection/spore_threshold.json    — spore_load >= tunable.spore_threshold
phase/is_phase_3.json       — cur_phase=3
item/has_role_marker.json   — 持有物品 custom_data.role_item 存在
```

### Loot Table（精选）

```
kit/doctor.json             — 给船医套件（铁斧 + M-7 + 9mm×8 + 解毒针 ×1 + 食物 ×3）
kit/captain.json            — 铁剑 + M-7 + 9mm×8 + 哨子 + 皮革甲全套 + 食物
kit/marine.json             — 铁剑 + M-7 + 9mm×24 + 压制技能道具 + 皮革甲
... (10 职业均含 M-7 + 9mm×8；母体除外)
mother.json                 — 母体三件道具 + 60 HP + 护甲属性 → 通过 function 而非 loot 设置
world/basic_supply.json     — 数值见 BALANCE
world/rare_supply.json      — 数值见 BALANCE
world/keynote.json          — 主任笔记 / 普罗米修斯文件
task/lab_research_killed.mcfunction — 击杀感染研究员后直接给身份卡碎片，并小概率给防毒面具
```

### Item Modifier（精选）

```
add_cooldown_lore.json      — 用 macro 注入剩余 X 秒
role_doctor.json            — 把铁斧设置为带 team.human.weapon 标签
role_mother.json            — 母体三件套
```

---

## 九、Advancement 触发器列表

| Advancement | Trigger | 用途 |
|---|---|---|
| `skill/doctor/inject` | `player_interacted_with_entity` | 解毒针 |
| `skill/captain/horn` | `using_item` (goat_horn) | 哨子 |
| `skill/engineer/battery` | `placed_block` | 电池 |
| `skill/marine_suppress` | `shot_crossbow` | 压制 |
| `skill/chef/stew` | `using_item` (mushroom_stew) | 热汤 |
| `skill/radio/signal_scan/use` | `consume_item` (compass) | 信号扫描 |
| `skill/virologist/detector/use` | `consume_item` (glass_bottle) | 检测剂 |
| `skill/mechanic/trap` | `placed_block` | 陷阱 |
| `skill/priest_cross` | `entity_hurt_player` (when fatal) | 祝福被动监听 |
| `skill/mother/trail_sense` | `using_item` (spider_eye, consumable 999s) | 腐痕感知 |
| `skill/mother/howl` | `using_item` (fermented_spider_eye, consumable 999s) | 集群嚎叫 |
| `skill/mother/eat/eat_entity` | `consume_item` (red_dye) | 吞噬感染体 |
| `skill/mother/eat/use_zombie_editor` | `consume_item` (structure_void) | 编辑被吞噬的感染体 |
| `skill/mother/eat/release_entity` | `consume_item` (slime_ball) | 吐出感染体 |
| `interaction/repair_signal` | `using_item` (cable) at marker | 信号塔修复 |
| `interaction/place_battery` | `placed_block` | 给发电机投电池 |
| `interaction/drink_disguise` | `consume_item` (potion) | 母体伪装 |
| `infection/consume_antidote` | `consume_item` | 治愈 |
| `infection/researcher_killed` | `entity_killed_player` 倒着用 — `player_killed_entity` | 实验室僵尸击杀 |

**注**: 1.21 的 advancement 还需要在 `rewards` 中加 `revoke = self`（用 function 调用 `advancement revoke @s only`），保证下次还能触发。

---

## 十、tellraw 颜色规范

| 用途 | 颜色 | 颜色码 |
|---|---|---|
| 系统提示 | gold | §6 |
| 阶段切换 | yellow | §e |
| 任务完成 | green | §a |
| 危险警告 | red | §c |
| 致命/母体相关 | dark_red | §4 |
| 隐秘信息（仅母体） | dark_purple | §5 |
| 中性叙事 | gray | §7 |
| 普通文本 | white | §f |
| 工程师 / 通讯员相关 | aqua | §b |
| 病毒学家 | green | §a |
| 神父 | white + bold | §f§l |
| 实验室相关 | dark_purple | §5 |
| 直升机相关 | gold | §6 |

字体规范:
- 标题级文字加 `§l` (粗体)
- 不使用 `§k` (混乱) 除非环境事件「无线电杂讯」
- 不使用 `§n` (下划线) 除非链接式提示
- 不使用 `§m` (删除) 除非彩蛋
