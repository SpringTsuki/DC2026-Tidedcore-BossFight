# DC2026 - Tidedcore BossFight

> 一个用**纯数据包**（无 Mod / 无插件依赖）在 Minecraft Java 版中复刻 **FF14 式高难副本 BOSS 战** 的项目。
> 最终 BOSS「潮汐核心 / Tided Core」拥有完整的**读条时间轴、机制组合随机、运动会、狂暴与锁血**流程。
>
> 圆形粒子特效基于第三方库 [KunoSayo/BattleLibrary](https://github.com/KunoSayo/BattleLibrary)，详见 [许可与致谢](#许可与致谢)。

---

## 目录

- [DC2026 - Tidedcore BossFight](#dc2026---tidedcore-bossfight)
  - [目录](#目录)
  - [项目简介](#项目简介)
  - [环境要求](#环境要求)
  - [安装与部署](#安装与部署)
  - [如何开始 BOSS 战](#如何开始-boss-战)
  - [技能一览](#技能一览)
  - [战斗流程](#战斗流程)
  - [目录结构](#目录结构)
  - [技能实现原理](#技能实现原理)
    - [1. 整体架构：tick 驱动的状态机](#1-整体架构tick-驱动的状态机)
    - [2. 四段式生命周期：init / tick / check / end](#2-四段式生命周期init--tick--check--end)
    - [3. 计时器与读条 BOSS Bar](#3-计时器与读条-boss-bar)
    - [4. 时间轴调度与技能组合随机](#4-时间轴调度与技能组合随机)
    - [5. 范围判定：以盔甲架为判定锚点](#5-范围判定以盔甲架为判定锚点)
    - [6. 伤害分级系统](#6-伤害分级系统)
    - [7. 分摊机制（Stack）](#7-分摊机制stack)
    - [8. 分散机制（Spread）](#8-分散机制spread)
    - [9. 踩塔机制（Tower）](#9-踩塔机制tower)
    - [10. 钢铁 / 月环（Near / Far）](#10-钢铁--月环near--far)
    - [11. 挡枪与易伤（Bleeding）](#11-挡枪与易伤bleeding)
    - [12. 地火 / 数据流（Dataline）](#12-地火--数据流dataline)
    - [13. 粒子绘制：BattleLibrary 的圆环打表](#13-粒子绘制battlelibrary-的圆环打表)
    - [14. 血量轴、锁血与狂暴](#14-血量轴锁血与狂暴)
    - [15. BGM 与歌词字幕时间轴](#15-bgm-与歌词字幕时间轴)
    - [16. 资源清理与重置](#16-资源清理与重置)
  - [二阶段（boss_extra）：绝难度](#二阶段boss_extra绝难度)
    - [17. 二阶段开场与「异国的诗人」NPC](#17-二阶段开场与异国的诗人npc)
    - [18. 延迟咏唱（delay_memory_forget_far / near）](#18-延迟咏唱delay_memory_forget_far--near)
    - [19. 快速咏唱（fast_memory_forget_far / near）](#19-快速咏唱fast_memory_forget_far--near)
    - [20. 加强踩塔（memory_torrent_songplus）](#20-加强踩塔memory_torrent_songplus)
    - [21. 记忆幻影（memory_shadow）——二阶段的「三运」](#21-记忆幻影memory_shadow二阶段的三运)
    - [22. 二阶段的时间轴与难度差异](#22-二阶段的时间轴与难度差异)
    - [23. 二阶段的收尾清理](#23-二阶段的收尾清理)
  - [已知限制与扩展建议](#已知限制与扩展建议)
  - [许可与致谢](#许可与致谢)
    - [第三方资源](#第三方资源)
    - [其他](#其他)

---

## 项目简介

本项目把 FF14 的副本 BOSS 战体验搬进 Minecraft：玩家要在固定场地内，通过**站位、分组、走位**应对一连串带读条的机制，读条结束时按判定结果结算伤害。

核心设计目标：

| 目标 | 实现手段 |
| --- | --- |
| 零客户端 Mod | 完全基于原版数据包（`pack_format 48`，Minecraft 1.21.x） |
| 精确的机制时序 | 计分板 `trigger` 目标充当逐帧计时器 |
| 可组合的机制 | 每个技能是独立的 `init/tick/check/end` 模块 |
| 随机化流程 | 掉落表 + 箱子探测实现真随机分支 |
| 视觉引导 | 盔甲架 + `dust` 粒子绘制预警圈 |

## 环境要求

- **Minecraft Java Edition 1.21+**（`pack_format: 48`）
- 单人存档或服务端均可，**无需安装任何 Mod**
- 建议 **4 名及以上玩家**：BOSS 战最少需要 4 人才可成功击破
- 在一块固定的场地完成战斗（判定区域为 `x=-11,y=60,z=-11` 起、`dx=22,dy=7,dz=22` 的立方体范围）

## 安装与部署

1. 将仓库内容放入存档的 `datapacks` 目录：

   ```text
   <存档目录>/datapacks/DC2026-Tidedcore-BossFight/
   ├── pack.mcmeta
   └── data/
   ```

   或者直接把整个仓库目录打包成 zip 放进 `datapacks`。

2. 进入游戏后执行重载：

   ```mcfunction
   /reload
   ```

3. 确认数据包已加载：

   ```mcfunction
   /datapack list
   ```

> **提示**：仓库内的 `data/tide_redemption/function.zip` 是函数目录的压缩备份，部署时**不需要**解压，游戏会直接读取 `function/` 目录。

## 如何开始 BOSS 战

游戏包含**两个难度的 BOSS 战**，触发方式不同：

| 难度 | 入口 | 触发方式 |
| --- | --- | --- |
| 一阶段 | `boss/boss_fight.mcfunction` | 命令方块按钮 |
| 二阶段（绝） | `boss_extra/boss_fight_start.mcfunction` | 与场地内的 **NPC「异国的诗人」对话** |

一阶段入口流程：

```mcfunction
# 增加检查函数
scoreboard objectives add bossfight_tidedcore trigger
scoreboard players set #user bossfight_tidedcore 1
```

同时会把入口处的命令方块清除（`setblock 0 61 0 minecraft:air`）并封锁玩家进入区域，因此**开战后无法中途进出**。

- 玩家重生点被设为 `spawnpoint @a 0 60 30`
- 战斗失败或结束后会自动重置场地与计分板

---

## 技能一览

### 一阶段（`boss/`）

| 技能（中文） | 英文 | 机制类型 | 应对方式 |
| --- | --- | --- | --- |
| 记忆分割 · 模块化 | Memory Cut · Module | **分摊** | 分成二组，两人一组分摊 |
| 记忆分割 · 碎片化 | Memory Cut · Shard | **分散** | 四人各自散开 |
| 记忆损伤 · 强制删除 | Memory Delete | **狂暴** | 读条完毕前击杀 BOSS |
| 记忆损伤 · 永恒冻结 | Memory Forever Frozen | **大 AOE** | 读条完毕前吃附魔金苹果 |
| 记忆遗忘 · 远 | Memory Forget · Far | **月环** | 需要靠近 |
| 记忆遗忘 · 近 | Memory Forget · Near | **钢铁** | 需要远离 |
| 记忆洪流 · 数据流 | Memory Torrent · Dataline | **地火** | 按顺序躲避地面 AOE |
| 记忆洪流 · 易伤刃 | Memory Torrent · Bleeding | **挡枪** | 轮流靠近吃伤害，重复吃直接去世 |
| 记忆洪流 · 终末曲 | Memory Torrent · EndSinger | **踩塔** | 四人各踩一座塔 |

### 二阶段（`boss_extra/`，绝难度）

除**复用全部一阶段技能**外，新增以下内容：

| 技能（中文） | 英文 | 机制类型 | 应对方式 |
| --- | --- | --- | --- |
| 记忆遗忘之念 · 远/近 | Memory Forget **Delay** · Far/Near | **延迟咏唱** | 记住圈的落点，判定被推迟到数十秒后 |
| 记忆遗忘 · 远/近（快速） | Memory Forget **Fast** · Far/Near | **快速咏唱** | 读条压缩到 80 tick，反应时间大幅缩短 |
| 记忆洪流 · 终末歌 | Memory Torrent · **EndSong** | **8 塔踩塔** | 8 座塔缺一不可，16 种随机布局 |
| 记忆模仿 · 记忆投影 | Memory Shadow · **Phantom** | **记忆** | 记住 4 个幻影出现的位置 |
| 记忆模仿 · 记忆复制 | Memory Shadow · **Copy** | **记录** | 系统记录你站在哪个幻影旁 |
| 记忆模仿 · 记忆粘贴 | Memory Shadow · **Paste** | **重现** | 圈出现在你/队友身上，按记忆站位 |
| 记忆模仿 · 时空重现 | Memory Shadow · **Realize** | **总判定** | 幻影重演，站错即受伤 |
| —（NPC 系统） | NPC Dialogue | **对话触发** | 与「异国的诗人」对话开战 |

---

## 战斗流程

整场战斗由 `boss/tick.mcfunction` 中一条**逐帧时间轴**驱动（单位为 tick，20 tick = 1 秒）：

```mcfunction
# 时间轴
scoreboard players add #user tidedcore_fight 1
```

### 一阶段主要节点

| tick | 事件 |
| --- | --- |
| 1 | 生成特效命令方块，BOSS 血量开始增长（开场演出） |
| 180 | 天气转为雷暴 |
| 359 | **生成 BOSS**（僵尸，1024 血，全套下界合金） |
| 360 | 召唤雷电，BOSS Bar 转红，血量与实体同步 |
| 640 | 第一次地火 |
| 1230 | 第一次分摊 |
| 1540 | 第一次踩塔 |
| 1820 | 第一次分散 |
| 2000 ~ 2255 | 连续四次挡枪 |
| 2400 | 永恒冻结（进入 P2 演出） |
| 2830 | 钢铁 / 月环组合（随机） |
| 3260 | 第二次地火 |
| 3520 | 第二次分散或分摊（随机） |
| 3820 | 第二次踩塔 |
| 3940 / 4270 | 钢铁 / 月环 与 分散 / 分摊 |
| 4500 | 第三次地火 + 分散后分摊（或反向） |
| 4890 | 最后一次踩塔 |
| **5060** | **狂暴 · 强制删除** |
| 5570 | 未击杀则 BOSS 战结束（失败） |
| 5580 | 停止存活检测 |

### 二阶段主要节点

`boss_extra/tick.mcfunction` 约 252 行、**7100 tick**，复用一阶段技能并插入新机制：

| tick | 事件 |
| --- | --- |
| 50 ~ 400 | 开场台词（8 句） |
| 224 | **生成 BOSS**（血量 +5/tick 增长） |
| 280 ~ 460 | 开场演出：BOSS 悬浮空中，地面橙圈扩至 9 格 |
| 460 | BOSS 落地 + 全屏 AOE 判定（9 格内致死） |
| 580 | 钢铁 / 月环（延迟版，420t 后接第二段） |
| 800 | 第一次地火 |
| 1050 | 第一次分摊 / 分散 |
| 1300 | 第一次踩塔（**8 塔加强版**） |
| 1500 | 第二次地火 |
| 2140 ~ 2395 | 第一次运动会（挡枪 ×4 + 快速钢铁月环 ×2） |
| 2600 | 永恒冻结（进入 P2） |
| 3320 | 第二次地火（第二次运动会） |
| 3530 | 第二次踩塔 |
| **3900 ~ 5800** | **第三次运动会：记忆幻影（三运）** |
| 6000 | 第三次地火 |
| 6200 / 6400 | 最后一次分摊分散 / 钢铁月环 |
| **6600** | **狂暴 · 强制删除** |
| 7100 | 未击杀则全灭失败 |

---

## 目录结构

```text
DC2026-Tidedcore-BossFight/
├── pack.mcmeta                 # 数据包元信息（pack_format 48）
├── README.md
└── data/
    ├── minecraft/tags/function/tick.json   # 主循环挂载点
    └── tide_redemption/
        ├── function/
        │   ├── bgm/            # BGM 与控制、歌词字幕时间轴
        │   ├── boss/           # 一阶段 BOSS（主 BOSS 战）
        │   │   ├── boss_fight.mcfunction   # 入口 / 初始化
        │   │   ├── tick.mcfunction         # 主时间轴
        │   │   ├── boss_random.mcfunction  # 随机数生成
        │   │   ├── boss_check_player.mcfunction
        │   │   ├── boss_success / boss_failed / boss_end / boss_fight_end
        │   │   ├── boss_tp / boss_tp_facing / boss_tp_ground
        │   │   ├── skill/      # 各技能模块
        │   │   └── lib/        # 通用库（圆形粒子 / 收尾清理 / 图像）
        │   └── boss_extra/     # 二阶段 BOSS（复用一阶段技能 + 新技能）
        │       ├── boss_fight_start.mcfunction  # 入口
        │       ├── tick.mcfunction              # 主时间轴（约 7100 tick）
        │       ├── boss_random_2.mcfunction     # 随机数（同一套箱子方案）
        │       ├── boss_tp / boss_tp_sky        # 场地内 / 空中待机
        │       ├── npc/        # 「异国的诗人」NPC 对话触发系统
        │       ├── skill/      # 新技能 + 一阶段技能复用
        │       └── lib/        # 同 lib 副本（独立命名空间）
        └── loot_table/boss/boss_random.json  # 随机分支用的战利品表
```

---

## 技能实现原理

### 1. 整体架构：tick 驱动的状态机

数据包通过 `minecraft:tick` 函数标签挂载到「每游戏刻执行一次」的入口：

`data/minecraft/tags/function/tick.json`

```json
{
    "replace": false,
    "values": [
        "tide_redemption:bgm/tick",
        "tide_redemption:bgm/lyric/tick",
        "tide_redemption:boss/tick",
        "tide_redemption:boss_extra/tick"
    ]
}
```

也就是说，**整个游戏逻辑就是 4 个每帧被调用的函数**。其中 `boss/tick` 再向下分发到所有技能：

```mcfunction
function tide_redemption:boss/skill/boss_spawn/tick
function tide_redemption:boss/skill/memory_cut_module/tick
function tide_redemption:boss/skill/memory_cut_shard/tick
function tide_redemption:boss/skill/memory_torrent_dataline/tick
...
```

这里用了一个重要的**互斥开关**，避免两个 BOSS 同时运行：

```mcfunction
# 若BOSS EXTRA正在执行此函数，则不执行此判断函数
execute if score #user bossfight_extra_tidedcore matches 1 run return 0
```

`#user`（以 `#` 开头的是**假玩家 / fake player**）是全局状态寄存器，# 前缀表示它不是真实玩家，只用于存放计分板数值。

### 2. 四段式生命周期：init / tick / check / end

每个技能都是一个自包含目录，固定包含 4 类文件：

| 文件 | 职责 |
| --- | --- |
| `init.mcfunction` | 创建计分板目标、建立 BOSS Bar、生成判定用盔甲架、分配玩家标签 |
| `tick.mcfunction` | 每帧推进计时器、驱动动画、在特定帧调用 `check` 与 `end` |
| `check.mcfunction` | **只在结算帧执行一次**的伤害判定 |
| `end.mcfunction` | 移除计分板、BOSS Bar、标签与实体，清理现场 |

以「记忆遗忘 · 近」为例（`skill/memory_forget_near/`）：

**init** —— 建一个 120 帧长的读条：

```mcfunction
scoreboard objectives add memory_forget_near trigger
bossbar add minecraft:memory_forget_near {"color":"yellow","text":"「记忆遗忘 · 近」| 「Memory Forget · Near」"}
bossbar set minecraft:memory_forget_near max 120
bossbar set minecraft:memory_forget_near players @a
summon armor_stand 0 60 0 {NoGravity:true,Invisible:true,Tags:[memory_forget_near.armor_stand]}
```

**tick** —— 推进计时、驱动预警动画、在 120 帧结算、121 帧清理：

```mcfunction
scoreboard players add #user memory_forget_near 1
execute store result bossbar minecraft:memory_forget_near value run scoreboard players get #user memory_forget_near

# 动画控制：每 20 帧刷新一次预警圈
execute as @e[tag=memory_forget_near.armor_stand] at @s if score #user memory_forget_near matches 20 run function .../image_orange
... (40 / 60 / 80 / 100 帧重复)
execute as @e[tag=memory_forget_near.armor_stand] at @s if score #user memory_forget_near matches 120 run function .../image_red

# 伤害判定
execute if score #user memory_forget_near matches 120 run function .../check
execute if score #user memory_forget_near matches 121 run function .../end
```

**check** —— 判定只有一行，但决定了整个机制：

```mcfunction
execute as @e[tag=memory_forget_near.armor_stand] at @s if entity @a[distance=..8] run effect give @a[distance=..8] instant_damage 1 1
# 半径8格外安全
```

**end** —— 收尾：

```mcfunction
scoreboard objectives remove memory_forget_near
bossbar remove minecraft:memory_forget_near
kill @e[tag=memory_forget_near.armor_stand]
```

这套「读条 → 结算 → 清理」的结构在 9 个技能中重复出现，是本项目最核心的工程模式。

### 3. 计时器与读条 BOSS Bar

计时器借用了计分板的 `trigger` 类型（本意是给玩家触发用的类型，这里当作**纯数值容器**）：

```mcfunction
scoreboard players add #user memory_forget_near 1
execute store result bossbar minecraft:memory_forget_near value run scoreboard players get #user memory_forget_near
```

`execute store result bossbar ... value` 把计分板数值写进 BOSS Bar 的进度条，于是**读条长度 = 技能持续时间**，玩家能直观看到还有多久结算。

各技能的读条长度（BOSS Bar `max`）：

| 技能 | 读条长度（tick） | 结算帧 | 判定方式 |
| --- | --- | --- | --- |
| 记忆分割 · 模块化 | 140 | 139 | 分摊组内人数 ≥ 2 安全，否则致死 |
| 记忆分割 · 碎片化 | 140 | 139 | 每人 2 格内**只有自己**才安全 |
| 记忆遗忘 · 近（钢铁） | 120 | 120 | 8 格**内**受伤 |
| 记忆遗忘 · 远（月环） | 120 | 120 | 4.1~12 格**环带**受伤 |
| 记忆洪流 · 终末曲（踩塔） | 160 | 160 | 每塔必须有人 |
| 记忆洪流 · 易伤刃（挡枪） | 80 | 80 | 最近者受伤并叠易伤 |
| 记忆洪流 · 数据流（地火） | 160 | — | 阶段性多段判定 |
| 记忆损伤 · 永恒冻结 | 321 | 320 | 13 格内致死，需附魔金苹果 |
| 记忆损伤 · 强制删除（狂暴） | 500 | 501 | 读条内未击杀即失败 |

### 4. 时间轴调度与技能组合随机

主时间轴用「tick 精确匹配」来触发技能：

```mcfunction
execute if score #user tidedcore_fight matches 640 run function tide_redemption:boss/skill/memory_torrent_dataline/init
execute if score #user tidedcore_fight matches 1230 run function tide_redemption:boss/skill/memory_cut_module/init
```

组合技则用 `schedule` 做**延迟追加**，例如「先钢铁后月环」：

```mcfunction
execute if score #user tidedcore_fight matches 2830 run function tide_redemption:boss/boss_random
# 随机数 1：先近（钢铁），120t 后接远（月环）
execute if score #user tidedcore_fight matches 2830 if score #user tidedcore_random matches 1 run function .../memory_forget_near/init
execute if score #user tidedcore_fight matches 2830 if score #user tidedcore_random matches 1 run schedule function .../memory_forget_far/init 120t
# 随机数 2：先远（月环），120t 后接近（钢铁）
execute if score #user tidedcore_fight matches 2830 if score #user tidedcore_random matches 2 run function .../memory_forget_far/init
execute if score #user tidedcore_fight matches 2830 if score #user tidedcore_random matches 2 run schedule function .../memory_forget_near/init 120t
```

**随机数是怎么来的？** 这是本项目一个很巧妙的设计（`boss_random.mcfunction`）——数据包没有原生随机数指令，于是作者**借用一个真实箱子 + 战利品表**：

```mcfunction
setblock 0 58 0 minecraft:chest
loot insert 0 58 0 loot tide_redemption:boss/boss_random
execute if data block 0 58 0 {Items:[{Slot:0b,id:"minecraft:coal_block"}]} run scoreboard players set #user tidedcore_random 1
execute if data block 0 58 0 {Items:[{Slot:0b,id:"minecraft:lapis_block"}]} run scoreboard players set #user tidedcore_random 2
data merge block 0 58 0 {Items:[]}
setblock 0 58 0 minecraft:air
```

配套的战利品表 `loot_table/boss/boss_random.json` 中，`coal_block` 与 `lapis_block` 的 `weight` 都是 `1`，即 **50% / 50% 等概率二选一**。箱子生成后立刻被读取、清空、销毁，玩家完全看不到。

想要改成三选一，只需在战利品表里加一个等权物品，再加一行 `execute if data ...` 判定即可。

### 5. 范围判定：以盔甲架为判定锚点

数据包**无法直接对「某个坐标」做距离查询**（`@a[distance=..N]` 必须相对一个执行者）。本项目的解法是：**在机制中心点生成一个隐形、无重力的盔甲架**，用它作为判定锚点。

```mcfunction
summon armor_stand 0 60 0 {NoGravity:true,Invisible:true,Tags:[memory_forget_near.armor_stand]}
```

判定时把自己「移动」到盔甲架身上再查询：

```mcfunction
execute as @e[tag=memory_forget_near.armor_stand] at @s if entity @a[distance=..8] run effect give @a[distance=..8] instant_damage 1 1
```

拆解：`as <盔甲架>` 切换执行者 → `at @s` 把坐标设为盔甲架位置 → 此时 `@a[distance=..8]` 就等价于「距圆心 8 格内的所有玩家」。

**为什么要用盔甲架而不是直接写坐标？** 因为 BOSS 会移动、机制中心会跟随玩家。例如「挡枪」技能把锚点跟随最近玩家：

```mcfunction
execute as @e[tag=memory_torrent_bleeding.armor_boss] at @s positioned as @a[sort=nearest,limit=1] run tp @e[tag=memory_torrent_bleeding.armor_dust] ~ ~2 ~
```

另一处妙用是 **`positioned ^ ^7 ^` 的局部坐标堆叠**——用同一个盔甲架在不同高度画出多层圆环：

```mcfunction
execute as @e[tag=memory_forever_delete4] at @s positioned ^ ^1 ^ run function tide_redemption:boss/lib/circle/aqua/13.0
execute as @e[tag=memory_forever_delete5] at @s positioned ^ ^2 ^ run function tide_redemption:boss/lib/circle/aqua/13.0
... (直到 ^ ^7 ^，形成 7 层高的圆柱体预警)
```

### 6. 伤害分级系统

所有伤害都用 `effect give ... instant_damage`（瞬间伤害）实现，通过**等级参数**控制轻重：

| 命令 | 含义 |
| --- | --- |
| `instant_damage 1 0` | 低伤害（可承受） |
| `instant_damage 1 1` | 中等伤害 |
| `instant_damage 1 2` | 高伤害（需附魔金苹果） |
| `instant_damage 1 5` | **致死级伤害** |

### 7. 分摊机制（Stack）

`memory_cut_module` —— 「分成两组，每组至少 2 人」。

**第一步，用 `@r` 随机抽两人**（`@r` 是随机单目标选择器）：

```mcfunction
# 选择两位需要进行分摊处理伤害的玩家
execute as @r[x=-11,y=60,z=-11,dx=22,dy=7,dz=22] at @s run tag @s add cut_module_A
execute as @r[x=-11,y=60,z=-11,dx=22,dy=7,dz=22,tag=!cut_module_A] at @r run tag @s add cut_module_B
```

注意第二行的 `tag=!cut_module_A` 排除条件——保证不会重复抽到同一个人。

**第二步，结算时数人数**：

```mcfunction
# 分别将分摊范围内的玩家数量导入计分板
execute store result score #player_number memory_cut_module_A run execute if entity @a[distance=..2]

# 若玩家数量大于2，则为低伤害，否则分摊玩家收到致死级伤害
execute if score #player_number memory_cut_module_A matches 2.. run effect give @a[distance=..3] minecraft:instant_damage 1 0
execute unless score #player_number memory_cut_module_A matches 2.. run effect give @a[distance=..3] minecraft:instant_damage 1 5
```

这里有个很关键的技巧：`execute store result score ... run execute if entity @a[...]`——**把「条件是否成立」当作返回值存进计分板**。`if entity` 成功返回 1，失败返回 0。由于判定半径是 2 格，这个数值实际上就是「圈内人数」。

**第三步，重叠惩罚**——两个分摊圈靠太近则全灭：

```mcfunction
# 如果分摊重叠则范围内玩家直接去世
execute as @e[tag=cut_module_A] at @s if entity @e[tag=cut_module_B, distance=..3] run effect give @a[distance=..3] minecraft:instant_damage 1 5
```

### 8. 分散机制（Spread）

`memory_cut_shard` —— 「四人各自散开」，是分摊的镜像逻辑。

**分配 4 个标签**（层层排除已分配者）：

```mcfunction
execute as @r[x=-11,y=60,z=-11,dx=22,dy=7,dz=22] at @s run tag @s add memory_cut_shard_A
execute as @r[x=-11,y=60,z=-11,dx=22,dy=7,dz=22,tag=!memory_cut_shard_A] at @s run tag @s add memory_cut_shard_B
execute as @r[x=-11,y=60,z=-11,dx=22,dy=7,dz=22,tag=!memory_cut_shard_A,tag=!memory_cut_shard_B] at @s run tag @s add memory_cut_shard_C
execute as @r[x=-11,y=60,z=-11,dx=22,dy=7,dz=22,tag=!memory_cut_shard_A,tag=!memory_cut_shard_B,tag=!memory_cut_shard_C] at @s run tag @s add memory_cut_shard_D
```

**每个玩家头顶生成一个跟随锚点**（`~ ~3 ~` 抬高 3 格）：

```mcfunction
execute as @e[tag=memory_cut_shard_A] at @s run summon armor_stand ~ ~3 ~ {Tags:[memory_cut_shard.armor_dustA,memory_cut_shard.armor_dust],Invisible:true,NoGravity:true}
```

**判定与分摊相反**：圈内**恰好只有自己（=1）**才安全，≥2 就是撞车，全吃致死伤害：

```mcfunction
execute store result score #player_number memory_cut_shard_A run execute as @e[tag=memory_cut_shard_A] at @s if entity @a[distance=..2]
execute as @e[tag=memory_cut_shard_A] at @s if score #player_number memory_cut_shard_A matches 1 run effect give @a[distance=..2] minecraft:instant_damage 1 0
execute as @e[tag=memory_cut_shard_A] at @s if score #player_number memory_cut_shard_A matches 2.. run effect give @a[distance=..2] minecraft:instant_damage 1 5
```

> **设计对照**：分摊是「人越多越好（≥2 安全）」，分散是「人越少越好（=1 安全）」。两者共用同一套「数人数 → 按阈值分级」的判定骨架，只是阈值相反。

### 9. 踩塔机制（Tower）

`memory_torrent_song` —— 「四人各踩一座塔，缺一不可」。

**随机决定塔位**（正点 / 斜点两种布局），复用同一套随机数系统：

```mcfunction
function tide_redemption:boss/boss_random
execute if score #user tidedcore_random matches 1 run function tide_redemption:boss/skill/memory_torrent_song/status_a/spawn_tower
execute if score #user tidedcore_random matches 2 run function tide_redemption:boss/skill/memory_torrent_song/status_b/spawn_tower
```

**每座塔生成判定锚点**，`torrent_song_A` ~ `torrent_song_D` 共 4 个。

**判定分两段**：先给踩塔者低伤害作为「确认踩到」的反馈，再检查是否有空塔：

```mcfunction
# 若玩家数量大于1，则该玩家承受低伤害
execute as @e[tag=torrent_song_A] at @s if score #player_number memory_torrent_song_tower_A matches 1.. run effect give @a[distance=..2] minecraft:instant_damage 1 0
...
# 如果其中一塔内无人则全员受到致死级伤害
execute as @e[tag=torrent_song_A] at @s unless score #player_number memory_torrent_song_tower_A matches 1.. run effect give @a[distance=..30] minecraft:instant_damage 1 5
```

注意惩罚半径是 **30 格**（覆盖全场），意味着**漏塔 = 团灭**，这是典型的 FF14 连坐机制。

### 10. 钢铁 / 月环（Near / Far）

这两个技能是**共用代码、只改判定条件**的一对——完美体现了模块化设计。

**「近」（钢铁 / Near）**：范围内受伤，**圈外安全**

```mcfunction
execute as @e[tag=memory_forget_near.armor_stand] at @s if entity @a[distance=..8] run effect give @a[distance=..8] instant_damage 1 1
# 半径8格外安全
```

**「远」（月环 / Far）**：`distance=4.1..12` 形成**环带**，圈内安全但必须远离

```mcfunction
execute as @e[tag=memory_forget_far.armor_stand] at @s if entity @a[distance=4.1..12] run effect give @a[distance=4.1..12] instant_damage 1 1
# 半径4格内安全
```

两者的 `tick` / `init` / `end` 结构完全一致，**唯一区别就是 `check.mcfunction` 里那一行距离区间**（`..8` vs `4.1..12`）。这两个技能还常被 `schedule` 串联成组合技，考验玩家的走位切换。

> 细节：远技能用 `4.1` 而不是 `4`，是为了规避边界浮点误差导致站在 4 格整的人被误判。

### 11. 挡枪与易伤（Bleeding）

`memory_torrent_bleeding` —— 「轮流靠近 BOSS 吃伤害，**重复吃到直接去世**」。

这是唯一使用**状态标签做「已吃过」记忆**的技能：

```mcfunction
execute as @e[tag=memory_torrent_bleeding.armor_boss] at @s if entity @a[sort=nearest,limit=1] run effect give @a[sort=nearest,limit=1] instant_damage 1 0
execute as @e[tag=memory_torrent_bleeding.armor_boss] at @s if entity @a[sort=nearest,limit=1] run effect give @a[sort=nearest,limit=1] weakness 10 0
# 若最近者身上已有标签（= 已经吃过一次），则致死
execute as @e[tag=memory_torrent_bleeding.armor_boss] at @s if entity @a[sort=nearest,limit=1] if entity @a[tag=memory_torrent_bleeding] run effect give @a[sort=nearest,limit=1] instant_damage 1 5
# 打标记：本轮已经吃过
execute as @e[tag=memory_torrent_bleeding.armor_boss] at @s if entity @a[sort=nearest,limit=1] run tag @a[sort=nearest,limit=1] add memory_torrent_bleeding
```

关键点：

- `@a[sort=nearest,limit=1]` —— 每次选**距离锚点最近的一个人**，天然实现「轮流」挡枪。
- 判定顺序至关重要：**先查旧标签 → 再打新标签**。如果顺序反过来，所有人都会在第一次就被判死。
- 战斗在 tick 2000 / 2085 / 2170 / 2255 连续触发 4 次（间隔 85 tick = 4.25 秒），最后在 2340 用 `remove_tag.mcfunction` 统一清空标签，开始新一轮。

### 12. 地火 / 数据流（Dataline）

`memory_torrent_dataline` —— 最复杂的技能，包含一个迷你 BOSS 与多段地面 AOE：

```mcfunction
function tide_redemption:boss/boss_tp_ground
function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/miniboss_spawn
```

它使用了**双计时器**：`memory_torrent_dataline` 与 `memory_torrent_dataline.timeline` 分别跟踪主流程与子阶段，配合 `miniboss/aoe_orange.mcfunction` / `aoe_red.mcfunction` 做多轮预警与判定。

### 13. 粒子绘制：BattleLibrary 的圆环打表

`lib/circle/` 下的文件是本项目最「重」的部分（单文件最大 22 KB）。这些文件**并非本项目自研**，而是取自第三方库 [`KunoSayo/BattleLibrary`](https://github.com/KunoSayo/BattleLibrary)，详见 [许可与致谢](#许可与致谢)。每个文件的开头都保留着原库的生成标记：

```mcfunction
# Generated by rust codes
execute positioned ~0.00000 ~ ~1.00000 facing ~-0.00000 ~ ~-1.00000 run function tide_redemption:boss/lib/dust/dust_red
execute positioned ~0.17365 ~ ~0.98481 facing ~-0.17365 ~ ~-0.98481 run function tide_redemption:boss/lib/dust/dust_red
execute positioned ~0.34202 ~ ~0.93969 facing ~-0.34202 ~ ~-0.93969 run function tide_redemption:boss/lib/dust/dust_red
```

**原理**：原版粒子指令一次只能在一个点生成粒子，所以要在游戏里画出平滑的圆，必须**按角度采样**——BattleLibrary 用 Rust 程序（仓库内含 `Cargo.toml` 与 `src/`）预先算好圆周上每一点的坐标与朝向，把结果**打表**生成 `.mcfunction`。本项目复用了这份坐标表，只把结尾的回调 `battleapi:circle_cb` 换成了自己的粒子函数。

> 可以注意到 `0.17365`、`0.34202` 等数值正是 `sin/cos` 在 10° 间隔上的取值，证实是等角度采样生成的。

- `positioned ~x ~ ~z` —— 圆上采样点的**相对偏移**
- `facing ~-x ~ ~-z` —— 让粒子朝向圆心（`facing` 参数对部分粒子形态有影响）
- `dust_red` / `dust_orange` / `dust_aqua` —— 本项目实际发射粒子的叶子函数（原库此处回调为 `battleapi:circle_cb`）

叶子函数只有一行：

```mcfunction
particle dust{color:[1.0, 0.0, 0.0],scale:2.0} ~ ~ ~ 0 0 0 0 1 force
```

其中 `scale:2.0` 让粒子变大以便看清，`force` 保证**超出粒子显示距离也能渲染**（这很重要，否则远处的预警圈会消失）。

目录结构体现了**按半径预生成**的策略：

```text
lib/circle/
├── red/     # 危险（结算帧）预警圈：0.5 ~ 15.0 半径，步进 0.5
├── orange/  # 蓄力（读条中）预警圈：0.5 ~ 15.0 半径，步进 0.5
└── aqua/    # 特殊演出用：13.0
```

文件大小随半径增长（半径越大采样点越多）：`0.5` 半径约 4.4 KB，`15.0` 半径约 22 KB。**读条期间用橙色渐变圈表示「还在蓄力」，结算帧切换成红色实心圈表示「即将判定」**——这套「橙 → 红」的视觉语言直接对应 `image_orange` 与 `image_red` 两个函数。

> 原库提供 0.5 ~ 25.0 半径共 50 个文件，本项目取用了其中 0.5 ~ 15.0 的部分。

### 14. 血量轴、锁血与狂暴

BOSS 是一个**僵尸**实体，通过 NBT 定制：

```mcfunction
summon minecraft:zombie 0 60 0 {Tags:[tidedcore],Health:1024f,attributes:[{id:"minecraft:generic.max_health",base:1024f}],ArmorDropChances:[0f,0f,0f,0f],ArmorItems:[{id:"minecraft:netherite_boots"},{id:"minecraft:netherite_leggings"},{id:"minecraft:netherite_chestplate"},{id:"minecraft:netherite_helmet"}],CustomName:'{"translate":"game.boss_fight"}',DeathLootTable:"tide_redemption:boss/boss_drop"}
```

- `Health:1024f` + `max_health:1024f` —— 1024 点血量，且**必须同时设置 `attributes`**，否则僵尸会在下一帧被重置回默认血量
- `ArmorDropChances:[0f,0f,0f,0f]` —— **护甲掉落率为 0**，防止玩家捡装备
- `CustomName` 用 `translate` 做**本地化名称**

**血量同步**（实体 → 计分板 → BOSS Bar）：

```mcfunction
execute if score #user tidedcore_fight matches 360.. run execute as @e[tag=tidedcore] at @s store result score #tidedcore tidedcore_hp run data get entity @s Health
execute if score #user tidedcore_fight matches 360.. run execute store result bossbar minecraft:boss_tidedcore value run scoreboard players get #tidedcore tidedcore_hp
execute if score #user tidedcore_fight matches 360.. unless entity @e[tag=tidedcore] run scoreboard players set #tidedcore tidedcore_hp 0
```

第三行处理特殊情况：**BOSS 实体不存在时**（被 `/kill` 等），也要把血量归零以触发胜利判定。

**开场血量增长**（第 1~359 tick 血量从 0 涨到 1077，制造「充能」演出）：

```mcfunction
execute if score #user tidedcore_fight matches 1..359 run scoreboard players add #tidedcore tidedcore_hp 3
```

**锁血机制** —— 打到 100 血时强制卡住，把玩家按在机制阶段：

```mcfunction
execute if score #tidedcore tidedcore_minhp matches 1 if score #tidedcore tidedcore_hp matches ..100 run data modify entity @e[tag=tidedcore,limit=1,type=zombie] Health set value 100
```

锁血期间还会按 tick 触发三句提示台词（`defend1` ~ `defend3`），这是**用计分板当延迟计时器**的写法：

```mcfunction
execute if score #user tidedcore_fight matches 361..5060 if score #tidedcore tidedcore_hp matches ..100 run scoreboard objectives add tidedcore_check_hp_defend trigger
scoreboard players add #user tidedcore_check_hp_defend 1
execute if score #user tidedcore_check_hp_defend matches 20 run tellraw @a {"translate":"game.boss_fight.defend1"}
execute if score #user tidedcore_check_hp_defend matches 60 run tellraw @a {"translate":"game.boss_fight.defend2"}
execute if score #user tidedcore_check_hp_defend matches 100 run tellraw @a {"translate":"game.boss_fight.defend3"}
```

**狂暴** —— 到 5060 tick 时调用 `memory_forever_delete/init`，其中一行解除锁血，意味着**玩家可以在狂暴读条期间把 BOSS 打死**：

```mcfunction
# 解除锁血
scoreboard players set #tidedcore tidedcore_minhp 0
```

**胜利 / 失败判定**：

```mcfunction
# 检测BOSS血量，若BOSS血量归零则BOSS战成功
execute if score #tidedcore tidedcore_hp matches 0 run function tide_redemption:boss/boss_success
```

存活检测（`boss_check_player.mcfunction`）—— 判定区域内是否还有人活着，全灭则失败：

```mcfunction
execute store result score #player_number tidedcore_fight_player run execute if entity @a[x=-11,y=60,z=-11,dx=22,dy=7,dz=22]
execute if score #player_number tidedcore_fight_player matches 0 run function tide_redemption:boss/boss_failed
```

### 15. BGM 与歌词字幕时间轴

BGM 用 `playsound ... record` 播放自定义音效（`record` 通道专用于长音频）：

```mcfunction
stopsound @a
title @a times 1.5s 3s 2.5s
title @a actionbar {"translate":"bgm.name.boss_tidedcore"}
execute as @a at @s run playsound minecraft:boss_tidedcore record @s ~ ~ ~ 1
```

歌词字幕是**独立的时间轴**，在 `lyric/tick.mcfunction` 里逐帧推进计数，`lyric.mcfunction` 内按 tick 精确匹配显示（共 149 行）：

```mcfunction
execute if score #user bgm_boss_tidedcore matches 380 run title @a title {"text":""}
execute if score #user bgm_boss_tidedcore matches 380 run title @a subtitle {"translate":"bgm.boss_tidedcore.1"}
```

**这套设计的精妙之处在于「零文本硬编码」**：所有台词、名称、提示都写成 `{"translate":"key"}`，实际文本在**资源包的语言文件**里。这样同一份数据包可以**只换语言文件就支持多语言**，也便于后续修改文案而不用动逻辑代码——属于标准的数据包工程实践。

### 16. 资源清理与重置

战斗结束后调用 `boss_fight_end.mcfunction` 做完整重置：

```mcfunction
tp @e[tag=tidedcore] ~ -255 ~          # BOSS 传送到虚空（移除）

function tide_redemption:boss/skill/boss_spawn/end

# 重置BOSS战
setblock 0 60 0 minecraft:air
setblock 0 61 0 minecraft:air
clone 0 57 1 0 58 1 to minecraft:overworld 0 60 0 replace

# 开放玩家进入
clone -1 56 3 1 58 3 to minecraft:overworld -1 60 12 replace

scoreboard objectives remove tidedcore_fight
scoreboard objectives remove tidedcore_random
...
# 重置检查函数
scoreboard players set #user bossfight_tidedcore 0
```

要点：

- **用 `tp ~ -255 ~` 移除 BOSS 而不是 `kill`**——避免触发死亡动画与掉落，也避免 `boss_success` 被误触发
- 用 `clone` 恢复入口方块，实现场地的**状态还原**
- 逐个 `scoreboard objectives remove` 清理计分板
- 最后把 `bossfight_tidedcore` 置 0，**允许重新开战**

胜利时（`boss_success.mcfunction`）会**统一调用所有技能的 `end`**，确保不会残留任何计分板或实体：

```mcfunction
function tide_redemption:boss/skill/memory_cut_module/end
function tide_redemption:boss/skill/memory_cut_shard/end
function tide_redemption:boss/skill/memory_forever_delete/end
... (共 10 个技能)
```

---

## 二阶段（boss_extra）：绝难度

`boss_extra/` 是同一只 BOSS 的**「绝」难度版本**，主时间轴长达约 7100 tick（一阶段为 5580）。它并非复制粘贴，而是**大量 `function` 复用了 `boss/` 下的技能模块**：

```mcfunction
# 引用源BOSS技能组Tick
function tide_redemption:boss/skill/memory_cut_module/tick
function tide_redemption:boss/skill/memory_cut_shard/tick
function tide_redemption:boss/skill/memory_torrent_dataline/tick
# function tide_redemption:boss/skill/memory_torrent_song/tick   ← 被注释，改用 songplus
function tide_redemption:boss/skill/memory_torrent_bleeding/tick
function tide_redemption:boss/skill/memory_forget_far/tick
function tide_redemption:boss/skill/memory_forget_near/tick
function tide_redemption:boss/skill/memory_forever_frozen/tick
function tide_redemption:boss/skill/memory_forever_delete/tick
```

因此一阶段的「分摊 / 分散 / 地火 / 挡枪 / 钢铁月环 / 永恒冻结 / 狂暴」在二阶段**原样复用**，二阶段只新增下列技能与系统。

> **命名空间隔离的一个细节**：`boss_extra/lib/circle/` 是 `boss/lib/circle/` 的**独立副本**，且其 `circle/*.mcfunction` 内的回调指向的是 `boss/lib/dust/*`（一阶段的粒子函数），并非 `boss_extra` 自己的。所以二阶段的圆环是「坐标表独立、粒子函数共用」。

### 17. 二阶段开场与「异国的诗人」NPC

二阶段不是从命令方块按钮直接开战，而是**先与 NPC 对话**。

`npc/init_npc.mcfunction` 生成一个盔甲架扮演的 NPC：

```mcfunction
summon minecraft:armor_stand 924.5 102 2091 {Tags:[tided_npc,tided_npc_bossextra],ArmorItems:[{id:"minecraft:leather_boots"},{id:"minecraft:leather_leggings"},{id:"minecraft:leather_chestplate"},{id:"minecraft:player_head",components:{profile:SpringAurora}}],Invisible:true,DisabledSlots:16191,CustomName:'{"translate":"game.boss.extra.npc"}',CustomNameVisible:true}
```

- 用**皮革盔甲 + 玩家头颅**拼出一个「异国的诗人」形象，`profile:SpringAurora` 让头颅显示为指定玩家的皮肤
- `DisabledSlots:16191` —— **禁止玩家与盔甲架交互**（防止被拿走装备）
- `Invisible:true` 但 `CustomNameVisible:true` —— 只显示名字牌

对话系统是纯数据包的**点击触发**实现（`npc/tick.mcfunction`）：

```mcfunction
# 检测玩家距离NPC的距离
execute as @e[tag=tided_npc_bossextra] at @s as @a[distance=..3] run scoreboard players add @s tided_npc_bossextra_chat 1
execute as @e[tag=tided_npc_bossextra] at @s as @a[distance=..3] run scoreboard players enable @s tided_npc_bossextra_trigger
execute as @e[tag=tided_npc_bossextra] at @s as @a[distance=3..] run scoreboard players set @s tided_npc_bossextra_chat 0
```

三行分别是：**靠近 3 格内开始计时**、**启用 trigger 计分板**、**走远则重置**。

对话用 `tellraw` 的 `clickEvent` 实现「点选项继续」的分支：

```mcfunction
execute as @a at @s if score @s tided_npc_bossextra_chat matches 20 run tellraw @s {"text":"","extra":[{"translate":"game.boss.extra.npc.question1"}],"clickEvent":{"action": "run_command","value": "/trigger tided_npc_bossextra_trigger set 1"}}
```

点击后把 `tided_npc_bossextra_trigger` 设为 1，下一 tick 就输出对应的下一段文本；选项被选到 `3` 时调用 `checkboss`：

```mcfunction
execute as @a at @s if score @s tided_npc_bossextra_trigger matches 3 run function tide_redemption:boss_extra/npc/checkboss
```

`checkboss` 负责**防止重复开战**——若任一 BOSS 正在进行则只提示并 `return 0`：

```mcfunction
execute if score #user bossfight_tidedcore matches 1 run tellraw @a {"translate": "game.boss.extra.npc.startcheck"}
execute if score #user bossfight_tidedcore matches 1 run return 0
execute if score #user bossfight_extra_tidedcore matches 1 run tellraw @a {"translate": "game.boss.extra.npc.startcheck"}
execute if score #user bossfight_extra_tidedcore matches 1 run return 0
function tide_redemption:boss_extra/boss_fight_start
```

> `scoreboard players enable` 是 `trigger` 计分板的必要前置——只有被 enable 的玩家才能用 `/trigger` 修改自己的分数，这是原版自带的防作弊机制。

### 18. 延迟咏唱（delay_memory_forget_far / near）

**机制**：预警圈出现后**不立即结算**，而是长时间保持显示，之后再统一判定。考验玩家的**记忆与站位保持**。

与一阶段「钢铁 / 月环」最大的区别是:**动画被注释掉了，判定被挪走了**。

`delay_memory_forget_far/tick.mcfunction` 里原本的动画与判定全部被注释：

```mcfunction
# 移除动画控制
# execute as @e[tag=memory_forget_far.armor_stand] at @s if score #user memory_forget_far matches 20 run function .../image_orange
...
# 红色部分稍后判定
# execute as @e[tag=memory_forget_far.armor_stand] at @s if score #user memory_forget_far matches 120 run function .../memory_forget_far/image_red
# 伤害稍后判定
# execute if score #user memory_forget_far matches 120 run function .../memory_forget_far/check
execute if score #user delay_memory_forget_far matches 120 run function tide_redemption:boss_extra/skill/delay_memory_forget_far/end
```

也就是说它**只借用 120 tick 的读条时长来「占位」**，真正的红圈与伤害在**主时间轴的指定 tick** 上单独触发（见 `boss_extra/tick.mcfunction`）：

```mcfunction
execute as @e[tag=delay_memory_forget_far.armor_stand] at @s if score #user tidedcore_fight matches 940 run function .../delay_memory_forget_far/image_orange
execute if score #user tidedcore_fight matches 960 run function .../delay_memory_forget_far/check
```

**关键点**：延迟技能的 `armor_stand` 会**一直留到场**（不像一阶段在 `end` 里清理），直到主时间轴在 960 tick 调用 `check` 时才判定并 `kill`：

```mcfunction
# 判定动画
execute as @e[tag=delay_memory_forget_far.armor_stand] at @s run function .../delay_memory_forget_far/image_red
# 半径4格内安全
execute as @e[tag=delay_memory_forget_far.armor_stand] at @s if entity @a[distance=4.1..12] run effect give @a[distance=4.1..12] instant_damage 1 1
# 删除标记
kill @e[tag=delay_memory_forget_far.armor_stand]
```

判定条件与一阶段**完全一致**（远 = `distance=4.1..12` 环带），只是**发生时机被推迟**——从初始化的 940 tick 到判定 960 tick，相隔约 47 秒，玩家必须**记住圈的位置并保持站位**。

### 19. 快速咏唱（fast_memory_forget_far / near）

**机制**：与「延迟」相反——读条被压缩到 **80 tick**，且**动画与判定同步压缩**。

`fast_memory_forget_far/tick.mcfunction`：

```mcfunction
# 动画控制
execute as @e[tag=fast_memory_forget_far.armor_stand] at @s if score #user fast_memory_forget_far matches 20 run function .../image_orange
execute as @e[tag=fast_memory_forget_far.armor_stand] at @s if score #user fast_memory_forget_far matches 40 run function .../image_orange
execute as @e[tag=fast_memory_forget_far.armor_stand] at @s if score #user fast_memory_forget_far matches 60 run function .../image_orange
execute as @e[tag=fast_memory_forget_far.armor_stand] at @s if score #user fast_memory_forget_far matches 80 run function .../image_red

# 伤害判定
execute if score #user fast_memory_forget_far matches 80 run function .../fast_memory_forget_far/check
execute if score #user fast_memory_forget_far matches 81 run function .../fast_memory_forget_far/end
```

**唯一的区别就是读条长度**：`bossbar max 80`（一阶段为 120），橙圈刷新点从 `20/40/60/80/100` 压缩为 `20/40/60`，红圈与判定提前到 80。判定半径不变：

| 技能 | 读条 | 橙圈刷新 | 红圈/判定 |
| --- | --- | --- | --- |
| 一阶段 钢铁/月环 | 120 | 20/40/60/80/100 | 120 |
| `fast_` 快速版 | **80** | 20/40/60 | **80** |
| `delay_` 延迟版 | 120（仅占位） | 主时间轴另行触发 | 主时间轴另行触发 |

> 这两个技能与 `memory_shadow` 配合形成「**先读条 → 后判定**」的欺骗性机制：玩家看到圈消失了（`end` 被调用），但伤害判定其实被排到了几十秒之后。

### 20. 加强踩塔（memory_torrent_songplus）

**机制**：一阶段踩塔是 **4 座塔**（A~D），加强版扩到 **8 座塔**（A~H）。

`init.mcfunction` 里注册了 8 个计分板：

```mcfunction
scoreboard objectives add memory_torrent_song_tower_A trigger
...
scoreboard objectives add memory_torrent_song_tower_H trigger
```

**塔位由 4 次独立随机决定**，每次随机在「正点组(3/4/1/2)」与「斜点组(7/8/5/6)」之间二选一：

```mcfunction
function tide_redemption:boss_extra/boss_random_2
execute if score #user tidedcore_random matches 1 run function .../tower/spawn_tower_3
execute if score #user tidedcore_random matches 2 run function .../tower/spawn_tower_7

function tide_redemption:boss_extra/boss_random_2
execute if score #user tidedcore_random matches 1 run function .../tower/spawn_tower_4
execute if score #user tidedcore_random matches 2 run function .../tower/spawn_tower_8
... (共 4 轮)
```

> 这是**复用同一套箱子随机方案的典型例子**：`boss_random_2` 与一阶段的 `boss_random` 内容一致，连续调用 4 次即得到 4 个独立 50/50 结果，组合出 2⁴ = **16 种塔位布局**。

**判定逻辑与一阶段同构，只是扩展到 8 座**——每塔内有人给低伤害，任一塔为空则全场致死：

```mcfunction
execute store result score #player_number memory_torrent_song_tower_A run execute as @e[tag=torrent_song_A] at @s if entity @a[distance=..2]
...
# 如果其中一塔内无人则全员受到致死级伤害
execute as @e[tag=torrent_song_A] at @s unless score #player_number memory_torrent_song_tower_A matches 1.. run effect give @a[distance=..30] minecraft:instant_damage 1 5
```

踩塔特效含**旋转与音符下落**（`tick.mcfunction`）：

```mcfunction
# 让盔甲架自行执行旋转并生成塔的粒子效果
execute as @e[tag=torrent_song_tower] at @s run tp @s ~ ~ ~ ~10 ~
function tide_redemption:boss/skill/memory_torrent_song/color

# 音符需要每一格走0.05高度
execute as @e[tag=torrent_song_note] at @s run tp @s ~ ~-0.05 ~
execute as @e[tag=torrent_song_note] at @s positioned ^ ^0.0625 ^ run function tide_redemption:boss/lib/dust/dust_note
```

`tp @s ~ ~ ~ ~10 ~` 每 tick 转 10°，实现塔的旋转视觉；音符锚点每 tick 下降 0.05 格，模拟音符飘落。

### 21. 记忆幻影（memory_shadow）——二阶段的「三运」

这是全项目**最复杂的技能**，包含 4 个子模块，由 `memory_shadow_timeline` 统一调度：

```mcfunction
function tide_redemption:boss_extra/skill/memory_shadow/phantom/tick
function tide_redemption:boss_extra/skill/memory_shadow/copy/tick
function tide_redemption:boss_extra/skill/memory_shadow/paste/tick
function tide_redemption:boss_extra/skill/memory_shadow/realize/tick
```

主时间轴（各阶段时间点）：

| tick | 事件 | 子模块 |
| --- | --- | --- |
| 1 | 「记忆投影」开始 | `phantom` |
| 450 | 储存钢铁/月环 | `delay_memory_forget_*` |
| 600 | 「记忆复制」开始 | `copy` |
| 1090 / 1110 | 延迟钢铁月环 红圈 / 判定 | — |
| 1130 | 「记忆粘贴」判定开始 | `paste` |
| 1600 | 「时空重现」开始 | `realize` |
| 1950 | 三运结束 | `end` |

#### 21.1 phantom（记忆投影）

**玩法**：BOSS 在场地上**依次展示 4 个「幻影」的位置**，玩家需要记住它们。

```mcfunction
execute if score #user memory_shadow_phantom matches 50 run summon armor_stand 0 60 -8 {Tags:[memory_shadow_dust],Invisible:true,NoGravity:true}
execute if score #user memory_shadow_phantom matches 50 run summon armor_stand 0 60 8 {Tags:[memory_shadow_dust],Invisible:true,NoGravity:true}
execute if score #user memory_shadow_phantom matches 110 run kill @e[tag=memory_shadow_dust]
execute if score #user memory_shadow_phantom matches 110 run summon armor_stand 0 60 -8 {Tags:[memory_shadow_a,memory_shadow_armor],Invisible:false,NoGravity:true,Invulnerable:true,ArmorItems:[...player_head,components:{profile:SpringAurora}}],Rotation:[0f]}
execute if score #user memory_shadow_phantom matches 110 run summon armor_stand 0 60 8 {Tags:[memory_shadow_b,memory_shadow_armor],Invisible:false,...,components:{profile:CastorVow}}],Rotation:[180f]}
```

节奏是：**50 tick 生成青色粒子标记 → 110 tick 标记变成实体幻影**，之后 150/210 tick 在另一轴重复，共 4 个幻影（`memory_shadow_a` ~ `d`），分别使用 4 位玩家的头颅皮肤（`SpringAurora` / `CastorVow` / `Starry_Mika` / `Yuan_Ye`）。

幻影本体是**可见的盔甲架**（`Invisible:false` + `Invulnerable:true`），用 `Rotation` 控制朝向。

**300 tick 时把 4 个角色标签分配给玩家**，且**层层排除已分配者**：

```mcfunction
execute unless entity @a[tag=memory_shadow_a] if score #user memory_shadow_phantom matches 300 run tag @r[x=-11,y=60,z=-11,dx=22,dy=7,dz=22] add memory_shadow_a
execute unless entity @a[tag=memory_shadow_b] if score #user memory_shadow_phantom matches 300 run tag @r[tag=!memory_shadow_a,x=-11,y=60,z=-11,dx=22,dy=7,dz=22] add memory_shadow_b
```

> 注意 `unless entity @a[tag=memory_shadow_a]` 这个前置判断——**只有当该角色还没被分配时**才随机选人。这样允许多个玩家共同完成（而非强制 4 人），同时保证不重复。被注释掉的 `name=SpringAurora` 版本说明作者曾考虑**固定玩家对应固定幻影**。

#### 21.2 copy（记忆复制）

**玩法**：记录玩家在 4 个时间窗内**站在哪个幻影旁**。

`copy/tick.mcfunction` 在 50/100/150/200/250 tick 用 `boss_random_2` 决定每个幻影**出现「分散(cut)」还是「分摊(module)」**，310~450 tick 播放动画。

**460 tick 调用 `check`，把幻影与玩家配对**：

```mcfunction
execute as @e[tag=memory_shadow_cut_1,tag=memory_shadow_time_1] at @s run tag @a[sort=nearest,limit=1] add memory_shadow_time_1
execute as @e[tag=memory_shadow_cut_1,tag=memory_shadow_time_1] at @s run tag @a[sort=nearest,limit=1] add memory_shadow_cut_1
```

拆解：`@e[tag=memory_shadow_cut_1,tag=memory_shadow_time_1]` 是**同时带两个标签**的幻影（即「第 1 时段且被判定为分散」的那个），然后给**距它最近的一名玩家**（`@a[sort=nearest,limit=1]`）打上对应标签。

共 8 组配对（4 时段 × cut/module），把「谁该站在哪」记录成玩家标签。

#### 21.3 paste（记忆粘贴）

**玩法**：幻影消失后，**在玩家身上重现**之前记录的分摊/分散圈，要求玩家按记忆站位。

`paste/tick.mcfunction` 按 100 tick 一个周期分 4 回（tick 100/200/300/400 判定），每次同时处理两种标记：

```mcfunction
# 分散组：圈在自己身上
execute as @a[tag=memory_shadow_time_1,tag=memory_shadow_cut_1] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_paste matches 100 if entity @a[distance=..15] run effect give @a[distance=..15] instant_damage 1 1
# 分摊组：圈在队友身上
execute as @a[tag=memory_shadow_time_1,tag=memory_shadow_module_1] at @s if score #user memory_shadow_paste matches 100 run function .../paste/check_module
```

`check_module` 复用一阶段分摊的判定骨架：

```mcfunction
execute store result score #player_number memory_shadow_module run execute if entity @a[distance=..2]
execute if score #player_number memory_shadow_module matches 2.. run effect give @a[distance=..3] minecraft:instant_damage 1 0
execute unless score #player_number memory_shadow_module matches 2.. run effect give @a[distance=..3] minecraft:instant_damage 1 5
scoreboard objectives remove memory_shadow_module
```

> 这里有个**性能优化细节**：`memory_shadow_module` 计分板是**临时创建、用完立即 `remove`** 的，而 `memory_cut_module_A/B` 是在 `init` 里建、`end` 里删的。因为 `paste` 在 400 tick 内要执行 4 次判定，每次都重建同名计分板，避免多次 `add` 报错。

另外，分散组用的是 **`distance=..15`** 这个很大的半径——因为圈挂在**玩家自己身上**，判定的是「有没有别人靠近你」。

#### 21.4 realize（时空重现）

**玩法**：最终判定。把之前所有记录**一次性重演**，玩家必须站在正确位置。

`realize/tick.mcfunction` 在 1 和 60 tick 生成 4 个幻影锚点（坐标 `937 147 2023` 等），然后**把 copy 阶段记录的玩家标签转移给幻影**：

```mcfunction
execute as @e[tag=memory_shadow_a,tag=memory_shadow_armor] at @s if entity @a[tag=memory_shadow_a,tag=memory_shadow_cut_1] if score #user memory_shadow_realize matches 5 run tag @s add memory_shadow_cut
execute as @e[tag=memory_shadow_a,tag=memory_shadow_armor] at @s if entity @a[tag=memory_shadow_a,tag=memory_shadow_module_1] if score #user memory_shadow_realize matches 5 run tag @s add memory_shadow_module
```

逻辑是：**如果「被分到 a 号幻影的玩家」身上有 `cut_1` 标签，那么 a 号幻影就继承 `memory_shadow_cut` 标签**。这样幻影就"知道"自己该演分散还是分摊。

随后按 100 tick 分两批判定（a/b 在 200 tick，c/d 在 300 tick）：

```mcfunction
execute as @e[tag=memory_shadow_a,tag=memory_shadow_armor,tag=memory_shadow_cut] at @s if entity @a[distance=..15] if score #user memory_shadow_realize matches 200 run effect give @a[distance=..15] minecraft:instant_damage 1 2
```

`200 tick` 时 `check_module` 做分摊判定，`300 tick` 时调用 `end` 收尾。

**realize 的 BOSS Bar 是动态的**——`max` 设为 120，但用独立函数每 tick 同步，并在 121 tick 主动移除：

```mcfunction
execute if score #user memory_shadow_realize matches 1..120 run function .../realize/bossbar
execute if score #user memory_shadow_realize matches 121 run bossbar remove memory_shadow_realize
```

> 注意 `realize` 的 BOSS Bar `max` 只有 120，但该模块实际运行到 300 tick——**进度条会先走满再消失**，作为「时限提示」。

### 22. 二阶段的时间轴与难度差异

`boss_extra/tick.mcfunction` 约 252 行、7100 tick。与一阶段的主要差异：

| 项目 | 一阶段 `boss/` | 二阶段 `boss_extra/` |
| --- | --- | --- |
| 总时长 | 5580 tick | **7100 tick** |
| BOSS 生成 | tick 359 | tick **224** |
| 开场血量增长 | `+3`/tick，1~359 | `+5`/tick，1~224 |
| 存活检测区域 | `dx=22,dz=22` | **`dx=25,dz=25`**（场地略大） |
| BOSS 待机位置 | 地面 `0 60 0` | 前期**空中 `0 73 0`** + `glowing` |
| 踩塔 | 4 塔 | **8 塔**（songplus） |
| 钢铁/月环 | 120 tick | 120 + **80(fast)** + 延迟版 |
| 大地图机制 | 无 | **`memory_shadow` 三运** |
| 触发方式 | 命令方块按钮 | **NPC 对话** |

BOSS 前期被 `tp` 到空中并附上发光效果：

```mcfunction
execute if score #user tidedcore_fight matches 224..459 run tp @e[tag=tidedcore] 0 73 0
execute if score #user tidedcore_fight matches 460 run tp @e[tag=tidedcore] 0 60 0
execute if score #user tidedcore_fight matches 224..460 run effect give @e[tag=tidedcore] glowing 1
```

**这是为了配合开场演出**：BOSS 悬浮在空中（tick 224~459），同时地面用橙色圈逐级扩大到 9 格（`lib/circle/orange/4.5` → `9.0`），到 460 tick 落地并结算一次全屏 AOE：

```mcfunction
#伤害判定、九格外安全
execute as @e[tag=memory_forget_near.armor_stand] at @s if entity @a[distance=..9] if score #user tidedcore_fight matches 460 run effect give @a[distance=..9] instant_damage 1 5
execute if score #user tidedcore_fight matches 460 run kill @e[tag=memory_forget_near.armor_stand]
```

### 23. 二阶段的收尾清理

`boss_fight_end.mcfunction` 除了清理主计分板，还必须**逐个调用新增技能的 `end`**——因为一阶段的 `boss_fight_end` 不认识它们：

```mcfunction
function tide_redemption:boss_extra/skill/delay_memory_forget_far/end
function tide_redemption:boss_extra/skill/delay_memory_forget_near/end
function tide_redemption:boss_extra/skill/fast_memory_forget_far/end
function tide_redemption:boss_extra/skill/fast_memory_forget_near/end
function tide_redemption:boss_extra/skill/memory_torrent_songplus/end
function tide_redemption:boss_extra/skill/memory_shadow/end

# 延迟咏唱假人移除
kill @e[tag=delay_memory_forget_near.armor_stand]
kill @e[tag=delay_memory_forget_far.armor_stand]
```

最后两行是**必要的兜底**：延迟技能的盔甲架是长期驻留的，若战斗在判定前提前结束（例如玩家全灭），`check` 永远不会被调用，锚点就会残留——所以必须在收尾时强制 `kill`。

> 这体现了一个通用原则：**凡是「生命周期跨越多个阶段」的实体，都不能只依赖自己模块的 `end` 清理，必须在主流程的收尾函数里兜底。**

---

## 已知限制与扩展建议

**当前限制**

- 判定区域硬编码在 `x=-11,y=60,z=-11`，一阶段用 `dx=22,dz=22`、二阶段用 `dx=25,dz=25`，换场地需分别替换
- 技能读条长度、血量轴全部为写死的 tick 数值，调整节奏需逐个修改
- 依赖 4 人以上配合，人数不足时部分机制无法完成（`memory_shadow` 已用 `unless entity` 做了降级适配）
- `lib/circle/` 粒子库体积较大（**一阶段与二阶段各存一份副本，合计约 4 MB 源代码**），首次加载有轻微开销
- 二阶段大量复用一阶段技能模块，两者修改时需注意**同步**（例如伤害等级、判定半径）

**扩展方向**

1. **抽出配置层**：把判定区域、读条长度、伤害等级集中为一组计分板常量，减少硬编码
2. **取消 `lib` 重复副本**：二阶段的 `boss_extra/lib/circle/` 与一阶段内容一致，可直接复用 `boss/lib/circle/`，省下一半体积
3. **增加更多技能**：按 `init/tick/check/end` 四段式新写目录，并在对应 `tick.mcfunction` 注册即可——架构本身已为扩展做好准备
4. **多难度模式**：用计分板切换「普通 / 零式 / 绝」，对应不同的读条长度与伤害等级
5. **多人角色分工**：当前已用 `@r` 与标签分配角色，可扩展到 FF14 式的 T/N/DPS 分工

---

## 许可与致谢

### 第三方资源

**粒子圆环库：[`KunoSayo/BattleLibrary`](https://github.com/KunoSayo/BattleLibrary)**

本项目的 `lib/circle/` 圆形粒子特效取自 BattleLibrary，特此致谢。

- **作者**：KunoSayo
- **仓库**：<https://github.com/KunoSayo/BattleLibrary>
- **许可**：Apache License 2.0
- **来源文件**：`battlelib/data/battle/functions/circle/{半径}.mcfunction`

BattleLibrary 是一个战斗地图用的基础前置库，提供计分板、回调与几何图形打表等功能。其 `circle/{rad}` 函数在指定半径的圆周上采样并逐点回调，主要用于绘制 AOE 预警圈等特效。

本项目保留了该库生成的坐标数据，仅将回调目标由 `battleapi:circle_cb` 替换为本项目的粒子函数：

```mcfunction
# BattleLibrary 原版
execute positioned ~0.17365 ~ ~0.98481 facing ~-0.17365 ~ ~-0.98481 run function battleapi:circle_cb

# 本项目（同一份坐标，仅替换回调）
execute positioned ~0.17365 ~ ~0.98481 facing ~-0.17365 ~ ~-0.98481 run function tide_redemption:boss/lib/dust/dust_red
```

涉及文件：`lib/circle/red/`、`lib/circle/orange/`、`lib/circle/aqua/`，以及 `boss_extra/lib/circle/` 下的对应副本。

> 使用或再分发时请遵守 Apache-2.0 许可条款，并保留原作者署名。

### 其他

- 技能设计参考《最终幻想 XIV》高难副本机制，为 Minecraft 平台上的二次创作
- 使用纯数据包实现，无第三方 Mod 依赖