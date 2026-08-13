scoreboard players add #user memory_shadow_realize 1

execute if score #user memory_shadow_realize matches 1..120 run function tide_redemption:boss_extra/skill/memory_shadow/realize/bossbar
execute if score #user memory_shadow_realize matches 121 run bossbar remove memory_shadow_realize

# 动画控制 让盔甲架自行执行旋转并生成塔的粒子效果
execute as @e[tag=memory_shadow_dust] at @s if score #user memory_shadow_realize matches 1..460 run tp @s ~ ~ ~ ~10 ~
execute as @e[tag=memory_shadow_dust] at @s positioned ^ ^0.0625 ^2 if score #user memory_shadow_realize matches 1..460 run function tide_redemption:boss_extra/skill/memory_shadow/phantom/color

# 创建假人3、1
# 动画
execute if score #user memory_shadow_realize matches 1 run summon armor_stand 937 147 2023 {Tags:[memory_shadow_dust,memory_shadow_a],Invisible:true,NoGravity:true}
execute if score #user memory_shadow_realize matches 1 run summon armor_stand 937 147 2039 {Tags:[memory_shadow_dust,memory_shadow_b],Invisible:true,NoGravity:true}

# 创建假人2、4
# 动画
execute if score #user memory_shadow_realize matches 60 run summon armor_stand 929 147 2031 {Tags:[memory_shadow_dust,memory_shadow_c],Invisible:true,NoGravity:true}
execute if score #user memory_shadow_realize matches 60 run summon armor_stand 945 147 2031 {Tags:[memory_shadow_dust,memory_shadow_d],Invisible:true,NoGravity:true}

# 假人判断玩家身上所遭受过的技能 技能初始化时直接判断
# Tag = memory_shadow_a
execute as @e[tag=memory_shadow_a,tag=memory_shadow_armor] at @s if entity @a[tag=memory_shadow_a,tag=memory_shadow_cut_1] if score #user memory_shadow_realize matches 5 run tag @s add memory_shadow_cut
execute as @e[tag=memory_shadow_a,tag=memory_shadow_armor] at @s if entity @a[tag=memory_shadow_a,tag=memory_shadow_cut_2] if score #user memory_shadow_realize matches 5 run tag @s add memory_shadow_cut
execute as @e[tag=memory_shadow_a,tag=memory_shadow_armor] at @s if entity @a[tag=memory_shadow_a,tag=memory_shadow_cut_3] if score #user memory_shadow_realize matches 5 run tag @s add memory_shadow_cut
execute as @e[tag=memory_shadow_a,tag=memory_shadow_armor] at @s if entity @a[tag=memory_shadow_a,tag=memory_shadow_cut_4] if score #user memory_shadow_realize matches 5 run tag @s add memory_shadow_cut
execute as @e[tag=memory_shadow_a,tag=memory_shadow_armor] at @s if entity @a[tag=memory_shadow_a,tag=memory_shadow_module_1] if score #user memory_shadow_realize matches 5 run tag @s add memory_shadow_module
execute as @e[tag=memory_shadow_a,tag=memory_shadow_armor] at @s if entity @a[tag=memory_shadow_a,tag=memory_shadow_module_2] if score #user memory_shadow_realize matches 5 run tag @s add memory_shadow_module
execute as @e[tag=memory_shadow_a,tag=memory_shadow_armor] at @s if entity @a[tag=memory_shadow_a,tag=memory_shadow_module_3] if score #user memory_shadow_realize matches 5 run tag @s add memory_shadow_module
execute as @e[tag=memory_shadow_a,tag=memory_shadow_armor] at @s if entity @a[tag=memory_shadow_a,tag=memory_shadow_module_4] if score #user memory_shadow_realize matches 5 run tag @s add memory_shadow_module

