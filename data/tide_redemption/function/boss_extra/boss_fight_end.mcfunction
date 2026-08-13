tp @e[tag=tidedcore] ~ -255 ~

function tide_redemption:boss_extra/skill/boss_spawn/end

# 重置BOSS战
setblock 0 60 0 minecraft:air
setblock 0 61 0 minecraft:air
clone 0 57 1 0 58 1 to minecraft:overworld 0 60 0 replace

# 开放玩家进入
clone -1 56 3 1 58 3 to minecraft:overworld -1 60 12 replace

scoreboard objectives remove tidedcore_fight
scoreboard objectives remove tidedcore_random
scoreboard objectives remove tidedcore_check_hp_defend
scoreboard objectives remove tidedcore_check_hp_delete
scoreboard objectives remove tidedcore_fight_player
scoreboard objectives remove tidedcore_minhp

function tide_redemption:boss_extra/skill/delay_memory_forget_far/end
function tide_redemption:boss_extra/skill/delay_memory_forget_near/end
function tide_redemption:boss_extra/skill/fast_memory_forget_far/end
function tide_redemption:boss_extra/skill/fast_memory_forget_near/end
function tide_redemption:boss_extra/skill/memory_torrent_songplus/end
function tide_redemption:boss_extra/skill/memory_shadow/end

# 延迟咏唱假人移除
kill @e[tag=delay_memory_forget_near.armor_stand]
kill @e[tag=delay_memory_forget_far.armor_stand]


# function tide_redemption:boss/boss_fight_end

# 重置检查函数
scoreboard players set #user bossfight_extra_tidedcore 0