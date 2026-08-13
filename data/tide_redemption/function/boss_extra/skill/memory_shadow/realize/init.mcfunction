# 添加此BOSS BAR 辅助时间轴
scoreboard objectives add memory_shadow_realize trigger
scoreboard players set #user memory_shadow_realize 0

# 添加BOSS BAR
bossbar add minecraft:memory_shadow_realize {"color":"yellow","text":"「记忆模仿 · 时空重现」| 「Memory Shadow · Copy」"}
bossbar set minecraft:memory_shadow_realize color red
bossbar set minecraft:memory_shadow_realize max 120
bossbar set minecraft:memory_shadow_realize players @a

# 本BOSS BAR在Tick里回收