# Tag = memory_shadow_b
execute as @e[tag=memory_shadow_b,tag=memory_shadow_armor] at @s if entity @a[tag=memory_shadow_b,tag=memory_shadow_cut_1] if score #user memory_shadow_realize matches 5 run tag @s add memory_shadow_cut
execute as @e[tag=memory_shadow_b,tag=memory_shadow_armor] at @s if entity @a[tag=memory_shadow_b,tag=memory_shadow_cut_2] if score #user memory_shadow_realize matches 5 run tag @s add memory_shadow_cut
execute as @e[tag=memory_shadow_b,tag=memory_shadow_armor] at @s if entity @a[tag=memory_shadow_b,tag=memory_shadow_cut_3] if score #user memory_shadow_realize matches 5 run tag @s add memory_shadow_cut
execute as @e[tag=memory_shadow_b,tag=memory_shadow_armor] at @s if entity @a[tag=memory_shadow_b,tag=memory_shadow_cut_4] if score #user memory_shadow_realize matches 5 run tag @s add memory_shadow_cut
execute as @e[tag=memory_shadow_b,tag=memory_shadow_armor] at @s if entity @a[tag=memory_shadow_b,tag=memory_shadow_module_1] if score #user memory_shadow_realize matches 5 run tag @s add memory_shadow_module
execute as @e[tag=memory_shadow_b,tag=memory_shadow_armor] at @s if entity @a[tag=memory_shadow_b,tag=memory_shadow_module_2] if score #user memory_shadow_realize matches 5 run tag @s add memory_shadow_module
execute as @e[tag=memory_shadow_b,tag=memory_shadow_armor] at @s if entity @a[tag=memory_shadow_b,tag=memory_shadow_module_3] if score #user memory_shadow_realize matches 5 run tag @s add memory_shadow_module
execute as @e[tag=memory_shadow_b,tag=memory_shadow_armor] at @s if entity @a[tag=memory_shadow_b,tag=memory_shadow_module_4] if score #user memory_shadow_realize matches 5 run tag @s add memory_shadow_module

# Tag = memory_shadow_c
execute as @e[tag=memory_shadow_c,tag=memory_shadow_armor] at @s if entity @a[tag=memory_shadow_c,tag=memory_shadow_cut_1] if score #user memory_shadow_realize matches 5 run tag @s add memory_shadow_cut
execute as @e[tag=memory_shadow_c,tag=memory_shadow_armor] at @s if entity @a[tag=memory_shadow_c,tag=memory_shadow_cut_2] if score #user memory_shadow_realize matches 5 run tag @s add memory_shadow_cut
execute as @e[tag=memory_shadow_c,tag=memory_shadow_armor] at @s if entity @a[tag=memory_shadow_c,tag=memory_shadow_cut_3] if score #user memory_shadow_realize matches 5 run tag @s add memory_shadow_cut
execute as @e[tag=memory_shadow_c,tag=memory_shadow_armor] at @s if entity @a[tag=memory_shadow_c,tag=memory_shadow_cut_4] if score #user memory_shadow_realize matches 5 run tag @s add memory_shadow_cut
execute as @e[tag=memory_shadow_c,tag=memory_shadow_armor] at @s if entity @a[tag=memory_shadow_c,tag=memory_shadow_module_1] if score #user memory_shadow_realize matches 5 run tag @s add memory_shadow_module
execute as @e[tag=memory_shadow_c,tag=memory_shadow_armor] at @s if entity @a[tag=memory_shadow_c,tag=memory_shadow_module_2] if score #user memory_shadow_realize matches 5 run tag @s add memory_shadow_module
execute as @e[tag=memory_shadow_c,tag=memory_shadow_armor] at @s if entity @a[tag=memory_shadow_c,tag=memory_shadow_module_3] if score #user memory_shadow_realize matches 5 run tag @s add memory_shadow_module
execute as @e[tag=memory_shadow_c,tag=memory_shadow_armor] at @s if entity @a[tag=memory_shadow_c,tag=memory_shadow_module_4] if score #user memory_shadow_realize matches 5 run tag @s add memory_shadow_module

