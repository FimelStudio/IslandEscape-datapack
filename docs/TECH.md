# TECH — 数据包技术架构

实现端的"single source of truth"。规则与数值见 [GDD.md](GDD.md) 和 [BALANCE.md](BALANCE.md)。

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

```
escape_island/
├── pack.mcmeta
├── data/
│   └── escape_island/
│       ├── advancement/
│       │   ├── skill/
│       │   │   ├── doctor_inject.json         # 右键队友触发解毒针
│       │   │   ├── captain_horn.json          # 哨子主动
│       │   │   ├── engineer_battery.json      # 电池放置
│       │   │   ├── marine_suppress.json       # 压制射击
│       │   │   ├── chef_stew.json
│       │   │   ├── radio_sweep.json
│       │   │   ├── virologist_reagent.json
│       │   │   ├── mechanic_trap.json
│       │   │   ├── sailor_dash.json
│       │   │   ├── priest_cross.json          # 被动监听致死伤害
│       │   │   ├── mother_lunge.json
│       │   │   ├── mother_rotsense.json
│       │   │   └── mother_howl.json
│       │   ├── interaction/
│       │   │   ├── hit_player.json            # 玩家被攻击
│       │   │   ├── hit_by_mother.json         # 被母体攻击（用 tag 区分）
│       │   │   ├── repair_signal.json         # 长按修复
│       │   │   ├── place_battery.json
│       │   │   └── drink_disguise.json
│       │   └── infection/
│       │       ├── consume_antidote.json
│       │       ├── consume_vaccine.json
│       │       └── consume_field_kit.json
│       ├── function/
│       │   ├── load.mcfunction                # 数据包加载入口
│       │   ├── tick.mcfunction                # 主 tick 调度器
│       │   ├── tunable.mcfunction             # 数值旋钮注册
│       │   ├── game/
│       │   │   ├── start.mcfunction
│       │   │   ├── abort.mcfunction
│       │   │   ├── pick_mother.mcfunction
│       │   │   ├── pick_latent_host.mcfunction        # 17–20 人局潜伏宿主
│       │   │   ├── phase_check.mcfunction
│       │   │   ├── phase_1_load.mcfunction
│       │   │   ├── phase_2_awakening.mcfunction
│       │   │   ├── phase_3_repair.mcfunction
│       │   │   ├── phase_4_escape.mcfunction
│       │   │   ├── phase_5_mutate.mcfunction
│       │   │   ├── end_helicopter.mcfunction
│       │   │   ├── end_ship.mcfunction
│       │   │   ├── end_lab.mcfunction
│       │   │   ├── end_destroy.mcfunction
│       │   │   ├── end_disguise.mcfunction
│       │   │   ├── end_mutate.mcfunction
│       │   │   └── settle.mcfunction          # 通用结算（撤离者观战 + 字幕）
│       │   ├── role/
│       │   │   ├── assign.mcfunction          # 随机分 10 职业
│       │   │   ├── give_kit.mcfunction        # 通用 kit 分发
│       │   │   ├── kit_doctor.mcfunction
│       │   │   ├── kit_captain.mcfunction
│       │   │   ├── kit_engineer.mcfunction
│       │   │   ├── kit_marine.mcfunction
│       │   │   ├── kit_chef.mcfunction
│       │   │   ├── kit_radio.mcfunction
│       │   │   ├── kit_virologist.mcfunction
│       │   │   ├── kit_mechanic.mcfunction
│       │   │   ├── kit_sailor.mcfunction
│       │   │   ├── kit_priest.mcfunction
│       │   │   ├── tick_doctor.mcfunction     # 被动 tick（医生：5 格内队友回血）
│       │   │   ├── tick_captain.mcfunction
│       │   │   ├── tick_engineer.mcfunction
│       │   │   ├── tick_marine.mcfunction
│       │   │   ├── tick_chef.mcfunction
│       │   │   ├── tick_radio.mcfunction
│       │   │   ├── tick_virologist.mcfunction
│       │   │   ├── tick_mechanic.mcfunction
│       │   │   ├── tick_sailor.mcfunction
│       │   │   └── tick_priest.mcfunction
│       │   ├── skill/
│       │   │   ├── cooldown_tick.mcfunction   # 通用冷却 tick（每秒 -1）
│       │   │   ├── cooldown_lore_update.mcfunction  # 物品 lore 倒计时刷新
│       │   │   ├── doctor_inject.mcfunction
│       │   │   ├── captain_horn.mcfunction
│       │   │   ├── engineer_battery.mcfunction
│       │   │   ├── engineer_battery_tick.mcfunction
│       │   │   ├── marine_suppress.mcfunction
│       │   │   ├── chef_stew.mcfunction
│       │   │   ├── chef_stew_tick.mcfunction
│       │   │   ├── radio_sweep.mcfunction
│       │   │   ├── virologist_reagent.mcfunction
│       │   │   ├── mechanic_trap.mcfunction
│       │   │   ├── mechanic_trap_tick.mcfunction
│       │   │   ├── sailor_dash.mcfunction
│       │   │   ├── priest_cross_check.mcfunction  # 被动 tick 监控
│       │   │   ├── mother_lunge.mcfunction
│       │   │   ├── mother_rotsense.mcfunction
│       │   │   ├── mother_howl.mcfunction
│       │   │   └── mother_disguise.mcfunction
│       │   ├── infection/
│       │   │   ├── on_attack.mcfunction       # 母体/感染者攻击 → 给受害者叠污染值
│       │   │   ├── add_spore_load.mcfunction
│       │   │   ├── spore_load_decay.mcfunction
│       │   │   ├── tick_infected_state.mcfunction
│       │   │   ├── cure.mcfunction
│       │   │   ├── survivor_death.mcfunction  # 幸存者任意死亡 → 孢化倒计时
│       │   │   ├── sporify_tick.mcfunction
│       │   │   ├── turn.mcfunction            # 转化为感染者
│       │   │   ├── infected_death.mcfunction  # 感染者死亡 → 30s 后随机复活
│       │   │   ├── infected_respawn.mcfunction
│       │   │   ├── mother_death.mcfunction    # 母体死亡 → 60s 后随机复活
│       │   │   └── mother_respawn.mcfunction
│       │   ├── task/
│       │   │   ├── signal_tower_repair.mcfunction
│       │   │   ├── signal_tower_tick.mcfunction
│       │   │   ├── generator_use.mcfunction
│       │   │   ├── generator_tick.mcfunction
│       │   │   ├── ship_dock_tick.mcfunction
│       │   │   ├── lab_research_killed.mcfunction  # 感染研究员击杀回调
│       │   │   ├── lab_terminal.mcfunction
│       │   │   ├── lab_arming_tick.mcfunction
│       │   │   ├── bomb_activate.mcfunction
│       │   │   ├── bomb_tick.mcfunction
│       │   │   └── disguise_terminal.mcfunction
│       │   ├── escape/
│       │   │   ├── helicopter_call.mcfunction
│       │   │   ├── helicopter_pick_landing.mcfunction
│       │   │   ├── helicopter_arrive.mcfunction
│       │   │   ├── helicopter_tick.mcfunction
│       │   │   ├── ship_depart.mcfunction
│       │   │   ├── submarine_depart.mcfunction
│       │   │   └── boarding_check.mcfunction
│       │   ├── event/
│       │   │   ├── pick_event.mcfunction      # 随机环境事件
│       │   │   ├── blackout.mcfunction
│       │   │   ├── radio_static.mcfunction
│       │   │   ├── hallucination.mcfunction
│       │   │   ├── storm.mcfunction
│       │   │   └── spore_burst.mcfunction
│       │   ├── ui/
│       │   │   ├── update_actionbar.mcfunction
│       │   │   ├── tellraw_phase.mcfunction
│       │   │   ├── tellraw_lore_book.mcfunction
│       │   │   ├── update_bossbar.mcfunction
│       │   │   └── ending_subtitle.mcfunction
│       │   ├── util/
│       │   │   ├── random_select.mcfunction   # 不重复随机
│       │   │   ├── ensure_marker.mcfunction   # 校验 marker 已放置
│       │   │   ├── tellraw_factory.mcfunction
│       │   │   ├── give_role_item.mcfunction
│       │   │   ├── play_sound_global.mcfunction
│       │   │   └── debug_log.mcfunction
│       │   ├── training/
│       │   │   ├── start.mcfunction
│       │   │   ├── give_all_kits.mcfunction
│       │   │   └── reset.mcfunction
│       │   ├── debug/
│       │   │   ├── show_state.mcfunction
│       │   │   ├── force_phase.mcfunction
│       │   │   ├── force_mother.mcfunction
│       │   │   └── reveal_roles.mcfunction
│       │   └── test/
│       │       ├── spawn_dummies.mcfunction
│       │       ├── full_simulation.mcfunction
│       │       └── perf_check.mcfunction
│       ├── item_modifier/
│       │   ├── role_doctor.json
│       │   ├── role_captain.json
│       │   ├── ... (10 个职业 + 母体)
│       │   └── add_cooldown_lore.json
│       ├── loot_table/
│       │   ├── kit/
│       │   │   ├── doctor.json
│       │   │   ├── captain.json
│       │   │   ├── ... (10 个)
│       │   │   └── mother.json
│       │   ├── world/
│       │   │   ├── basic_supply.json
│       │   │   ├── rare_supply.json
│       │   │   └── keynote.json
│       │   └── mob/
│       │       └── researcher_drops.json
│       ├── predicate/
│       │   ├── role/
│       │   │   ├── is_survivor.json
│       │   │   ├── is_infected.json
│       │   │   ├── is_mother.json
│       │   │   ├── is_doctor.json
│       │   │   └── ... (10 个职业)
│       │   ├── phase/
│       │   │   ├── is_phase_1.json
│       │   │   ├── is_phase_2.json
│       │   │   ├── is_phase_3.json
│       │   │   ├── is_phase_4.json
│       │   │   └── is_phase_5.json
│       │   ├── infection/
│       │   │   ├── is_infected_period.json
│       │   │   └── infection_almost_expire.json
│       │   └── item/
│       │       └── has_role_marker.json
│       ├── tags/
│       │   ├── function/
│       │   │   ├── load.json
│       │   │   └── tick.json
│       │   └── item/
│       │       ├── role_items.json
│       │       └── consumable_skill_items.json
│       └── recipe/                            # 备用病毒学家疫苗
│           └── vaccine.json
└── (resourcepack 单独一个 zip — escape_island_resources.zip)
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
| `mother_respawn` | dummy | 母体死后复活倒计时（60 秒） |
| `cd_doctor`, `cd_captain`, ... | dummy | 各职业冷却（10 个 + 母体 3 个 = 13 个） |
| `kit_remaining` | dummy | 解毒针剩余、信号弹剩余等 |
| `signal_progress` | dummy | 信号塔修复阶段 |
| `gen_progress` | dummy | 发电机维持秒数 |
| `ship_progress` | dummy | 轮船 0–100 |
| `ship_parts` | dummy | 已交部件数 |
| `lab_cards` | dummy | 收集的身份卡碎片 |
| `bomb_armed` | dummy | 0/1 自爆已激活 |
| `bomb_countdown` | dummy | 自爆秒数 |
| `heli_countdown` | dummy | 直升机秒数 |
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
| `role.survivor` | 幸存者阵营 |
| `role.mother` | 母体（专属，全局唯一） |
| `role.latent_host` | 17–20 人局潜伏宿主，觉醒前仍按幸存者处理 |
| `role.secondary_mother` | 潜伏宿主觉醒后的次级母体 |
| `role.infected` | 普通感染者 |
| `role.doctor`, `role.captain`, ..., `role.priest` | 具体职业（10 个） |
| `state.infected_period` | 感染期中 |
| `state.boarding` | 已上交通工具 |
| `state.escaped` | 已撤离结算 |
| `state.dying` | 0 HP 但未结算 |
| `state.sporifying` | 幸存者死亡后的 15 秒孢化倒计时 |
| `state.dead` | 已死亡过渡，结束后转感染者或复活 |
| `state.spectator` | 主动放弃或撤离结算后的观战状态 |
| `state.disguised` | 母体伪装中 |
| `state.disguise_scanning` | 伪装母体正在登载扫描中 |
| `state.infection_resist` | 刚被治愈后的短暂污染抗性 |
| `state.berserk` | 母体狂暴 |
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
| `entity.helicopter` | 直升机 armor_stand |
| `entity.disguise_potion` | 伪装试剂掉落物 |
| `entity.researcher` | 实验室僵尸 |
| `entity.engineer_battery` | 工程师电池 marker |
| `entity.mechanic_trap` | 机修陷阱 |
| `entity.chef_stew_pot` | 厨师汤锅 |

---

## 五、Team 与 Bossbar

### Team

```
/team add survivors {"text":"幸存者","color":"green"}
/team add mother    {"text":"母体","color":"dark_red"}      # 仅母体可见
/team add infected  {"text":"感染者","color":"red"}
/team add spectator {"text":"旁观者","color":"gray"}
```

队友互不伤害用 `friendlyFire` = false。母体单独一队（保证不被普通感染者识别）。

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
| `escape_island:mother_respawn` | 母体复活倒计时 | 仅服务端 OP debug |

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
skill/doctor_inject.json (advancement)
  trigger: minecraft:player_interacted_with_entity
  conditions: 物品有 role.doctor.inject 标签 + 目标是感染期玩家
  reward: function escape_island:skill/doctor_inject

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
// data/escape_island/advancement/skill/doctor_inject.json
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
    "function": "escape_island:skill/doctor_inject"
  }
}
```

