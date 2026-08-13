stopsound @a

# 增加检查函数
scoreboard objectives add bossfight_extra_tidedcore trigger
scoreboard players set #user bossfight_extra_tidedcore 1

# BOSS生成初始化
function tide_redemption:boss_extra/skill/boss_spawn/init

# BOSS BGM
function tide_redemption:bgm/boss_tidedcore_extra

# BOSS时间轴初始化
scoreboard objectives add tidedcore_fight trigger
scoreboard players set #user tidedcore_fight 0

# BOSS技能随机数初始化
scoreboard objectives add tidedcore_random trigger
scoreboard players set #user tidedcore_random 0

# 命令方块按钮消失
setblock 0 61 0 minecraft:air

# 禁止玩家进入
clone -1 56 2 1 58 2 to minecraft:overworld -1 60 12 replace

# BOSS检测存活玩家
scoreboard objectives add tidedcore_fight_player trigger

# TP 玩家
tp @a 0 60 5 -180 0

# 修改重生点
spawnpoint @a 0 60 30

# 锁血
scoreboard objectives add tidedcore_minhp trigger
scoreboard players set #tidedcore tidedcore_minhp 1