# Tag = memory_shadow_d
execute as @e[tag=memory_shadow_d,tag=memory_shadow_armor] at @s if entity @a[tag=memory_shadow_d,tag=memory_shadow_cut_1] if score #user memory_shadow_realize matches 5 run tag @s add memory_shadow_cut
execute as @e[tag=memory_shadow_d,tag=memory_shadow_armor] at @s if entity @a[tag=memory_shadow_d,tag=memory_shadow_cut_2] if score #user memory_shadow_realize matches 5 run tag @s add memory_shadow_cut
execute as @e[tag=memory_shadow_d,tag=memory_shadow_armor] at @s if entity @a[tag=memory_shadow_d,tag=memory_shadow_cut_3] if score #user memory_shadow_realize matches 5 run tag @s add memory_shadow_cut
execute as @e[tag=memory_shadow_d,tag=memory_shadow_armor] at @s if entity @a[tag=memory_shadow_d,tag=memory_shadow_cut_4] if score #user memory_shadow_realize matches 5 run tag @s add memory_shadow_cut
execute as @e[tag=memory_shadow_d,tag=memory_shadow_armor] at @s if entity @a[tag=memory_shadow_d,tag=memory_shadow_module_1] if score #user memory_shadow_realize matches 5 run tag @s add memory_shadow_module
execute as @e[tag=memory_shadow_d,tag=memory_shadow_armor] at @s if entity @a[tag=memory_shadow_d,tag=memory_shadow_module_2] if score #user memory_shadow_realize matches 5 run tag @s add memory_shadow_module
execute as @e[tag=memory_shadow_d,tag=memory_shadow_armor] at @s if entity @a[tag=memory_shadow_d,tag=memory_shadow_module_3] if score #user memory_shadow_realize matches 5 run tag @s add memory_shadow_module
execute as @e[tag=memory_shadow_d,tag=memory_shadow_armor] at @s if entity @a[tag=memory_shadow_d,tag=memory_shadow_module_4] if score #user memory_shadow_realize matches 5 run tag @s add memory_shadow_module

# 假人3 执行技能
# 大圈
execute as @e[tag=memory_shadow_a,tag=memory_shadow_armor,tag=memory_shadow_cut] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_realize matches 120 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_orange
execute as @e[tag=memory_shadow_a,tag=memory_shadow_armor,tag=memory_shadow_cut] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_realize matches 140 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_orange
execute as @e[tag=memory_shadow_a,tag=memory_shadow_armor,tag=memory_shadow_cut] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_realize matches 160 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_orange
execute as @e[tag=memory_shadow_a,tag=memory_shadow_armor,tag=memory_shadow_cut] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_realize matches 180 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_orange

# 大圈判定
execute as @e[tag=memory_shadow_a,tag=memory_shadow_armor,tag=memory_shadow_cut] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_realize matches 200 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_red
execute as @e[tag=memory_shadow_a,tag=memory_shadow_armor,tag=memory_shadow_cut] at @s if entity @a[distance=..15] if score #user memory_shadow_realize matches 200 run effect give @a[distance=..15] minecraft:instant_damage 1 2

# 分摊
execute as @e[tag=memory_shadow_a,tag=memory_shadow_armor,tag=memory_shadow_module] at @s positioned ~ ~2.5 ~ if score #user memory_shadow_realize matches 120 run function tide_redemption:boss_extra/lib/image/cut_module
execute as @e[tag=memory_shadow_a,tag=memory_shadow_armor,tag=memory_shadow_module] at @s positioned ~ ~2.5 ~ if score #user memory_shadow_realize matches 140 run function tide_redemption:boss_extra/lib/image/cut_module
execute as @e[tag=memory_shadow_a,tag=memory_shadow_armor,tag=memory_shadow_module] at @s positioned ~ ~2.5 ~ if score #user memory_shadow_realize matches 160 run function tide_redemption:boss_extra/lib/image/cut_module
execute as @e[tag=memory_shadow_a,tag=memory_shadow_armor,tag=memory_shadow_module] at @s positioned ~ ~2.5 ~ if score #user memory_shadow_realize matches 180 run function tide_redemption:boss_extra/lib/image/cut_module
execute as @e[tag=memory_shadow_a,tag=memory_shadow_armor,tag=memory_shadow_module] at @s positioned ~ ~2.5 ~ if score #user memory_shadow_realize matches 200 run function tide_redemption:boss_extra/lib/image/cut_module

# 执行分摊判断
execute as @e[tag=memory_shadow_a,tag=memory_shadow_armor,tag=memory_shadow_module] at @s if score #user memory_shadow_realize matches 200 run function tide_redemption:boss_extra/skill/memory_shadow/realize/check_module

# 假人1 执行技能
# 大圈
execute as @e[tag=memory_shadow_b,tag=memory_shadow_armor,tag=memory_shadow_cut] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_realize matches 120 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_orange
execute as @e[tag=memory_shadow_b,tag=memory_shadow_armor,tag=memory_shadow_cut] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_realize matches 140 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_orange
execute as @e[tag=memory_shadow_b,tag=memory_shadow_armor,tag=memory_shadow_cut] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_realize matches 160 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_orange
execute as @e[tag=memory_shadow_b,tag=memory_shadow_armor,tag=memory_shadow_cut] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_realize matches 180 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_orange

