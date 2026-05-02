# RESOURCE_PACK_ASSETS — 资源包资产清单

本文列出需要或建议由资源包补齐的模型、贴图、音效与 UI 素材。数据包逻辑必须在无资源包时仍可运行；资源包只负责提升识别度、氛围和手感。

## 一、命名约定

- 推荐命名空间：`ie`
- 推荐物品模型 id：`ie:item/<name>`，例如 `ie:item/m7_pistol`
- 推荐实体/场景模型 id：`ie:entity/<name>`，例如 `ie:entity/helicopter`
- 推荐音效 id：`ie:<category>.<name>`，例如 `ie:weapon.gunshot`
- 数据包物品仍使用 `custom_data` 识别逻辑；资源包模型只看 `minecraft:item_model` 或后续统一的模型映射。

## 二、P0 必做

这些资产直接影响玩家是否能快速识别玩法，应优先做。

| 资产 | 建议 id | 当前/计划载体 | 逻辑标识 | 用途 |
|---|---|---|---|---|
| M-7 手枪 | `ie:glock_gun` | 当前为 `minecraft:sugar` + `item_model="ie:glock_gun"` | `weapon:"pistol"` | 全员开局反抗手段；不使用弩 |
| 9mm 弹药 | `ie:item/ammo_9mm` | `iron_nugget` | `ammo:1` | 手枪弹药，物资箱也会掉落 |
| 解毒针 | `ie:item/doctor_antidote` | `tipped_arrow` | `skill:"doctor_antidote"` | 船医主动技能 |
| 船长哨子 | `ie:item/captain_whistle` | `sugar` | `skill:"captain_whistle"` | 船长主动技能；因 `goat_horn` 会吞右键，载体不用山羊角 |
| 肾上腺素 | `ie:item/athlete_adrenaline` | `sugar` / `gray_dye` | `skill:"athlete_adrenaline"` | 运动员主动技能与冷却态 |
| 十字架 | `ie:item/priest_cross` | `nautilus_shell` | `role_item:"priest.cross"` | 神父一次性保命道具 |
| 检测剂 | `ie:item/viro_detector` | `potion` | `skill:"viro_detector"` | 病毒学家主动技能；移除 `use_remainder` 避免返还空瓶 |
| 微型电池 | `ie:item/engineer_battery` | `redstone_torch` | `role_item:"engineer.battery"`，后续改 `skill:"engineer_battery"` | 工程师主动技能 |
| 机关陷阱 | `ie:item/mechanic_trap` | `tripwire_hook` | `role_item:"mechanic.trap"`，后续改 `skill:"mechanic_trap"` | 机修工主动技能 |
| 热汤 | `ie:item/cook_hot_soup` | `mushroom_stew` | `skill:"cook_soup"` | 厨师主动技能；移除 `use_remainder` 避免返还碗覆盖冷却物品 |
| 信号扫描仪 | `ie:item/radio_signal_scan` | `compass` | `skill:"radio_signal_scan"` | 通讯员主动技能 |

## 三、P1 职业与阵营技能

| 资产 | 建议 id | 当前/计划载体 | 逻辑标识 | 用途 |
|---|---|---|---|---|
| 腐痕感知 | `ie:item/mother_trail_sense` | `spider_eye` | `role_item:"mother.trail_sense"` | 显示附近幸存者脚印 |
| 集群嚎叫 | `ie:item/mother_howl` | `fermented_spider_eye` | `role_item:"mother.howl"` | 感染者集合 buff |
| X-7 伪装试剂 | `ie:item/x7_disguise` | `potion` | `role_item:"mother.disguise"` | 母体伪装路线 |
| 海军压制射击 | `ie:item/marine_suppressor` | 当前为 `crossbow` | `skill:"marine_suppress"` | 海军陆战队员主动控制技能 |
| 感染者陷阱 | `ie:item/infected_trap` | `tripwire_hook` | `role_item:"mechanic.infected_trap"` | 机修工转化保留 |
| 吞噬 | `ie:item/mother_eat` | `red_dye` | `skill:"mother/eat"` | 母体吞噬感染体 |
| 吐出感染体 | `ie:item/mother_eat_release` | `slime_ball` | `skill:"mother/eat_release"` | 母体释放已吞噬的感染体 |

## 四、P1 任务与物资道具

