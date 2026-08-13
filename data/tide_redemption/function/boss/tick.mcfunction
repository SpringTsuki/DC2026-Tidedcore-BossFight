# 若BOSS EXTRA正在执行此函数，则不执行此判断函数
execute if score #user bossfight_extra_tidedcore matches 1 run return 0

function tide_redemption:boss/skill/boss_spawn/tick
function tide_redemption:boss/skill/memory_cut_module/tick
function tide_redemption:boss/skill/memory_cut_shard/tick
function tide_redemption:boss/skill/memory_torrent_dataline/tick
function tide_redemption:boss/skill/memory_torrent_song/tick
function tide_redemption:boss/skill/memory_torrent_bleeding/tick
function tide_redemption:boss/skill/memory_forget_far/tick
function tide_redemption:boss/skill/memory_forget_near/tick
function tide_redemption:boss/skill/memory_forever_frozen/tick
function tide_redemption:boss/skill/memory_forever_delete/tick

#调试模式
# scoreboard objectives setdisplay sidebar tidedcore_fight
# scoreboard players add SpringAurora tidedcore_fight 1

# 检测玩家是否存活
execute if score #user tidedcore_fight matches 1..5580 run function tide_redemption:boss/boss_check_player

# 时间轴
scoreboard players add #user tidedcore_fight 1

# 随机数
scoreboard players set #user tidedcore_random 0

# BOSS血量增长恢复
execute if score #user tidedcore_fight matches 1..359 run scoreboard players add #tidedcore tidedcore_hp 3
execute if score #user tidedcore_fight matches 1..359 run execute store result bossbar minecraft:boss_tidedcore value run scoreboard players get #tidedcore tidedcore_hp

# 天气更改
execute if score #user tidedcore_fight matches 180 run weather thunder

# 更改BOSS BAR的样式
execute if score #user tidedcore_fight matches 360 run bossbar set minecraft:boss_tidedcore color red

# 同步BOSS血量
execute if score #user tidedcore_fight matches 360.. run execute as @e[tag=tidedcore] at @s store result score #tidedcore tidedcore_hp run data get entity @s Health
execute if score #user tidedcore_fight matches 360.. run execute store result bossbar minecraft:boss_tidedcore value run scoreboard players get #tidedcore tidedcore_hp
execute if score #user tidedcore_fight matches 360.. unless entity @e[tag=tidedcore] run scoreboard players set #tidedcore tidedcore_hp 0

# 检测BOSS血量，若BOSS血量归零则BOSS战成功
execute if score #tidedcore tidedcore_hp matches 0 run function tide_redemption:boss/boss_success

# 锁血机制
execute if score #tidedcore tidedcore_minhp matches 1 if score #tidedcore tidedcore_hp matches ..100 run data modify entity @e[tag=tidedcore,limit=1,type=zombie] Health set value 100

# 锁血台词
execute if score #user tidedcore_fight matches 361..5060 if score #tidedcore tidedcore_hp matches ..100 run scoreboard objectives add tidedcore_check_hp_defend trigger
scoreboard players add #user tidedcore_check_hp_defend 1

execute if score #user tidedcore_check_hp_defend matches 20 run tellraw @a {"translate":"game.boss_fight.defend1"}
execute if score #user tidedcore_check_hp_defend matches 60 run tellraw @a {"translate":"game.boss_fight.defend2"}
execute if score #user tidedcore_check_hp_defend matches 100 run tellraw @a {"translate":"game.boss_fight.defend3"}
execute if score #user tidedcore_fight matches 5100 if score #user tidedcore_check_hp_defend matches 1.. run tellraw @a {"translate":"game.boss_fight.defend_defuse"}

# 狂暴时声援台词（触发条件，狂暴读条3s内血量小于100即可触发）
execute if score #user tidedcore_fight matches 5120 if score #tidedcore tidedcore_hp matches ..100 run scoreboard objectives add tidedcore_check_hp_delete trigger
scoreboard players add #user tidedcore_check_hp_delete 1
execute if score #user tidedcore_check_hp_delete matches 20 run tellraw @a {"translate":"game.boss_fight.cheer1"}
execute if score #user tidedcore_check_hp_delete matches 50 run tellraw @a {"translate":"game.boss_fight.cheer2"}
execute if score #user tidedcore_check_hp_delete matches 80 run tellraw @a {"translate":"game.boss_fight.cheer3"}
execute if score #user tidedcore_check_hp_delete matches 110 run tellraw @a {"translate":"game.boss_fight.cheer4"}
execute if score #user tidedcore_check_hp_delete matches 140 run tellraw @a {"translate":"game.boss_fight.cheer5"}
execute if score #user tidedcore_check_hp_delete matches 170 run tellraw @a {"translate":"game.boss_fight.cheer6"}
execute if score #user tidedcore_check_hp_delete matches 200 run tellraw @a {"translate":"game.boss_fight.cheer7"}
execute if score #user tidedcore_check_hp_delete matches 230 run tellraw @a {"translate":"game.boss_fight.cheer8"}
execute if score #user tidedcore_check_hp_delete matches 260 run tellraw @a {"translate":"game.boss_fight.cheer9"}
execute if score #user tidedcore_check_hp_delete matches 290 run tellraw @a {"translate":"game.boss_fight.cheer10"}
execute if score #user tidedcore_check_hp_delete matches 320 run tellraw @a {"translate":"game.boss_fight.cheer11"}

