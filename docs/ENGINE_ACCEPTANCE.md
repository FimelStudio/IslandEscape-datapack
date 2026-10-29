# 原版服务端验收

## 已运行的验收

2026-10-28 使用 Mojang Java 版 1.21.11 独立服务端、原有 FastMotion / dc 依赖，以及 4 个通过 TCP 协议连接的 Mineflayer 客户端，在原存档的隔离副本上执行。服务端和测试控制端只监听 `127.0.0.1`；模拟客户端使用隔离环境专用的离线身份。没有修改原存档的地图或实体。

四客户端主回归通过 78 项引擎检查：缺点位拒绝开局；空闲及对局中重载；训练、靶场和枪战的技能更新及训练世界规则恢复；十种职业的选择、装备及一次技能触发；非参与者的物品和计时隔离；断电、风暴和重连；四种枪械的射击，手枪、AK47、霰弹枪和狙击枪的弹药或换弹；职业感染转换；四人进入、职业分配和重复开局保护；发电机增益；两名玩家的独立治疗抗性；死亡、重生、孢化与清剿；旧结算与新对局隔离；直升机动画，以及修塔、降落、客户端右键登机、撤离结算。

额外执行了 14 项六人 / 十二人检查，以及 7 项十二人断线检查：超过十人时重复分配职业而不遗漏玩家；阶段推进；全部转化结算；母体掉线时感染者等待复活；离线幸存者不会被当作已转化；离线感染者未返回前暂缓清剿。断线处理当前没有超时踢出规则，永久离线时清剿可能一直等待。

另有 8 项多人倒地锚点检查、7 项治疗目标检查、9 项信号塔修复检查和 13 项旧版轮船路线检查：覆盖两名客户端实际死亡、按归属跟随与清理；船医、厨师对队友和自己的选择；工程师、电池、修复人数上限、重叠塔及非参赛者隔离；以及实际长按提交三个船舶部件、修船、右键登船、离港结算。信号塔和轮船的定向检查以服务端命令布置角色、设备和位置，再执行实际游戏函数；这些检查并非对技能完整操作手感的验证。

长流程通过测试指令提供测试线缆、船舶部件及传送玩家到人工测试平台；修塔、修船进度、直升机倒计时和撤离结果由游戏刻自然推进，未直接写入进度。轮船测试为缩短准备时间直接推进到维修阶段。清剿测试用测试指令造成致命伤，并移除临时抗性。测试平台的区块被强制加载。客户端关闭本地物理模拟，不能替代真实玩家对移动手感、战斗、画面、音效、资源包、网络延迟或多人平衡性的验收。断线测试只覆盖短暂的主动断开和重连，不涵盖长期离线、整局无在线玩家等情形；个人 tick 计时仅在玩家在线时推进。没有验证潜艇、自爆等其他结局、全部技能分支、在线认证和长时间性能。

在同一隔离环境中，对十二客户端、其中三人修塔的常态场景各采样一次：调整非职业兜底清理前，三次 100 tick 平均值为 11.2、7.9、6.3 ms；调整后为 5.9、5.0、3.7 ms。原版 `/perf` 报告中两项重复物品清理的调用次数从约每 tick 12–13 次降至约 0.6 次。采样时间短、角色随机且没有实际玩家移动或密集战斗，不能外推为稳定的提升比例或压力测试结论。原版服务端生成性能报告时还输出了 Windows 性能计数器警告及测试崩溃报告生成器错误；报告中的 `example_crash.txt` 标识为 `dummy`，服务端继续运行，但这些环境日志不应被当作数据包全无错误的证明。

当前原存档主世界的实体文件扫描未找到上述玩法所需的地图 marker；隔离副本通过人工平台补齐点位后才能进行完整流程。因此本次结论是**机制在测试地图上通过，不代表现有正式地图可直接开局**。按 [MAP_GUIDE.md](MAP_GUIDE.md) 放置点位，并确保对应区块持续加载后，还需要在正式地图及客户端资源包上验收。

## 复现当前隔离环境

当前沙盒在 `C:\Users\TreeHey\.codex\minecraft-sandboxes\island-escape-1.21.11-20261028-014818`，其中包含服务端、原存档副本、`sandbox.json`、测试依赖、日志、`commands.jsonl` 和最近一次 `engine-results.json`。RCON 密码只保存在该本地沙盒的配置文件中，不要将其提交或用于公开服务端。`tests/minecraft_probe` 是测试夹具数据包的源码；它会生成高空平台并修改世界，只能安装到隔离副本。

沙盒已安装测试依赖时，从项目目录启动原版服务端与测试客户端，然后运行验收：

```powershell
$sandbox = 'C:\Users\TreeHey\.codex\minecraft-sandboxes\island-escape-1.21.11-20261028-014818'
Start-Process -FilePath 'D:\Program Files\Java\jdk-21\bin\java.exe' -ArgumentList '-Xms512M','-Xmx2G','-jar','server.jar','nogui' -WorkingDirectory $sandbox -WindowStyle Hidden
# 等服务端日志出现 Done 和 RCON running 后，在另一个终端启动客户端：
node tools/minecraft_clients.cjs $sandbox
# 等四名 IE_Test 玩家全部加入后，在项目目录运行：
python tools/minecraft_acceptance.py --sandbox $sandbox
```

六 / 十二人、断线及短时性能采样需要先停止四个客户端，再用 `node tools/minecraft_clients.cjs $sandbox 12` 启动十二个客户端，分别运行：

```powershell
python tools/minecraft_scaling_acceptance.py --sandbox $sandbox
python tools/minecraft_disconnect_acceptance.py --sandbox $sandbox
python tools/minecraft_profile_acceptance.py --sandbox $sandbox
```

恢复四客户端后，可分别运行 `python tools/minecraft_anchor_acceptance.py --sandbox $sandbox`、`python tools/minecraft_healing_acceptance.py --sandbox $sandbox`、`python tools/minecraft_signal_acceptance.py --sandbox $sandbox` 和 `python tools/minecraft_ship_acceptance.py --sandbox $sandbox`。

这些脚本会修改沙盒中的对局、玩家和世界规则；请在所有测试客户端上线后运行，并在测试结束后关闭测试客户端和服务端。结果写入沙盒，`/perf` 压缩报告位于其 `debug/profiling/`。

服务端必须加载当前代码的沙盒副本以及 `ie_acceptance_probe`；修改数据包后须同步到副本并 `/reload` 后再跑，不能把一次旧结果当作新代码的结果。脚本检查沙盒清单和测试夹具才执行，但测试会清理对局、改变玩家状态并在平台生成方块，绝不能指向正式存档。需要重建沙盒时，先复制完整世界和同级依赖；使用官方 1.21.11 服务端、安装 Node.js 22 与 `mineflayer@4.39.0` 到沙盒 `clients/`，创建专用 RCON 凭据并将服务端、RCON、客户端控制端限定在本机。测试使用游戏端口 25576、RCON 25577 和客户端控制端口 25578。`sandbox.json` 需要绝对 `root`、`rcon_port` 和 `rcon_password`，夹具复制到副本的 `world/datapacks/ie_acceptance_probe`。

`python tools/check.py` 仍用于无游戏进程的静态与状态回归；它不替代这套引擎测试。[Minecraft 官方服务器和游戏测试说明](https://www.minecraft.net/en-us/article/minecraft-java-edition-1-21-5)及 [Mineflayer 项目](https://github.com/PrismarineJS/mineflayer)提供所用测试能力的背景。
