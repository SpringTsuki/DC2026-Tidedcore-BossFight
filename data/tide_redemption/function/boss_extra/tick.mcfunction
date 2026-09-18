# 若BOSS正在执行此函数，则不执行此判断函数
execute if score #user bossfight_tidedcore matches 1 run return 0

function tide_redemption:boss_extra/skill/boss_spawn/tick

# 引用源BOSS技能组Tick
function tide_redemption:boss/skill/memory_cut_module/tick
function tide_redemption:boss/skill/memory_cut_shard/tick
function tide_redemption:boss/skill/memory_torrent_dataline/tick
# function tide_redemption:boss/skill/memory_torrent_song/tick
function tide_redemption:boss/skill/memory_torrent_bleeding/tick
function tide_redemption:boss/skill/memory_forget_far/tick
function tide_redemption:boss/skill/memory_forget_near/tick
function tide_redemption:boss/skill/memory_forever_frozen/tick
function tide_redemption:boss/skill/memory_forever_delete/tick

# 新技能Tick
function tide_redemption:boss_extra/skill/delay_memory_forget_far/tick
function tide_redemption:boss_extra/skill/delay_memory_forget_near/tick
function tide_redemption:boss_extra/skill/memory_torrent_songplus/tick
function tide_redemption:boss_extra/skill/fast_memory_forget_far/tick
function tide_redemption:boss_extra/skill/fast_memory_forget_near/tick
function tide_redemption:boss_extra/skill/memory_shadow/tick

# 调试模式
# scoreboard objectives setdisplay sidebar tidedcore_fight
# scoreboard players add SpringAurora tidedcore_fight 1

# 检测玩家是否存活
execute if score #user tidedcore_fight matches 1..7080 run function tide_redemption:boss_extra/boss_check_player

# 时间轴
scoreboard players add #user tidedcore_fight 1

# 随机数重置
scoreboard players set #user tidedcore_random 0

# BOSS血量增长恢复
execute if score #user tidedcore_fight matches 1..224 run scoreboard players add #tidedcore tidedcore_hp 5
execute if score #user tidedcore_fight matches 1..224 run execute store result bossbar minecraft:boss_tidedcore value run scoreboard players get #tidedcore tidedcore_hp

# 天气更改
execute if score #user tidedcore_fight matches 60 run weather thunder

# 更改BOSS BAR的样式
execute if score #user tidedcore_fight matches 224 run bossbar set minecraft:boss_tidedcore color red

# 同步BOSS血量
execute if score #user tidedcore_fight matches 360.. run execute as @e[tag=tidedcore] at @s store result score #tidedcore tidedcore_hp run data get entity @s Health
execute if score #user tidedcore_fight matches 360.. run execute store result bossbar minecraft:boss_tidedcore value run scoreboard players get #tidedcore tidedcore_hp
execute if score #user tidedcore_fight matches 360.. unless entity @e[tag=tidedcore] run scoreboard players set #tidedcore tidedcore_hp 0

# 检测BOSS血量，若BOSS血量归零则BOSS战成功
execute if score #tidedcore tidedcore_hp matches 0 run function tide_redemption:boss_extra/boss_fight_success

# 生成BOSS
execute if score #user tidedcore_fight matches 224 run summon minecraft:zombie 0 60 0 {Tags:[tidedcore],Health:1024f,attributes:[{id:"minecraft:generic.max_health",base:1024f}],ArmorDropChances:[0f,0f,0f,0f],ArmorItems:[{id:"minecraft:netherite_boots"},{id:"minecraft:netherite_leggings"},{id:"minecraft:netherite_chestplate"},{id:"minecraft:netherite_helmet"}],CustomName:'{"translate":"game.boss_fight_extra"}',DeathLootTable:"tide_redemption:boss/boss_drop"}

# 召唤雷电
execute if score #user tidedcore_fight matches 224 run execute as @e[tag=tidedcore] at @s run summon minecraft:lightning_bolt ~ ~ ~
execute if score #user tidedcore_fight matches 460 run execute as @e[tag=tidedcore] at @s run summon minecraft:lightning_bolt ~ ~ ~

# TP BOSS
execute if score #user tidedcore_fight matches 224..459 run tp @e[tag=tidedcore] 0 73 0
execute if score #user tidedcore_fight matches 460 run tp @e[tag=tidedcore] 0 60 0
execute if score #user tidedcore_fight matches 224..460 run effect give @e[tag=tidedcore] glowing 1