# 生成BOSS
execute if score #user tidedcore_fight matches 359 run summon minecraft:zombie 0 60 0 {Tags:[tidedcore],Health:1024f,attributes:[{id:"minecraft:generic.max_health",base:1024f}],ArmorDropChances:[0f,0f,0f,0f],ArmorItems:[{id:"minecraft:netherite_boots"},{id:"minecraft:netherite_leggings"},{id:"minecraft:netherite_chestplate"},{id:"minecraft:netherite_helmet"}],CustomName:'{"translate":"game.boss_fight"}',DeathLootTable:"tide_redemption:boss/boss_drop"}

# 召唤雷电
execute if score #user tidedcore_fight matches 360 run execute as @e[tag=tidedcore] at @s run summon minecraft:lightning_bolt ~ ~ ~

# 第一次地火
execute if score #user tidedcore_fight matches 640 run function tide_redemption:boss/skill/memory_torrent_dataline/init

# 第一次分摊
execute if score #user tidedcore_fight matches 1230 run function tide_redemption:boss/skill/memory_cut_module/init

# 第一次踩塔
execute if score #user tidedcore_fight matches 1540 run function tide_redemption:boss/skill/memory_torrent_song/init

# 第一次分散
execute if score #user tidedcore_fight matches 1820 run function tide_redemption:boss/skill/memory_cut_shard/init

# 第一次挡枪
execute if score #user tidedcore_fight matches 2000 run function tide_redemption:boss/skill/memory_torrent_bleeding/init
execute if score #user tidedcore_fight matches 2085 run function tide_redemption:boss/skill/memory_torrent_bleeding/init
execute if score #user tidedcore_fight matches 2170 run function tide_redemption:boss/skill/memory_torrent_bleeding/init
execute if score #user tidedcore_fight matches 2255 run function tide_redemption:boss/skill/memory_torrent_bleeding/init
execute if score #user tidedcore_fight matches 2340 run function tide_redemption:boss/skill/memory_torrent_bleeding/remove_tag

# 永恒冻结 进入P2
execute if score #user tidedcore_fight matches 2400 run function tide_redemption:boss/skill/memory_forever_frozen/init
execute if score #user tidedcore_fight matches 2450 run tellraw @a {"translate":"game.boss_fight.frozen1"}
execute if score #user tidedcore_fight matches 2540 run tellraw @a {"translate":"game.boss_fight.frozen2"}
execute if score #user tidedcore_fight matches 2580 run tellraw @a {"translate":"game.boss_fight.frozen3"}

# 第一次 钢铁+月环 / 月环+钢铁
execute if score #user tidedcore_fight matches 2830 run function tide_redemption:boss/boss_random
execute if score #user tidedcore_fight matches 2830 if score #user tidedcore_random matches 1 run function tide_redemption:boss/skill/memory_forget_near/init
execute if score #user tidedcore_fight matches 2830 if score #user tidedcore_random matches 1 run schedule function tide_redemption:boss/skill/memory_forget_far/init 120t
execute if score #user tidedcore_fight matches 2830 if score #user tidedcore_random matches 2 run function tide_redemption:boss/skill/memory_forget_far/init
execute if score #user tidedcore_fight matches 2830 if score #user tidedcore_random matches 2 run schedule function tide_redemption:boss/skill/memory_forget_near/init 120t

# 第二次地火
execute if score #user tidedcore_fight matches 3260 run function tide_redemption:boss/skill/memory_torrent_dataline/init

# 第二次分散或分摊
execute if score #user tidedcore_fight matches 3520 run function tide_redemption:boss/boss_random
execute if score #user tidedcore_fight matches 3520 if score #user tidedcore_random matches 1 run function tide_redemption:boss/skill/memory_cut_shard/init
execute if score #user tidedcore_fight matches 3520 if score #user tidedcore_random matches 2 run function tide_redemption:boss/skill/memory_cut_module/init

