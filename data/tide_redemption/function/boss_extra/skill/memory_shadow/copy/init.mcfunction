# 添加此BOSS BAR 辅助时间轴
scoreboard objectives add memory_shadow_copy trigger
scoreboard players set #user memory_shadow_copy 0

# 添加BOSS BAR
bossbar add minecraft:memory_shadow_copy {"color":"yellow","text":"「记忆模仿 · 记忆复制」| 「Memory Shadow · Copy」"}
bossbar set minecraft:memory_shadow_copy color red
bossbar set minecraft:memory_shadow_copy max 460
bossbar set minecraft:memory_shadow_copy players @a