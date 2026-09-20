# 清除可能跨越战斗生命周期的延迟技能，避免上一场战斗的技能在收尾后启动
schedule clear tide_redemption:boss/skill/memory_forget_far/init
schedule clear tide_redemption:boss/skill/memory_forget_near/init
schedule clear tide_redemption:boss/skill/memory_cut_module/init
schedule clear tide_redemption:boss/skill/memory_cut_shard/init

schedule clear tide_redemption:boss_extra/skill/delay_memory_forget_far/init
schedule clear tide_redemption:boss_extra/skill/delay_memory_forget_near/init
schedule clear tide_redemption:boss_extra/skill/fast_memory_forget_far/init
schedule clear tide_redemption:boss_extra/skill/fast_memory_forget_near/init
