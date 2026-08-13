function tide_redemption:boss_extra/skill/memory_shadow/phantom/tick
function tide_redemption:boss_extra/skill/memory_shadow/copy/tick
function tide_redemption:boss_extra/skill/memory_shadow/paste/tick
function tide_redemption:boss_extra/skill/memory_shadow/realize/tick

scoreboard players add #user memory_shadow_timeline 1

# 「记忆模仿 · 记忆投影」
execute if score #user memory_shadow_timeline matches 1 run function tide_redemption:boss_extra/skill/memory_shadow/phantom/init

# 储存 钢铁/月环
execute if score #user memory_shadow_timeline matches 450 run function tide_redemption:boss_extra/boss_random_2
execute if score #user memory_shadow_timeline matches 450 if score #user tidedcore_random matches 1 run function tide_redemption:boss_extra/skill/delay_memory_forget_far/init
execute if score #user memory_shadow_timeline matches 450 if score #user tidedcore_random matches 2 run function tide_redemption:boss_extra/skill/delay_memory_forget_near/init

# 「记忆模仿 · 记忆复制」
execute if score #user memory_shadow_timeline matches 600 run function tide_redemption:boss_extra/skill/memory_shadow/copy/init

# 判定 钢铁/月环
execute as @e[tag=delay_memory_forget_far.armor_stand] at @s if score #user memory_shadow_timeline matches 1090 run function tide_redemption:boss_extra/skill/delay_memory_forget_far/image_orange
execute if score #user memory_shadow_timeline matches 1110 run function tide_redemption:boss_extra/skill/delay_memory_forget_far/check

execute as @e[tag=delay_memory_forget_near.armor_stand] at @s if score #user memory_shadow_timeline matches 1090 run function tide_redemption:boss_extra/skill/delay_memory_forget_near/image_orange
execute if score #user memory_shadow_timeline matches 1110 run function tide_redemption:boss_extra/skill/delay_memory_forget_near/check

# 「记忆模仿 · 记忆复制」判定
execute if score #user memory_shadow_timeline matches 1130 run function tide_redemption:boss_extra/skill/memory_shadow/paste/init

# 「记忆模仿 · 时空重现」
execute if score #user memory_shadow_timeline matches 1600 run function tide_redemption:boss_extra/skill/memory_shadow/realize/init
execute if score #user memory_shadow_timeline matches 1950 run function tide_redemption:boss_extra/skill/memory_shadow/end