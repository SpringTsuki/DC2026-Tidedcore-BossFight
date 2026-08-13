function tide_redemption:boss/skill/boss_spawn/bossbar/init

# BOSS血量轴初始化
scoreboard objectives add tidedcore_hp trigger
scoreboard players set #tidedcore tidedcore_hp 0