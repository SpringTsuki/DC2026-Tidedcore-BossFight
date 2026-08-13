# 添加技能时间轴
scoreboard objectives add memory_forever_delete trigger

# 添加BOSS BAR
bossbar add minecraft:memory_forever_delete {"color":"aqua","text":"「记忆损伤 · 强制删除」| 「Memory Delete · #sudo rm -rf /*」"}
bossbar set minecraft:memory_forever_delete color red
bossbar set minecraft:memory_forever_delete max 500
bossbar set minecraft:memory_forever_delete players @a

# 解除锁血
scoreboard players set #tidedcore tidedcore_minhp 0