`escape_island:skill/doctor_inject` 中先 advancement revoke 自己，然后判断目标 player 是否在感染期，是则治愈。

### 7.2 投掷物触发（信号弹、烟雾蛋）

使用 `egg` / `firework_rocket` 投掷物，附加 `custom_data` 标记。监听 advancement `shot_crossbow` / `entity_hurt_player` / 自定义 marker 实体监听 Item 落地。

具体方案: 当 `egg` 落地，本身会消失，需要在投掷瞬间召唤 marker 跟随：

```mcfunction
# 投掷瞬间（advancement 触发）
execute as @s at @s run summon marker ~ ~ ~ {Tags:["entity.smoke_bomb"], data:{owner:"<uuid>"}}
# tick 检查 marker 是否在 Item 实体附近，否则爆炸
```

或更简单: 用箭矢 (arrow) 替代蛋，附 custom_data 检测落地（`arrow.inGround=1`）。

### 7.3 物品冷却显示（lore 倒计时）

每秒一次:

```mcfunction
# skill/cooldown_lore_update (在持有道具的玩家上下文运行)
execute as @a[predicate=escape_island:role/is_doctor, scores={cd_doctor=1..}] run function escape_island:skill/_lore_doctor

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

不修改 base health，而用独立 scoreboard `mother_hp` + 当玩家 vanilla health 触发损失时映射到 mother_hp。比如:

```mcfunction
# infection/on_mother_hurt
execute as @e[type=player, tag=role.mother] store result score @s mother_dmg run data get entity @s LastDamage
scoreboard players operation @s mother_hp -= @s mother_dmg
execute if score @s mother_hp matches ..0 run function escape_island:infection/mother_death
# 始终把 vanilla health 拉满，HP 显示用 bossbar 或 actionbar
effect give @s minecraft:regeneration 1 255
```

或更简洁: 用 `attribute.minecraft:max_health` 直接调到 60，这要求 1.21 已支持（确认已支持 `attribute set @s minecraft:max_health 60`）。

> 建议方案: **直接改 max_health attribute**，更原生。

### 7.5 隐秘选母体

```mcfunction
# game/pick_mother
# 把所有幸存者临时打 candidate tag
tag @a[tag=role.survivor] add candidate
# 用 random 选 1
execute as @r[tag=candidate] run function escape_island:game/_make_mother
# _make_mother
tag @s remove role.survivor
tag @s add role.mother
team join mother @s
attribute @s minecraft:max_health base set 60
function escape_island:role/give_kit_mother
tellraw @s [{"text":"§4§l你被柯尔文咬伤了。\\n","color":"dark_red"}, ...]
```

关键点: 不要用任何 `tellraw @a`、不要播放任何全图音效，不要 `setblock` 任何可见效果。其他玩家**完全感知不到**有人被选中。

17–20 人局另外执行 `game/pick_latent_host`，从非母体幸存者中选 1 名 `role.latent_host`。潜伏宿主觉醒前保留幸存者队伍、无母体技能、无感染能力；在 T+8:00 / 第一名普通幸存者转化后 15 秒 / 主母体死亡进入复活冷却三者最早时，调用 `game/awaken_secondary_mother`。

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
execute if entity @s[tag=role.mother] run function escape_island:infection/add_spore_load {amount:50}
execute if entity @s[tag=role.secondary_mother] run function escape_island:infection/add_spore_load {amount:50}
execute if entity @s[tag=role.infected] run function escape_island:infection/add_spore_load {amount:35}
```