# 生成特效命令方块
execute if score #user tidedcore_fight matches 1 run setblock 0 60 0 minecraft:command_block

# 移除特效命令方块
execute if score #user tidedcore_fight matches 224 run setblock 0 60 0 minecraft:air

# 台词
execute if score #user tidedcore_fight matches 50 run tellraw @a {"translate":"game.boss_fight_extra.1"}
execute if score #user tidedcore_fight matches 100 run tellraw @a {"translate":"game.boss_fight_extra.2"}
execute if score #user tidedcore_fight matches 150 run tellraw @a {"translate":"game.boss_fight_extra.3"}
execute if score #user tidedcore_fight matches 200 run tellraw @a {"translate":"game.boss_fight_extra.4"}
execute if score #user tidedcore_fight matches 250 run tellraw @a {"translate":"game.boss_fight_extra.5"}
execute if score #user tidedcore_fight matches 300 run tellraw @a {"translate":"game.boss_fight_extra.6"}
execute if score #user tidedcore_fight matches 350 run tellraw @a {"translate":"game.boss_fight_extra.7"}
execute if score #user tidedcore_fight matches 400 run tellraw @a {"translate":"game.boss_fight_extra.8"}

# 开场动画
# 盔甲架放置
execute if score #user tidedcore_fight matches 280 run summon armor_stand 0 60 0 {NoGravity:true,Invisible:true,Tags:[memory_forget_near.armor_stand]}

# 动画控制
execute as @e[tag=memory_forget_near.armor_stand] at @s if score #user tidedcore_fight matches 280 run function tide_redemption:boss_extra/lib/circle/orange/4.5
execute as @e[tag=memory_forget_near.armor_stand] at @s if score #user tidedcore_fight matches 300 run function tide_redemption:boss_extra/lib/circle/orange/5.0
execute as @e[tag=memory_forget_near.armor_stand] at @s if score #user tidedcore_fight matches 320 run function tide_redemption:boss_extra/lib/circle/orange/5.5
execute as @e[tag=memory_forget_near.armor_stand] at @s if score #user tidedcore_fight matches 340 run function tide_redemption:boss_extra/lib/circle/orange/6.0
execute as @e[tag=memory_forget_near.armor_stand] at @s if score #user tidedcore_fight matches 360 run function tide_redemption:boss_extra/lib/circle/orange/6.5
execute as @e[tag=memory_forget_near.armor_stand] at @s if score #user tidedcore_fight matches 360 run function tide_redemption:boss_extra/lib/circle/orange/7.0
execute as @e[tag=memory_forget_near.armor_stand] at @s if score #user tidedcore_fight matches 380 run function tide_redemption:boss_extra/lib/circle/orange/7.5
execute as @e[tag=memory_forget_near.armor_stand] at @s if score #user tidedcore_fight matches 400 run function tide_redemption:boss_extra/lib/circle/orange/8.0
execute as @e[tag=memory_forget_near.armor_stand] at @s if score #user tidedcore_fight matches 420 run function tide_redemption:boss_extra/lib/circle/orange/8.5
execute as @e[tag=memory_forget_near.armor_stand] at @s if score #user tidedcore_fight matches 440 run function tide_redemption:boss_extra/lib/circle/orange/9.0
execute as @e[tag=memory_forget_near.armor_stand] at @s if score #user tidedcore_fight matches 460 run function tide_redemption:boss_extra/skill/boss_spawn/image_circle

#伤害判定、九格外安全
execute as @e[tag=memory_forget_near.armor_stand] at @s if entity @a[distance=..9] if score #user tidedcore_fight matches 460 run effect give @a[distance=..9] instant_damage 1 5
execute if score #user tidedcore_fight matches 460 run kill @e[tag=memory_forget_near.armor_stand]

# 第一次 储存钢铁/月环
execute if score #user tidedcore_fight matches 580 run function tide_redemption:boss_extra/boss_random_2
execute if score #user tidedcore_fight matches 580 if score #user tidedcore_random matches 1 run function tide_redemption:boss_extra/skill/delay_memory_forget_far/init
execute if score #user tidedcore_fight matches 580 if score #user tidedcore_random matches 1 run schedule function tide_redemption:boss_extra/skill/delay_memory_forget_near/init 420t