# 第二次踩塔 + 钢铁月环组合技
execute if score #user tidedcore_fight matches 3820 run function tide_redemption:boss/skill/memory_torrent_song/init

# 第二次 钢铁/月环
execute if score #user tidedcore_fight matches 3940 run function tide_redemption:boss/boss_random
execute if score #user tidedcore_fight matches 3940 if score #user tidedcore_random matches 1 run function tide_redemption:boss/skill/memory_forget_far/init
execute if score #user tidedcore_fight matches 3940 if score #user tidedcore_random matches 2 run function tide_redemption:boss/skill/memory_forget_near/init

# 第二次 钢铁/月环 分散/分摊
execute if score #user tidedcore_fight matches 4270 run function tide_redemption:boss/boss_random
execute if score #user tidedcore_fight matches 4270 if score #user tidedcore_random matches 1 run function tide_redemption:boss/skill/memory_forget_far/init
execute if score #user tidedcore_fight matches 4270 if score #user tidedcore_random matches 2 run function tide_redemption:boss/skill/memory_forget_near/init

execute if score #user tidedcore_fight matches 4250 run function tide_redemption:boss/boss_random
execute if score #user tidedcore_fight matches 4250 if score #user tidedcore_random matches 1 run function tide_redemption:boss/skill/memory_cut_module/init
execute if score #user tidedcore_fight matches 4250 if score #user tidedcore_random matches 2 run function tide_redemption:boss/skill/memory_cut_shard/init

# 第三次地火 + 分散后分摊 或 分摊后分散
execute if score #user tidedcore_fight matches 4500 run function tide_redemption:boss/skill/memory_torrent_dataline/init

# 分散/分摊
execute if score #user tidedcore_fight matches 4500 run function tide_redemption:boss/boss_random
execute if score #user tidedcore_fight matches 4500 if score #user tidedcore_random matches 1 run function tide_redemption:boss/skill/memory_cut_module/init
execute if score #user tidedcore_fight matches 4500 if score #user tidedcore_random matches 1 run schedule function tide_redemption:boss/skill/memory_cut_shard/init 240t
execute if score #user tidedcore_fight matches 4500 if score #user tidedcore_random matches 2 run function tide_redemption:boss/skill/memory_cut_shard/init
execute if score #user tidedcore_fight matches 4500 if score #user tidedcore_random matches 2 run schedule function tide_redemption:boss/skill/memory_cut_module/init 240t

# 固定地火内钢铁/月环 或 月环/钢铁
execute if score #user tidedcore_fight matches 4520 run function tide_redemption:boss/boss_random
execute if score #user tidedcore_fight matches 4520 if score #user tidedcore_random matches 1 run function tide_redemption:boss/skill/memory_forget_near/init
execute if score #user tidedcore_fight matches 4520 if score #user tidedcore_random matches 1 run schedule function tide_redemption:boss/skill/memory_forget_far/init 120t
execute if score #user tidedcore_fight matches 4520 if score #user tidedcore_random matches 2 run function tide_redemption:boss/skill/memory_forget_far/init
execute if score #user tidedcore_fight matches 4520 if score #user tidedcore_random matches 2 run schedule function tide_redemption:boss/skill/memory_forget_near/init 120t

# 最后一次踩塔
execute if score #user tidedcore_fight matches 4890 run function tide_redemption:boss/skill/memory_torrent_song/init

# 狂暴
execute if score #user tidedcore_fight matches 5060 run function tide_redemption:boss/skill/memory_forever_delete/init
execute if score #user tidedcore_fight matches 5570 run function tide_redemption:boss/boss_end

# 以下为对话部分
execute if score #user tidedcore_fight matches 40 run tellraw @a {"translate":"game.boss_fight.1"}
execute if score #user tidedcore_fight matches 78 run tellraw @a {"translate":"game.boss_fight.2"}
execute if score #user tidedcore_fight matches 116 run tellraw @a {"translate":"game.boss_fight.3"}
execute if score #user tidedcore_fight matches 154 run tellraw @a {"translate":"game.boss_fight.4"}
execute if score #user tidedcore_fight matches 192 run tellraw @a {"translate":"game.boss_fight.5"}
execute if score #user tidedcore_fight matches 230 run tellraw @a {"translate":"game.boss_fight.6"}
execute if score #user tidedcore_fight matches 258 run tellraw @a {"translate":"game.boss_fight.7"}

execute if score #user tidedcore_fight matches 5000 run tellraw @a {"translate":"game.boss_fight.delete1"}
execute if score #user tidedcore_fight matches 5030 run tellraw @a {"translate":"game.boss_fight.delete2"}