`add_spore_load` 增加目标 `spore_load`，重置 `spore_decay_cd` 为 15 秒；若目标有 `state.infection_resist` 则本次污染值减半。`spore_load >= tunable.spore_threshold` 时才进入 `state.infected_period`，同时清空污染值。

感染期玩家仍在幸存者队伍，不能伤害其他幸存者，也不会传播污染；实现上保持 `team survivors` 且 `friendlyFire=false`，不要把感染期玩家提前移入 `infected` 队伍。

### 7.7 直升机/船/潜艇上车判定

armor_stand 上加可坐 boat 实体作为座位。玩家上座 → 监听 `Vehicle` NBT 或 `tag passenger` advancement → 给 `state.boarding` tag。

直升机起飞动画: 把整组实体（多个 armor_stand 拼成机身）每 tick `tp ~ ~0.5 ~`（向上 0.5 / tick）持续 200 tick = 10 秒。座位玩家随之上升。

10 秒后所有座位玩家被传送到结算空间 → `state.escaped` + 结算观战 + `function game/end_helicopter`。

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
| 子弹无重力（弩） | 自定义箭矢 + 短距离消失实现 hitscan 感 |
| 物品 NBT 体积 | 用最简 custom_data + 索引到 lookup table，避免内联巨大数据 |

