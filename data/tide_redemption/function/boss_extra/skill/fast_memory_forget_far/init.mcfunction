# 添加技能时间轴
scoreboard objectives add fast_memory_forget_far trigger

# 添加BOSS BAR
bossbar add minecraft:fast_memory_forget_far {"color":"yellow","text":"「记忆遗忘 · 远」| 「Memory Forget · Far」"}
bossbar set minecraft:fast_memory_forget_far color red
bossbar set minecraft:fast_memory_forget_far max 80
bossbar set minecraft:fast_memory_forget_far players @a

# 移动BOSS至场中一次，生成盔甲架用于展示动画
# function tide_redemption:boss/boss_tp_ground
# execute positioned as @e[tag=tidedcore,limit=1] run summon armor_stand ~ ~ ~ {NoGravity:true,Invisible:true,Tags:[memory_forget_far.armor_stand]}

# 直接在场中生成盔甲架
summon armor_stand 0 60 0 {NoGravity:true,Invisible:true,Tags:[fast_memory_forget_far.armor_stand]}