execute if score #user tidedcore_fight matches 580 if score #user tidedcore_random matches 2 run function tide_redemption:boss_extra/skill/delay_memory_forget_near/init
execute if score #user tidedcore_fight matches 580 if score #user tidedcore_random matches 2 run schedule function tide_redemption:boss_extra/skill/delay_memory_forget_far/init 420t

# 执行储存判定
execute as @e[tag=delay_memory_forget_far.armor_stand] at @s if score #user tidedcore_fight matches 940 run function tide_redemption:boss_extra/skill/delay_memory_forget_far/image_orange
execute if score #user tidedcore_fight matches 960 run function tide_redemption:boss_extra/skill/delay_memory_forget_far/check

execute as @e[tag=delay_memory_forget_near.armor_stand] at @s if score #user tidedcore_fight matches 940 run function tide_redemption:boss_extra/skill/delay_memory_forget_near/image_orange
execute if score #user tidedcore_fight matches 960 run function tide_redemption:boss_extra/skill/delay_memory_forget_near/check

# 第一次地火
execute if score #user tidedcore_fight matches 800 run function tide_redemption:boss/skill/memory_torrent_dataline/init

# 第一次分摊/分散 与 第二次分摊/分散
execute if score #user tidedcore_fight matches 1050 run function tide_redemption:boss_extra/boss_random_2
execute if score #user tidedcore_fight matches 1050 if score #user tidedcore_random matches 1 run function tide_redemption:boss/skill/memory_cut_shard/init
execute if score #user tidedcore_fight matches 1050 if score #user tidedcore_random matches 1 run schedule function tide_redemption:boss/skill/memory_cut_module/init 700t
execute if score #user tidedcore_fight matches 1050 if score #user tidedcore_random matches 2 run function tide_redemption:boss/skill/memory_cut_module/init
execute if score #user tidedcore_fight matches 1050 if score #user tidedcore_random matches 2 run schedule function tide_redemption:boss/skill/memory_cut_module/init 700t

# 执行储存判定
execute as @e[tag=delay_memory_forget_far.armor_stand] at @s if score #user tidedcore_fight matches 1170 run function tide_redemption:boss_extra/skill/delay_memory_forget_far/image_orange
execute if score #user tidedcore_fight matches 1190 run function tide_redemption:boss_extra/skill/delay_memory_forget_far/check

execute as @e[tag=delay_memory_forget_near.armor_stand] at @s if score #user tidedcore_fight matches 1170 run function tide_redemption:boss_extra/skill/delay_memory_forget_near/image_orange
execute if score #user tidedcore_fight matches 1190 run function tide_redemption:boss_extra/skill/delay_memory_forget_near/check

# 第一次踩塔
execute if score #user tidedcore_fight matches 1300 run function tide_redemption:boss_extra/skill/memory_torrent_songplus/init

# 第二次 储存钢铁/月环
execute if score #user tidedcore_fight matches 1340 run function tide_redemption:boss_extra/boss_random_2
execute if score #user tidedcore_fight matches 1340 if score #user tidedcore_random matches 1 run function tide_redemption:boss_extra/skill/delay_memory_forget_far/init
execute if score #user tidedcore_fight matches 1340 if score #user tidedcore_random matches 1 run schedule function tide_redemption:boss_extra/skill/delay_memory_forget_near/init 360t

execute if score #user tidedcore_fight matches 1340 if score #user tidedcore_random matches 2 run function tide_redemption:boss_extra/skill/delay_memory_forget_near/init
execute if score #user tidedcore_fight matches 1340 if score #user tidedcore_random matches 2 run schedule function tide_redemption:boss_extra/skill/delay_memory_forget_far/init 360t

# 第二次地火
execute if score #user tidedcore_fight matches 1500 run function tide_redemption:boss/skill/memory_torrent_dataline/init

# 执行储存判定
execute as @e[tag=delay_memory_forget_far.armor_stand] at @s if score #user tidedcore_fight matches 1640 run function tide_redemption:boss_extra/skill/delay_memory_forget_far/image_orange
execute if score #user tidedcore_fight matches 1660 run function tide_redemption:boss_extra/skill/delay_memory_forget_far/check

