# 技能组读条
scoreboard players add #user memory_cut_module 1
execute store result bossbar minecraft:memory_cut_module value run scoreboard players get #user memory_cut_module

# 动画控制
execute if score #user memory_cut_module matches 20 run function tide_redemption:boss/skill/memory_cut_module/image
execute if score #user memory_cut_module matches 40 run function tide_redemption:boss/skill/memory_cut_module/image
execute if score #user memory_cut_module matches 60 run function tide_redemption:boss/skill/memory_cut_module/image
execute if score #user memory_cut_module matches 80 run function tide_redemption:boss/skill/memory_cut_module/image
execute if score #user memory_cut_module matches 100 run function tide_redemption:boss/skill/memory_cut_module/image
execute if score #user memory_cut_module matches 120 run function tide_redemption:boss/skill/memory_cut_module/image

# 伤害判定
execute as @e[tag=cut_module_A] at @s if score #user memory_cut_module matches 139 run function tide_redemption:boss/skill/memory_cut_module/check_module1
execute as @e[tag=cut_module_B] at @s if score #user memory_cut_module matches 139 run function tide_redemption:boss/skill/memory_cut_module/check_module2

# 技能结束
execute if score #user memory_cut_module matches 140 run function tide_redemption:boss/skill/memory_cut_module/end
execute if score #user memory_cut_module matches 1..140 run function tide_redemption:boss/boss_tp_ground
