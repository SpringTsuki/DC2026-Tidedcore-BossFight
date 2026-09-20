stopsound @a

# 清除异常中断的上一场战斗可能留下的延迟技能
function tide_redemption:boss/lib/clear_schedules
# 增加检查函数
scoreboard objectives add bossfight_tidedcore trigger
scoreboard players set #user bossfight_tidedcore 1

# BOSS生成初始化
function tide_redemption:boss/skill/boss_spawn/init

# BOSS BGM
function tide_redemption:bgm/lyric/bgm_boss_tidedcore/init

# BOSS时间轴初始化
scoreboard objectives add tidedcore_fight trigger
scoreboard players set #user tidedcore_fight 0

# BOSS技能随机数
scoreboard objectives add tidedcore_random trigger
scoreboard players set #user tidedcore_random 0

# 命令方块按钮消失
setblock 0 61 0 minecraft:air

# 禁止玩家进入
clone -1 56 2 1 58 2 to minecraft:overworld -1 60 12 replace

# BOSS检测存活玩家
scoreboard objectives add tidedcore_fight_player trigger

# 修改重生点
spawnpoint @a 0 60 30

# 锁血
scoreboard objectives add tidedcore_minhp trigger
scoreboard players set #tidedcore tidedcore_minhp 1

# 若在狂暴前打到小于100血，则触发此计分板用于提示防御模式
# 此计分板添加在了tick中，以便于触发后再激活
# scoreboard objectives add tidedcore_check_hp_defend trigger

# 若狂暴开始3秒后小于100血，则触发台词
# scoreboard objectives add tidedcore_check_hp_delete trigger