# 大圈判定
execute as @e[tag=memory_shadow_b,tag=memory_shadow_armor,tag=memory_shadow_cut] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_realize matches 200 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_red
execute as @e[tag=memory_shadow_b,tag=memory_shadow_armor,tag=memory_shadow_cut] at @s if entity @a[distance=..15] if score #user memory_shadow_realize matches 200 run effect give @a[distance=..15] minecraft:instant_damage 1 2

# 分摊
execute as @e[tag=memory_shadow_b,tag=memory_shadow_armor,tag=memory_shadow_module] at @s positioned ~ ~2.5 ~ if score #user memory_shadow_realize matches 120 run function tide_redemption:boss_extra/lib/image/cut_module
execute as @e[tag=memory_shadow_b,tag=memory_shadow_armor,tag=memory_shadow_module] at @s positioned ~ ~2.5 ~ if score #user memory_shadow_realize matches 140 run function tide_redemption:boss_extra/lib/image/cut_module
execute as @e[tag=memory_shadow_b,tag=memory_shadow_armor,tag=memory_shadow_module] at @s positioned ~ ~2.5 ~ if score #user memory_shadow_realize matches 160 run function tide_redemption:boss_extra/lib/image/cut_module
execute as @e[tag=memory_shadow_b,tag=memory_shadow_armor,tag=memory_shadow_module] at @s positioned ~ ~2.5 ~ if score #user memory_shadow_realize matches 180 run function tide_redemption:boss_extra/lib/image/cut_module
execute as @e[tag=memory_shadow_b,tag=memory_shadow_armor,tag=memory_shadow_module] at @s positioned ~ ~2.5 ~ if score #user memory_shadow_realize matches 200 run function tide_redemption:boss_extra/lib/image/cut_module

# 执行分摊判断
execute as @e[tag=memory_shadow_b,tag=memory_shadow_armor,tag=memory_shadow_module] at @s if score #user memory_shadow_realize matches 200 run function tide_redemption:boss_extra/skill/memory_shadow/realize/check_module

# 假人3、1消失
execute if score #user memory_shadow_realize matches 200 run kill @e[tag=memory_shadow_a,tag=memory_shadow_armor,type=armor_stand]
execute if score #user memory_shadow_realize matches 200 run kill @e[tag=memory_shadow_a,tag=memory_shadow_dust,type=armor_stand]
execute if score #user memory_shadow_realize matches 200 run kill @e[tag=memory_shadow_b,tag=memory_shadow_armor,type=armor_stand]
execute if score #user memory_shadow_realize matches 200 run kill @e[tag=memory_shadow_b,tag=memory_shadow_dust,type=armor_stand]

# 假人2 执行技能
# 大圈
execute as @e[tag=memory_shadow_c,tag=memory_shadow_armor,tag=memory_shadow_cut] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_realize matches 220 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_orange
execute as @e[tag=memory_shadow_c,tag=memory_shadow_armor,tag=memory_shadow_cut] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_realize matches 240 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_orange
execute as @e[tag=memory_shadow_c,tag=memory_shadow_armor,tag=memory_shadow_cut] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_realize matches 260 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_orange
execute as @e[tag=memory_shadow_c,tag=memory_shadow_armor,tag=memory_shadow_cut] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_realize matches 280 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_orange

# 大圈判定
execute as @e[tag=memory_shadow_c,tag=memory_shadow_armor,tag=memory_shadow_cut] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_realize matches 300 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_red
execute as @e[tag=memory_shadow_c,tag=memory_shadow_armor,tag=memory_shadow_cut] at @s if entity @a[distance=..15] if score #user memory_shadow_realize matches 300 run effect give @a[distance=..15] minecraft:instant_damage 1 2

# 分摊
execute as @e[tag=memory_shadow_c,tag=memory_shadow_armor,tag=memory_shadow_module] at @s positioned ~ ~2.5 ~ if score #user memory_shadow_realize matches 220 run function tide_redemption:boss_extra/lib/image/cut_module
execute as @e[tag=memory_shadow_c,tag=memory_shadow_armor,tag=memory_shadow_module] at @s positioned ~ ~2.5 ~ if score #user memory_shadow_realize matches 240 run function tide_redemption:boss_extra/lib/image/cut_module
execute as @e[tag=memory_shadow_c,tag=memory_shadow_armor,tag=memory_shadow_module] at @s positioned ~ ~2.5 ~ if score #user memory_shadow_realize matches 260 run function tide_redemption:boss_extra/lib/image/cut_module
execute as @e[tag=memory_shadow_c,tag=memory_shadow_armor,tag=memory_shadow_module] at @s positioned ~ ~2.5 ~ if score #user memory_shadow_realize matches 280 run function tide_redemption:boss_extra/lib/image/cut_module
execute as @e[tag=memory_shadow_c,tag=memory_shadow_armor,tag=memory_shadow_module] at @s positioned ~ ~2.5 ~ if score #user memory_shadow_realize matches 300 run function tide_redemption:boss_extra/lib/image/cut_module

