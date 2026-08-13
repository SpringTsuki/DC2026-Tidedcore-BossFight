tellraw @a {"translate":"game.boss_fight.success.1"}

# 播放龙死亡音效
function tide_redemption:boss/boss_fight_end

# 执行各个技能结束
function tide_redemption:boss/skill/boss_spawn/end
function tide_redemption:boss/skill/memory_cut_module/end
function tide_redemption:boss/skill/memory_cut_shard/end
function tide_redemption:boss/skill/memory_forever_delete/end
function tide_redemption:boss/skill/memory_forever_frozen/end
function tide_redemption:boss/skill/memory_forget_far/end
function tide_redemption:boss/skill/memory_forget_near/end
function tide_redemption:boss/skill/memory_torrent_bleeding/end
function tide_redemption:boss/skill/memory_torrent_dataline/end
function tide_redemption:boss/skill/memory_torrent_song/end

execute as @a at @s run playsound minecraft:entity.ender_dragon.death master @s ~ ~ ~ 0.2