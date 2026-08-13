scoreboard players add #user memory_shadow_paste 1

# 播放第一次动画 大圈
execute as @a[tag=memory_shadow_time_1,tag=memory_shadow_cut_1] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_paste matches 20 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_orange
execute as @a[tag=memory_shadow_time_1,tag=memory_shadow_cut_1] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_paste matches 40 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_orange
execute as @a[tag=memory_shadow_time_1,tag=memory_shadow_cut_1] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_paste matches 60 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_orange
execute as @a[tag=memory_shadow_time_1,tag=memory_shadow_cut_1] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_paste matches 80 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_orange

# 第一次大圈判定
execute as @a[tag=memory_shadow_time_1,tag=memory_shadow_cut_1] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_paste matches 100 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_red
execute as @a[tag=memory_shadow_time_1,tag=memory_shadow_cut_1] at @s if score #user memory_shadow_paste matches 100 run effect give @s minecraft:resistance 1 5
execute as @a[tag=memory_shadow_time_1,tag=memory_shadow_cut_1] at @s if score #user memory_shadow_paste matches 100 if entity @a[distance=..15] run effect give @a[distance=..15] instant_damage 1 1

# 播放第一次动画 分摊
execute as @a[tag=memory_shadow_time_1,tag=memory_shadow_module_1] at @s if score #user memory_shadow_paste matches 20 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/image_module1
execute as @a[tag=memory_shadow_time_1,tag=memory_shadow_module_1] at @s if score #user memory_shadow_paste matches 40 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/image_module1
execute as @a[tag=memory_shadow_time_1,tag=memory_shadow_module_1] at @s if score #user memory_shadow_paste matches 60 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/image_module1
execute as @a[tag=memory_shadow_time_1,tag=memory_shadow_module_1] at @s if score #user memory_shadow_paste matches 80 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/image_module1

# 第一次分摊判定
execute as @a[tag=memory_shadow_time_1,tag=memory_shadow_module_1] at @s if score #user memory_shadow_paste matches 100 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/image_module1
execute as @a[tag=memory_shadow_time_1,tag=memory_shadow_module_1] at @s if score #user memory_shadow_paste matches 100 run function tide_redemption:boss_extra/skill/memory_shadow/paste/check_module

# BOSS分身一消失
execute if score #user memory_shadow_paste matches 100 run kill @e[type=armor_stand,tag=memory_shadow_time_1]

# 播放第二次动画 大圈
execute as @a[tag=memory_shadow_time_2,tag=memory_shadow_cut_2] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_paste matches 120 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_orange
execute as @a[tag=memory_shadow_time_2,tag=memory_shadow_cut_2] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_paste matches 140 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_orange
execute as @a[tag=memory_shadow_time_2,tag=memory_shadow_cut_2] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_paste matches 160 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_orange
execute as @a[tag=memory_shadow_time_2,tag=memory_shadow_cut_2] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_paste matches 180 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_orange

# 第二次大圈判定
execute as @a[tag=memory_shadow_time_2,tag=memory_shadow_cut_2] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_paste matches 200 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_red
execute as @a[tag=memory_shadow_time_2,tag=memory_shadow_cut_2] at @s if score #user memory_shadow_paste matches 200 run effect give @s minecraft:resistance 1 5
execute as @a[tag=memory_shadow_time_2,tag=memory_shadow_cut_2] at @s if score #user memory_shadow_paste matches 200 if entity @a[distance=..15] run effect give @a[distance=..15] instant_damage 1 1

# 播放第二次动画 分摊
execute as @a[tag=memory_shadow_time_2,tag=memory_shadow_module_2] at @s if score #user memory_shadow_paste matches 120 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/image_module1
execute as @a[tag=memory_shadow_time_2,tag=memory_shadow_module_2] at @s if score #user memory_shadow_paste matches 140 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/image_module1
execute as @a[tag=memory_shadow_time_2,tag=memory_shadow_module_2] at @s if score #user memory_shadow_paste matches 160 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/image_module1
execute as @a[tag=memory_shadow_time_2,tag=memory_shadow_module_2] at @s if score #user memory_shadow_paste matches 180 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/image_module1

# 第二次分摊判定
execute as @a[tag=memory_shadow_time_2,tag=memory_shadow_module_2] at @s if score #user memory_shadow_paste matches 200 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/image_module1
execute as @a[tag=memory_shadow_time_2,tag=memory_shadow_module_2] at @s if score #user memory_shadow_paste matches 200 run function tide_redemption:boss_extra/skill/memory_shadow/paste/check_module

# BOSS分身二消失
execute if score #user memory_shadow_paste matches 200 run kill @e[type=armor_stand,tag=memory_shadow_time_2]

