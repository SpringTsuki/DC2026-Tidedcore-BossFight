scoreboard players add #user memory_forget_near 1
execute store result bossbar minecraft:memory_forget_near value run scoreboard players get #user memory_forget_near

# 动画控制
execute as @e[tag=memory_forget_near.armor_stand] at @s if score #user memory_forget_near matches 20 run function tide_redemption:boss/skill/memory_forget_near/image_orange
execute as @e[tag=memory_forget_near.armor_stand] at @s if score #user memory_forget_near matches 40 run function tide_redemption:boss/skill/memory_forget_near/image_orange
execute as @e[tag=memory_forget_near.armor_stand] at @s if score #user memory_forget_near matches 60 run function tide_redemption:boss/skill/memory_forget_near/image_orange
execute as @e[tag=memory_forget_near.armor_stand] at @s if score #user memory_forget_near matches 80 run function tide_redemption:boss/skill/memory_forget_near/image_orange
execute as @e[tag=memory_forget_near.armor_stand] at @s if score #user memory_forget_near matches 100 run function tide_redemption:boss/skill/memory_forget_near/image_orange
execute as @e[tag=memory_forget_near.armor_stand] at @s if score #user memory_forget_near matches 120 run function tide_redemption:boss/skill/memory_forget_near/image_red

execute if score #user memory_forget_near matches 0..121 run function tide_redemption:boss/boss_tp

# 伤害判定
execute if score #user memory_forget_near matches 120 run function tide_redemption:boss/skill/memory_forget_near/check
execute if score #user memory_forget_near matches 121 run function tide_redemption:boss/skill/memory_forget_near/end