| 资产 | 建议 id | 当前/计划载体 | 逻辑标识 | 用途 |
|---|---|---|---|---|
| 线缆 | `ie:item/cable` | `string` | `item:"cable"` | 信号塔修复 |
| 燃料电池 | `ie:item/fuel_cell` | `redstone` | `item:"fuel_cell"` | 发电机启动 |
| 潜艇通行证 | `ie:item/sub_pass` | `paper` | `item:"sub_pass"` | 实验室/潜艇路线 |
| 船舶部件 | `ie:ship_part_propeller` / `ie:ship_part_fuel_pump` / `ie:ship_part_steering_linkage` / `ie:ship_part_starter_battery` / `ie:ship_part_anchor_winch` | 待定 | `item:"ship_part", part:"..."` | 轮船路线最多五个不同部件，按人数启用 |
| 主任笔记 | `ie:item/keynote_voss` | `book` / `paper` 待定 | `item:"keynote"` | 实验室入口与剧情 |
| 普罗米修斯文件 | `ie:item/prometheus_file` | `paper` 待定 | `item:"prom_file"` | 自爆真结局 |
| 员工身份卡碎片 | `ie:item/lab_card_fragment` | `paper` 待定 | `item:"lab_card_fragment"` | 潜艇路线 |
| 防毒面具 | `ie:item/gas_mask` | 头盔类待定 | `item:"gas_mask"` | 实验室/自爆路线保护 |
| 烟雾弹 | `ie:item/smoke_grenade` | 待定 | `item:"smoke_grenade"` | 战斗消耗品 |
| 闪光弹 | `ie:item/flashbang` | 待定 | `item:"flashbang"` | 战斗消耗品 |
| 信号枪 | `ie:item/flare_pistol` | 待定，可能复用手枪适配层 | `weapon:"flare_pistol"` | 稀有标记/点燃武器 |

## 五、P1 场景与实体模型

| 资产 | 建议 id | 用途 | 实现备注 |
|---|---|---|---|
| 直升机 | Animated Java `animated_java:helicopter` | 直升机撤离路线 | 已接入模型召唤；当前动画为 `animation_airscrew_circle`，模型屁股朝前，函数层用旋转/路径修正 |
| 直升机座位/舱门提示 | `entity.helicopter_door` / `entity.helicopter_door_hint` | 登机判定区域可视化 | 当前用 interaction + text_display；可后续替换为更精细舱门提示模型 |
| 轮船 | `ie:entity/escape_ship` | 轮船撤离路线 | 后续 Batch 9 |
| 潜艇舱门/潜艇 | `ie:entity/submarine` | 实验室潜艇路线 | 后续 Batch 9 |
| 热汤锅 | `ie:entity/hot_soup_pot` | 厨师技能放置物 | 当前旧实现用隐形 armor stand 名字 |
| 微型电池放置物 | `ie:entity/battery_node` | 工程师技能区域 | marker + 粒子，资源包可加小模型 |
| 机关陷阱放置物 | `ie:entity/trap_node` | 机修工陷阱 | 需要小而可发现，不应过亮 |
| 孢子洞/复活点 | `ie:block/spore_den` 或 `ie:entity/spore_den` | 感染者复活表现 / 母巢崩坏表现 | 用于地图点位强化 |
| 信号塔修复部件 | `ie:block/signal_tower_panel` | 任务点 | 可配合地图方块或 display 模型 |
| 发电机 | `ie:entity/generator` | 任务点 | 可配合燃料投入反馈 |

## 六、P2 UI 与屏幕效果

| 资产 | 建议 id | 用途 |
|---|---|---|
| 感染期红色 vignette | `ie:ui/infection_vignette` | 感染期屏幕压迫感 |
| 孢子污染边缘提示 | `ie:ui/spore_warning` | 污染值 ≥ 50 的私人警告，可后期替代纯 actionbar |
| 倒地孢化 overlay | `ie:ui/sporify_overlay` | 死亡后 15 秒倒计时期间 |
| 无线电杂讯 overlay | `ie:ui/radio_static` | 环境事件 |
| 幻觉轮廓 | `ie:entity/hallucination_silhouette` | 环境事件/通讯员假扫描 |
| 母体近距离金色粒子贴图 | `ie:particle/mother_trace` | 病毒学家被动视觉增强 |
| X 字准心命中反馈 (普通) | `ie:hud` 字体下的 `\uE001` | 命中普通感染者的准心反馈动画/图标 |
| X 字准心命中反馈 (母体) | `ie:hud` 字体下的 `\uE002` | 命中母体/暴击的红色或金色准心反馈 |

### HUD 字库：手枪命中反馈

数据包当前已经在手枪命中函数里调用 `font:"ie:hud"`：

```mcfunction
title @p[distance=..16] times 0 5 5
title @p[distance=..16] title {"text":"\uE001","font":"ie:hud"}
title @p[distance=..16] title {"text":"\uE002","font":"ie:hud"}
```

资源包需要提供：