# 播放第三次动画 大圈
execute as @a[tag=memory_shadow_time_3,tag=memory_shadow_cut_3] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_paste matches 220 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_orange
execute as @a[tag=memory_shadow_time_3,tag=memory_shadow_cut_3] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_paste matches 240 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_orange
execute as @a[tag=memory_shadow_time_3,tag=memory_shadow_cut_3] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_paste matches 260 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_orange
execute as @a[tag=memory_shadow_time_3,tag=memory_shadow_cut_3] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_paste matches 280 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_orange

# 第三次大圈判定
execute as @a[tag=memory_shadow_time_3,tag=memory_shadow_cut_3] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_paste matches 300 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_red
execute as @a[tag=memory_shadow_time_3,tag=memory_shadow_cut_3] at @s if score #user memory_shadow_paste matches 300 run effect give @s minecraft:resistance 1 5
execute as @a[tag=memory_shadow_time_3,tag=memory_shadow_cut_3] at @s if score #user memory_shadow_paste matches 300 if entity @a[distance=..15] run effect give @a[distance=..15] instant_damage 1 1

# 播放第三次动画 分摊
execute as @a[tag=memory_shadow_time_3,tag=memory_shadow_module_3] at @s if score #user memory_shadow_paste matches 220 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/image_module2
execute as @a[tag=memory_shadow_time_3,tag=memory_shadow_module_3] at @s if score #user memory_shadow_paste matches 240 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/image_module2
execute as @a[tag=memory_shadow_time_3,tag=memory_shadow_module_3] at @s if score #user memory_shadow_paste matches 260 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/image_module2
execute as @a[tag=memory_shadow_time_3,tag=memory_shadow_module_3] at @s if score #user memory_shadow_paste matches 280 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/image_module2

# 第三次分摊判定
execute as @a[tag=memory_shadow_time_3,tag=memory_shadow_module_3] at @s if score #user memory_shadow_paste matches 300 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/image_module2
execute as @a[tag=memory_shadow_time_3,tag=memory_shadow_module_3] at @s if score #user memory_shadow_paste matches 300 run function tide_redemption:boss_extra/skill/memory_shadow/paste/check_module

# BOSS分身三消失
execute if score #user memory_shadow_paste matches 300 run kill @e[type=armor_stand,tag=memory_shadow_time_3]

# 播放第四次动画 大圈
execute as @a[tag=memory_shadow_time_4,tag=memory_shadow_cut_4] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_paste matches 320 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_orange
execute as @a[tag=memory_shadow_time_4,tag=memory_shadow_cut_4] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_paste matches 340 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_orange
execute as @a[tag=memory_shadow_time_4,tag=memory_shadow_cut_4] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_paste matches 360 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_orange
execute as @a[tag=memory_shadow_time_4,tag=memory_shadow_cut_4] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_paste matches 380 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_orange

# 第四次大圈判定
execute as @a[tag=memory_shadow_time_4,tag=memory_shadow_cut_4] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_paste matches 400 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_red
execute as @a[tag=memory_shadow_time_4,tag=memory_shadow_cut_4] at @s if score #user memory_shadow_paste matches 400 run effect give @s minecraft:resistance 1 5
execute as @a[tag=memory_shadow_time_4,tag=memory_shadow_cut_4] at @s if score #user memory_shadow_paste matches 400 if entity @a[distance=..15] run effect give @a[distance=..15] instant_damage 1 1

# 播放第四次动画 分摊
execute as @a[tag=memory_shadow_time_4,tag=memory_shadow_module_4] at @s if score #user memory_shadow_paste matches 320 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/image_module2
execute as @a[tag=memory_shadow_time_4,tag=memory_shadow_module_4] at @s if score #user memory_shadow_paste matches 340 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/image_module2
execute as @a[tag=memory_shadow_time_4,tag=memory_shadow_module_4] at @s if score #user memory_shadow_paste matches 360 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/image_module2
execute as @a[tag=memory_shadow_time_4,tag=memory_shadow_module_4] at @s if score #user memory_shadow_paste matches 380 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/image_module2

# 第四次分摊判定
execute as @a[tag=memory_shadow_time_4,tag=memory_shadow_module_4] at @s if score #user memory_shadow_paste matches 400 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/image_module2
execute as @a[tag=memory_shadow_time_4,tag=memory_shadow_module_4] at @s if score #user memory_shadow_paste matches 400 run function tide_redemption:boss_extra/skill/memory_shadow/paste/check_module

# BOSS分身四消失
execute if score #user memory_shadow_paste matches 400 run kill @e[type=armor_stand,tag=memory_shadow_time_4]

execute if score #user memory_shadow_paste matches 400 run function tide_redemption:boss_extra/skill/memory_shadow/paste/end