# 执行分摊判断
execute as @e[tag=memory_shadow_c,tag=memory_shadow_armor,tag=memory_shadow_module] at @s if score #user memory_shadow_realize matches 300 run function tide_redemption:boss_extra/skill/memory_shadow/realize/check_module

# 假人4 执行技能
# 大圈
execute as @e[tag=memory_shadow_d,tag=memory_shadow_armor,tag=memory_shadow_cut] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_realize matches 220 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_orange
execute as @e[tag=memory_shadow_d,tag=memory_shadow_armor,tag=memory_shadow_cut] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_realize matches 240 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_orange
execute as @e[tag=memory_shadow_d,tag=memory_shadow_armor,tag=memory_shadow_cut] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_realize matches 260 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_orange
execute as @e[tag=memory_shadow_d,tag=memory_shadow_armor,tag=memory_shadow_cut] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_realize matches 280 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_orange

# 大圈判定
execute as @e[tag=memory_shadow_d,tag=memory_shadow_armor,tag=memory_shadow_cut] at @s positioned ~ ~0.0625 ~ if score #user memory_shadow_realize matches 300 run function tide_redemption:boss_extra/skill/memory_shadow/paste/image/circle_red
execute as @e[tag=memory_shadow_d,tag=memory_shadow_armor,tag=memory_shadow_cut] at @s if entity @a[distance=..15] if score #user memory_shadow_realize matches 300 run effect give @a[distance=..15] minecraft:instant_damage 1 2

# 分摊
execute as @e[tag=memory_shadow_d,tag=memory_shadow_armor,tag=memory_shadow_module] at @s positioned ~ ~2.5 ~ if score #user memory_shadow_realize matches 220 run function tide_redemption:boss_extra/lib/image/cut_module
execute as @e[tag=memory_shadow_d,tag=memory_shadow_armor,tag=memory_shadow_module] at @s positioned ~ ~2.5 ~ if score #user memory_shadow_realize matches 240 run function tide_redemption:boss_extra/lib/image/cut_module
execute as @e[tag=memory_shadow_d,tag=memory_shadow_armor,tag=memory_shadow_module] at @s positioned ~ ~2.5 ~ if score #user memory_shadow_realize matches 260 run function tide_redemption:boss_extra/lib/image/cut_module
execute as @e[tag=memory_shadow_d,tag=memory_shadow_armor,tag=memory_shadow_module] at @s positioned ~ ~2.5 ~ if score #user memory_shadow_realize matches 280 run function tide_redemption:boss_extra/lib/image/cut_module
execute as @e[tag=memory_shadow_d,tag=memory_shadow_armor,tag=memory_shadow_module] at @s positioned ~ ~2.5 ~ if score #user memory_shadow_realize matches 300 run function tide_redemption:boss_extra/lib/image/cut_module

# 执行分摊判断
execute as @e[tag=memory_shadow_d,tag=memory_shadow_armor,tag=memory_shadow_module] at @s if score #user memory_shadow_realize matches 300 run function tide_redemption:boss_extra/skill/memory_shadow/realize/check_module

# 假人4、2消失
execute if score #user memory_shadow_realize matches 300 run kill @e[tag=memory_shadow_c,tag=memory_shadow_armor,type=armor_stand]
execute if score #user memory_shadow_realize matches 300 run kill @e[tag=memory_shadow_c,tag=memory_shadow_dust,type=armor_stand]
execute if score #user memory_shadow_realize matches 300 run kill @e[tag=memory_shadow_d,tag=memory_shadow_armor,type=armor_stand]
execute if score #user memory_shadow_realize matches 300 run kill @e[tag=memory_shadow_d,tag=memory_shadow_dust,type=armor_stand]

execute if score #user memory_shadow_realize matches 300 run function tide_redemption:boss_extra/skill/memory_shadow/realize/end