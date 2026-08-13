scoreboard players add #user delay_memory_forget_far 1
execute store result bossbar minecraft:delay_memory_forget_far value run scoreboard players get #user delay_memory_forget_far

# 移除动画控制
# execute as @e[tag=memory_forget_far.armor_stand] at @s if score #user memory_forget_far matches 20 run function tide_redemption:boss_extra/skill/delay_memory_forget_far/image_orange
# execute as @e[tag=memory_forget_far.armor_stand] at @s if score #user memory_forget_far matches 40 run function tide_redemption:boss_extra/skill/delay_memory_forget_far/image_orange
# execute as @e[tag=memory_forget_far.armor_stand] at @s if score #user memory_forget_far matches 60 run function tide_redemption:boss_extra/skill/delay_memory_forget_far/image_orange
# execute as @e[tag=memory_forget_far.armor_stand] at @s if score #user memory_forget_far matches 80 run function tide_redemption:boss_extra/skill/delay_memory_forget_far/image_orange
# execute as @e[tag=memory_forget_far.armor_stand] at @s if score #user memory_forget_far matches 100 run function tide_redemption:boss_extra/skill/delay_memory_forget_far/image_orange

# 红色部分稍后判定
# execute as @e[tag=memory_forget_far.armor_stand] at @s if score #user memory_forget_far matches 120 run function tide_redemption:boss_extra/skill/memory_forget_far/image_red

# execute if score #user memory_forget_far matches 0..121 run function tide_redemption:boss_extra/boss_tp

# 伤害稍后判定
# execute if score #user memory_forget_far matches 120 run function tide_redemption:boss_extra/skill/memory_forget_far/check
execute if score #user delay_memory_forget_far matches 120 run function tide_redemption:boss_extra/skill/delay_memory_forget_far/end