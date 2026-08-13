# 添加技能时间轴
scoreboard objectives add memory_torrent_bleeding trigger

# 添加BOSS BAR
bossbar add minecraft:memory_torrent_bleeding {"color":"yellow","text":"「记忆洪流 · 易伤刃」| 「Memory Torrent · Bleeding」"}
bossbar set minecraft:memory_torrent_bleeding color red
bossbar set minecraft:memory_torrent_bleeding max 80
bossbar set minecraft:memory_torrent_bleeding players @a

# 移动BOSS至场中
function tide_redemption:boss/boss_tp_facing

# 添加地面粒子特效盔甲架
summon armor_stand 0 60 0 {Tags:[memory_torrent_bleeding.armor_dust],Invisible:true,NoGravity:true}