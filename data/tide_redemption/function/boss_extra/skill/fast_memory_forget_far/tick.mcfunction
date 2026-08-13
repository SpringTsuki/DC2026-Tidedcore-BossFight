scoreboard players add #user fast_memory_forget_far 1
execute store result bossbar minecraft:fast_memory_forget_far value run scoreboard players get #user fast_memory_forget_far

# 动画控制
execute as @e[tag=fast_memory_forget_far.armor_stand] at @s if score #user fast_memory_forget_far matches 20 run function tide_redemption:boss_extra/skill/fast_memory_forget_far/image_orange
execute as @e[tag=fast_memory_forget_far.armor_stand] at @s if score #user fast_memory_forget_far matches 40 run function tide_redemption:boss_extra/skill/fast_memory_forget_far/image_orange
execute as @e[tag=fast_memory_forget_far.armor_stand] at @s if score #user fast_memory_forget_far matches 60 run function tide_redemption:boss_extra/skill/fast_memory_forget_far/image_orange
execute as @e[tag=fast_memory_forget_far.armor_stand] at @s if score #user fast_memory_forget_far matches 80 run function tide_redemption:boss_extra/skill/fast_memory_forget_far/image_red

execute if score #user fast_memory_forget_far matches 0..81 run function tide_redemption:boss/boss_tp

# 伤害判定
execute if score #user fast_memory_forget_far matches 80 run function tide_redemption:boss_extra/skill/fast_memory_forget_far/check
execute if score #user fast_memory_forget_far matches 81 run function tide_redemption:boss_extra/skill/fast_memory_forget_far/end