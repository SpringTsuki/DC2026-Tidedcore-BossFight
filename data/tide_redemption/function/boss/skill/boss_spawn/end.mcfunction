# 移除血量轴
function tide_redemption:boss/skill/boss_spawn/bossbar/end

# 移除血量计分板
scoreboard objectives remove tidedcore_hp

# 移除开场特效
kill @e[type=armor_stand,tag=tidedcore_spawn]
