# 添加技能时间轴
scoreboard objectives add memory_forever_frozen trigger

# 添加BOSS BAR
bossbar add minecraft:memory_forever_frozen {"color":"aqua","text":"「记忆损伤 · 永恒冻结」| 「Memory Hurt · Frozen Forever」"}
bossbar set minecraft:memory_forever_frozen color red
bossbar set minecraft:memory_forever_frozen max 320
bossbar set minecraft:memory_forever_frozen players @a

# 添加盔甲架并旋转启动法阵
summon armor_stand 0 60 0 {NoGravity:true,Invisible:true,Tags:[memory_forever_frozen]}