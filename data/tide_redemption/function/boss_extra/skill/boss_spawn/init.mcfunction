bossbar add boss_tidedcore {"text":"§c「潮汐核心」- 「Tided Core」"}
bossbar set minecraft:boss_tidedcore players @a
bossbar set minecraft:boss_tidedcore max 1024
bossbar set minecraft:boss_tidedcore style progress
bossbar set minecraft:boss_tidedcore color yellow

# BOSSBAR 初始化
scoreboard objectives add bossbar_tidedcore trigger
scoreboard players set #user bossbar_tidedcore 0

# BOSS血量轴初始化
scoreboard objectives add tidedcore_hp trigger
scoreboard players set #tidedcore tidedcore_hp 0