execute as @e[tag=delay_memory_forget_near.armor_stand] at @s if score #user tidedcore_fight matches 1640 run function tide_redemption:boss_extra/skill/delay_memory_forget_near/image_orange
execute if score #user tidedcore_fight matches 1660 run function tide_redemption:boss_extra/skill/delay_memory_forget_near/check

# 执行储存判定
execute as @e[tag=delay_memory_forget_far.armor_stand] at @s if score #user tidedcore_fight matches 1870 run function tide_redemption:boss_extra/skill/delay_memory_forget_far/image_orange
execute if score #user tidedcore_fight matches 1890 run function tide_redemption:boss_extra/skill/delay_memory_forget_far/check

execute as @e[tag=delay_memory_forget_near.armor_stand] at @s if score #user tidedcore_fight matches 1870 run function tide_redemption:boss_extra/skill/delay_memory_forget_near/image_orange
execute if score #user tidedcore_fight matches 1890 run function tide_redemption:boss_extra/skill/delay_memory_forget_near/check

# 第一次运动会
execute if score #user tidedcore_fight matches 2140 run function tide_redemption:boss/skill/memory_torrent_bleeding/init
execute if score #user tidedcore_fight matches 2225 run function tide_redemption:boss/skill/memory_torrent_bleeding/init
execute if score #user tidedcore_fight matches 2310 run function tide_redemption:boss/skill/memory_torrent_bleeding/init
execute if score #user tidedcore_fight matches 2395 run function tide_redemption:boss/skill/memory_torrent_bleeding/init

# 钢铁/月环 + 钢铁/月环
execute if score #user tidedcore_fight matches 2140 run function tide_redemption:boss_extra/boss_random_2
execute if score #user tidedcore_fight matches 2140 if score #user tidedcore_random matches 1 run function tide_redemption:boss_extra/skill/fast_memory_forget_far/init
execute if score #user tidedcore_fight matches 2140 if score #user tidedcore_random matches 1 run schedule function tide_redemption:boss_extra/skill/fast_memory_forget_near/init 85t
execute if score #user tidedcore_fight matches 2140 if score #user tidedcore_random matches 2 run function tide_redemption:boss_extra/skill/fast_memory_forget_near/init
execute if score #user tidedcore_fight matches 2140 if score #user tidedcore_random matches 2 run schedule function tide_redemption:boss_extra/skill/fast_memory_forget_far/init 85t

execute if score #user tidedcore_fight matches 2310 run function tide_redemption:boss_extra/boss_random_2
execute if score #user tidedcore_fight matches 2310 if score #user tidedcore_random matches 1 run function tide_redemption:boss_extra/skill/fast_memory_forget_far/init
execute if score #user tidedcore_fight matches 2310 if score #user tidedcore_random matches 1 run schedule function tide_redemption:boss_extra/skill/fast_memory_forget_near/init 85t
execute if score #user tidedcore_fight matches 2310 if score #user tidedcore_random matches 2 run function tide_redemption:boss_extra/skill/fast_memory_forget_near/init
execute if score #user tidedcore_fight matches 2310 if score #user tidedcore_random matches 2 run schedule function tide_redemption:boss_extra/skill/fast_memory_forget_far/init 85t
# 一运结束

# 永恒冻结 进入P2
execute if score #user tidedcore_fight matches 2600 run function tide_redemption:boss/skill/memory_forever_frozen/init
execute if score #user tidedcore_fight matches 2650 run tellraw @a {"translate":"game.boss_fight.frozen1"}
execute if score #user tidedcore_fight matches 2801 run clear @a[x=-11,y=60,z=-11,dx=22,dy=7,dz=22] enchanted_golden_apple

# P2 开场存储
execute if score #user tidedcore_fight matches 3100 run function tide_redemption:boss_extra/boss_random_2
execute if score #user tidedcore_fight matches 3100 if score #user tidedcore_random matches 1 run function tide_redemption:boss_extra/skill/delay_memory_forget_far/init
execute if score #user tidedcore_fight matches 3100 if score #user tidedcore_random matches 2 run function tide_redemption:boss_extra/skill/delay_memory_forget_near/init

# 第二次运动会
# 第二次地火
execute if score #user tidedcore_fight matches 3320 run function tide_redemption:boss/skill/memory_torrent_dataline/init

