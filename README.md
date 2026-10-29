# 海岛逃生：黎明前夕（Escape from Deserted Island）

一张面向 Minecraft Java Edition **1.21.11** 的原版多人 PvP 地图（**仅依赖数据包，无 Mod**）。灵感融合《太空狼人杀》《第五人格》《黎明杀机》《森林》《Phasmophobia》。

> 一艘游轮在风暴中触礁，乘客被迫在一座未标注的小岛上过夜。岛上潜伏着 2024 年从一家"已解散"医药巨头黑实验中泄漏的嵌合病毒。当夜，第一名感染者出现了——而你不知道身边谁是下一个。

## 项目状态

当前仓库已有 v0.1 主线及扩展模块源码，并已进行面向 v0.3 的生命周期、玩家状态与计时/结算基础重构。离线检查与隔离服务器回归的范围和结果见 [原版服务端验收](docs/ENGINE_ACCEPTANCE.md)；正式地图与真实玩家体验仍需验收。

维护入口见 [运行架构与扩展约定](docs/ARCHITECTURE.md)。本地统一检查：`python tools/check.py`。

## 一句话玩法

当前 v0.1 主线为修复信号网络并呼叫直升机撤离，旧病毒末期从第 15 分钟触发；轮船为可选测试路线，潜艇与自毁为实验内容。感染者阵营由 1 名隐藏母体启动，母体和感染者通过连续攻击叠加孢子污染，污染爆发或被击杀的玩家会在同一局变成感染者。**身份不会公开，所有人开局都是普通乘客。**

## 玩家容量与时长

| 推荐 | 数值 |
|---|---|
| 当前 v0.1 测试人数 | **4–12 人** |
| 母体配置 | 当前正式范围为 1 名隐藏母体；大人数实验逻辑不计入验收 |
| 单局时长 | 当前旧末期从 15 分钟触发；v0.3 时限待测试 |
| 难度（幸存者侧） | 中等偏难 |

## 安装

### 服务端要求
- Minecraft Java Edition 1.21.11 服务端 / 单人开放局域网
- 难度 ≥ 简单（推荐普通），命令方块允许，PvP **打开**
- 渲染距离 ≥ 12

### 安装数据包
1. 解压 `escape_island` 数据包到世界目录的 `datapacks/` 下
2. 进入世界后执行 `/reload`，再 `/datapack list` 确认已加载
3. 可选：把配套资源包 `escape_island_resources.zip` 推给所有玩家

### 启动一局
所有玩家进图后，在大厅指定位置由房主执行：
```
/function escape_island:game/start
```
系统会校验在线人数（≥4），自动分队、分职业、传送到出生海滩，开局 30 秒倒计时。

### 训练模式（单人测试用）
```
/function escape_island:training/start
```

## 文档导航

| 文档 | 内容 |
|---|---|
| [docs/LORE.md](docs/LORE.md) | 完整剧情、NPC、书页文本、各结局动画字幕 |
| [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) | 当前生命周期、状态所有权、清理清单、扩展接口与验证命令 |
| [docs/REFACTOR_REVIEW.md](docs/REFACTOR_REVIEW.md) | 重构前架构审查与问题依据 |
| [docs/GDD.md](docs/GDD.md) | 游戏设计文档：阶段、阵营、职业、任务、结局 |
| [docs/BALANCE.md](docs/BALANCE.md) | 全部数值表（技能、冷却、伤害、时间） |
| [docs/TECH.md](docs/TECH.md) | 数据包目录、scoreboard、tag、函数调用图 |
| [docs/MAP_GUIDE.md](docs/MAP_GUIDE.md) | 拿到一张第三方地图后如何适配本数据包 |
| [docs/TEST_PLAN.md](docs/TEST_PLAN.md) | 单机回归 + 联机集成测试用例 |

## 快速命令清单

| 命令 | 用途 |
|---|---|
| `/function escape_island:game/start` | 开局 |
| `/function escape_island:game/abort` | 强制结束当前对局 |
| `/function escape_island:training/start` | 单人训练 |
| `/function escape_island:debug/show_state` | 输出当前阶段、母体存活、任务进度 |
| `/function escape_island:test/spawn_dummies` | 生成 4 个假玩家用于单机调试 |

## 制作

- 设计 / 程序：(待填写)
- 测试：(待填写)
- 致谢：本项目剧情中的"衔尾蛇生物科技"为虚构组织，与现实世界任何机构无关

## 版本历史

| 版本 | 日期 | 内容 |
|---|---|---|
| 0.1.0-doc | 2026-04-26 | M0 文档初稿 |

## 许可

(待填写)