| 资源 | 建议路径 | 码位 | 视觉 |
|---|---|---|---|
| HUD 字库定义 | `assets/ie/font/hud.json` | - | 注册命中反馈字符 |
| 普通命中 X | `assets/ie/textures/font/hitmarker_x.png` | `\uE001` | 白色/浅灰 X，透明背景 |
| 母体命中 X | `assets/ie/textures/font/hitmarker_x_mother.png` | `\uE002` | 红色或金色 X，透明背景 |

建议图片规格：

- 尺寸：`16x16` 或 `32x32` PNG，透明背景。
- 图形：中心留空的四段短斜线，避免遮住准心主体。
- 色彩：普通命中用白色或浅灰；母体命中用红色、暗红或金色。
- 显示时长由数据包控制为 `5 tick`，资源包不需要做动画；若想做动画，后续可拆成多个码位逐 tick 轮播。

示例 `assets/ie/font/hud.json`：

```json
{
  "providers": [
    {
      "type": "bitmap",
      "file": "ie:font/hitmarker_x.png",
      "ascent": 8,
      "height": 16,
      "chars": [
        "\uE001"
      ]
    },
    {
      "type": "bitmap",
      "file": "ie:font/hitmarker_x_mother.png",
      "ascent": 8,
      "height": 16,
      "chars": [
        "\uE002"
      ]
    }
  ]
}
```

## 七、P0/P1 音效

| 音效 | 建议 id | 当前替代 | 用途 |
|---|---|---|---|
| 手枪开火 | `ie:weapon.gunshot` | demo 用 `ie:gunshot` | M-7 开火，Batch 6 必需 |
| 空匣咔哒 | `ie:weapon.empty_click` | 待定 | 空匣右键反馈 |
| 装填开始/完成 | `ie:weapon.reload_start` / `ie:weapon.reload_done` | 待定 | 2 秒装填反馈 |
| 子弹命中肉体 | `ie:weapon.hit_flesh` | 待定 | 命中感染者/母体 |
| 子弹命中硬物 | `ie:weapon.hit_wall` | 待定 | 打空/打方块 |
| 船长哨声 | `ie:skill.captain_whistle` | `minecraft:item.goat_horn.sound.0` | 船长技能 |
| 解毒针注射 | `ie:skill.antidote_inject` | `minecraft:entity.witch.drink` | 船医技能 |
| 肾上腺素注射/呼吸 | `ie:skill.adrenaline` | `minecraft:entity.player.breath` | 运动员技能 |
| 感染心跳 | `ie:infection.heartbeat` | `minecraft:entity.warden.heartbeat` | 污染/感染期 |
| 孢化完成 | `ie:infection.sporify` | 待定 | 幸存者死亡转化 |
| 孢子洞复活 | `ie:infection.respawn` | 待定 | 感染者复活 / 母巢崩坏提示 |
| 直升机远处旋翼 | `ie:escape.helicopter_far` | `minecraft:entity.ender_dragon.flap` | 呼叫直升机 |
| 直升机到达/起飞 | `ie:escape.helicopter_arrive` / `ie:escape.helicopter_takeoff` | `minecraft:entity.ender_dragon.growl` | 撤离高潮 |
| 无线电杂讯 | `ie:event.radio_static` | `minecraft:block.note_block.pling` | 环境事件 |
| 实验室警报 | `ie:event.lab_alarm` | 待定 | 实验室/自爆路线 |

## 八、当前已出现的外部 id

| id | 来源 | 状态 |
|---|---|---|
| `ie:glock_gun` | 手枪当前 `item_model` | M-7 / Glock 手枪模型 |
| `ie:hud` | 命中反馈的字库(font) | 数据包使用 `\uE001` 和 `\uE002` 字符调用资源包准心 UI |
| `ie:gunshot` | 手枪 demo 的枪声音效 | 建议保留兼容，正式也可映射到 `ie:weapon.gunshot` |
| `animated_java:blueprint/...` | Animated Java 生成内容 | 工具生成，不作为手写资源清单维护 |

## 九、接入规则

1. 资源包做完后，数据包侧优先在 `item replace` / `give` 命令中加 `item_model="ie:item/<name>"`。
2. 技能道具不要依赖原版可右键物品的原交互。若原版交互会吞输入（例如 `goat_horn`），使用稳定载体并靠资源包模型伪装。
3. 同一技能的 ready / cooldown / empty 状态可以共用模型，也可以用独立模型；若做独立模型，建议加后缀 `_ready`、`_cooldown`、`_empty`。
4. 音效命名应稳定，不要把具体实现音源写进 id。例如用 `ie:weapon.gunshot`，不要用 `ie:pistol_9mm_close_v3`。
5. 无资源包时，所有物品必须仍有清晰 `custom_name` 和 `lore`，以便开发测试继续进行。