---

## 八、Predicate / Loot Table / Item Modifier 列表

### Predicate（精选）

```
role/is_survivor.json       — 玩家有 role.survivor tag 且无 state.spectator / state.escaped
role/is_mother.json         — 玩家有 role.mother tag
role/is_infected.json       — 玩家有 role.infected、role.mother 或 role.secondary_mother
role/is_latent_host.json    — 玩家有 role.latent_host
infection/is_infected_period.json — state.infected_period tag
infection/has_spore_load.json     — spore_load >= 1
infection/spore_threshold.json    — spore_load >= tunable.spore_threshold
phase/is_phase_3.json       — cur_phase=3
item/has_role_marker.json   — 持有物品 custom_data.role_item 存在
```

### Loot Table（精选）

```
kit/doctor.json             — 给船医套件（铁斧 + 解毒针 ×1 + 食物 ×3）
kit/captain.json            — 铁剑 + 哨子 + 皮革甲全套 + 食物
... (10 职业 + 母体)
mother.json                 — 母体三件道具 + 60 HP + 护甲属性 → 通过 function 而非 loot 设置
world/basic_supply.json     — 数值见 BALANCE
world/rare_supply.json      — 数值见 BALANCE
world/keynote.json          — 主任笔记 / 普罗米修斯文件
mob/researcher_drops.json   — 身份卡碎片 + 防毒面具偶尔
```

