scoreboard players add #user memory_forget_far 1
execute store result bossbar minecraft:memory_forget_far value run scoreboard players get #user memory_forget_far

# 动画控制
execute as @e[tag=memory_forget_far.armor_stand] at @s if score #user memory_forget_far matches 20 run function tide_redemption:boss/skill/memory_forget_far/image_orange
execute as @e[tag=memory_forget_far.armor_stand] at @s if score #user memory_forget_far matches 40 run function tide_redemption:boss/skill/memory_forget_far/image_orange
execute as @e[tag=memory_forget_far.armor_stand] at @s if score #user memory_forget_far matches 60 run function tide_redemption:boss/skill/memory_forget_far/image_orange
execute as @e[tag=memory_forget_far.armor_stand] at @s if score #user memory_forget_far matches 80 run function tide_redemption:boss/skill/memory_forget_far/image_orange
execute as @e[tag=memory_forget_far.armor_stand] at @s if score #user memory_forget_far matches 100 run function tide_redemption:boss/skill/memory_forget_far/image_orange
execute as @e[tag=memory_forget_far.armor_stand] at @s if score #user memory_forget_far matches 120 run function tide_redemption:boss/skill/memory_forget_far/image_red

execute if score #user memory_forget_far matches 0..121 run function tide_redemption:boss/boss_tp

# 伤害判定
execute if score #user memory_forget_far matches 120 run function tide_redemption:boss/skill/memory_forget_far/check
execute if score #user memory_forget_far matches 121 run function tide_redemption:boss/skill/memory_forget_far/end