# 添加此BOSS BAR 辅助时间轴
scoreboard objectives add memory_shadow_phantom trigger
scoreboard players set #user memory_shadow_phantom 0

# 添加BOSS BAR
bossbar add minecraft:memory_shadow_phantom {"color":"yellow","text":"「记忆模仿 · 记忆投影」| 「Memory Shadow · Phantom」"}
bossbar set minecraft:memory_shadow_phantom color red
bossbar set minecraft:memory_shadow_phantom max 440
bossbar set minecraft:memory_shadow_phantom players @a