### Item Modifier（精选）

```
add_cooldown_lore.json      — 用 macro 注入剩余 X 秒
role_doctor.json            — 把铁斧设置为带 role.survivor.weapon 标签
role_mother.json            — 母体三件套
```

---

## 九、Advancement 触发器列表

| Advancement | Trigger | 用途 |
|---|---|---|
| `skill/doctor_inject` | `player_interacted_with_entity` | 解毒针 |
| `skill/captain_horn` | `using_item` (goat_horn) | 哨子 |
| `skill/engineer_battery` | `placed_block` | 电池 |
| `skill/marine_suppress` | `shot_crossbow` | 压制 |
| `skill/chef_stew` | `using_item` (mushroom_stew) | 热汤 |
| `skill/radio_sweep` | `using_item` (compass) | 信号扫描 |
| `skill/virologist_reagent` | `using_item` (potion) | 检测剂 |
| `skill/mechanic_trap` | `placed_block` | 陷阱 |
| `skill/sailor_dash` | `using_item` (feather) | 冲刺 |
| `skill/priest_cross` | `entity_hurt_player` (when fatal) | 祝福被动监听 |
| `skill/mother_lunge` | `using_item` (firework) | 母体冲刺 |
| `skill/mother_rotsense` | `using_item` (spider_eye) | 感知 |
| `skill/mother_howl` | `using_item` (skull) | 召唤 |
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