# 随机分散分摊
execute if score #user tidedcore_fight matches 3340 run function tide_redemption:boss_extra/boss_random_2
execute if score #user tidedcore_fight matches 3340 if score #user tidedcore_random matches 1 run function tide_redemption:boss/skill/memory_cut_shard/init
execute if score #user tidedcore_fight matches 3340 if score #user tidedcore_random matches 1 run schedule function tide_redemption:boss/skill/memory_cut_module/init 100t
execute if score #user tidedcore_fight matches 3340 if score #user tidedcore_random matches 2 run function tide_redemption:boss/skill/memory_cut_module/init
execute if score #user tidedcore_fight matches 3340 if score #user tidedcore_random matches 2 run schedule function tide_redemption:boss/skill/memory_cut_shard/init 100t

# 随机钢铁/月环
execute if score #user tidedcore_fight matches 3360 run function tide_redemption:boss_extra/boss_random_2
execute if score #user tidedcore_fight matches 3360 if score #user tidedcore_random matches 1 run function tide_redemption:boss/skill/memory_forget_far/init
execute if score #user tidedcore_fight matches 3360 if score #user tidedcore_random matches 1 run schedule function tide_redemption:boss/skill/memory_forget_near/init 120t
execute if score #user tidedcore_fight matches 3360 if score #user tidedcore_random matches 2 run function tide_redemption:boss/skill/memory_forget_near/init
execute if score #user tidedcore_fight matches 3360 if score #user tidedcore_random matches 2 run schedule function tide_redemption:boss/skill/memory_forget_far/init 120t

# 第二次踩塔
execute if score #user tidedcore_fight matches 3530 run function tide_redemption:boss_extra/skill/memory_torrent_songplus/init

# 执行储存判定
execute as @e[tag=delay_memory_forget_far.armor_stand] at @s if score #user tidedcore_fight matches 3720 run function tide_redemption:boss_extra/skill/delay_memory_forget_far/image_orange
execute if score #user tidedcore_fight matches 3740 run function tide_redemption:boss_extra/skill/delay_memory_forget_far/check

execute as @e[tag=delay_memory_forget_near.armor_stand] at @s if score #user tidedcore_fight matches 3720 run function tide_redemption:boss_extra/skill/delay_memory_forget_near/image_orange
execute if score #user tidedcore_fight matches 3740 run function tide_redemption:boss_extra/skill/delay_memory_forget_near/check
# 二运结束

# 第三次运动会
execute if score #user tidedcore_fight matches 3900 run function tide_redemption:boss_extra/skill/memory_shadow/init
execute if score #user tidedcore_fight matches 3900 run tellraw @a {"translate":"game.boss.extra.fight.shadow.chat1"}
execute if score #user tidedcore_fight matches 3900..5800 run function tide_redemption:boss_extra/boss_tp_sky
# 三运结束

# 第三次地火
execute if score #user tidedcore_fight matches 6000 run function tide_redemption:boss/skill/memory_torrent_dataline/init

# 最后一次分摊分散
execute if score #user tidedcore_fight matches 6200 run function tide_redemption:boss_extra/boss_random_2
execute if score #user tidedcore_fight matches 6200 if score #user tidedcore_random matches 1 run function tide_redemption:boss/skill/memory_cut_shard/init
execute if score #user tidedcore_fight matches 6200 if score #user tidedcore_random matches 2 run function tide_redemption:boss/skill/memory_cut_module/init

# 最后一次钢铁月环
execute if score #user tidedcore_fight matches 6400 run function tide_redemption:boss_extra/boss_random_2
execute if score #user tidedcore_fight matches 6400 if score #user tidedcore_random matches 1 run function tide_redemption:boss/skill/memory_forget_far/init
execute if score #user tidedcore_fight matches 6400 if score #user tidedcore_random matches 2 run function tide_redemption:boss/skill/memory_forget_near/init

# 狂暴
execute if score #user tidedcore_fight matches 6600 run function tide_redemption:boss/skill/memory_forever_delete/init
execute if score #user tidedcore_fight matches 6700 run tellraw @a {"translate":"game.boss_fight.delete1"}
execute if score #user tidedcore_fight matches 6750 run tellraw @a {"translate":"game.boss_fight.delete2"}

execute if score #user tidedcore_fight matches 7100 run kill @a[x=-11,y=60,z=-11,dx=22,dy=7,dz=22]
execute if score #user tidedcore_fight matches 7100 run function tide_redemption:boss_extra/boss_fight_failed