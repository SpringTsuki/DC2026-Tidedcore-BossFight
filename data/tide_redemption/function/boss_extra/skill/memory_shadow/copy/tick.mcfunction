scoreboard players add #user memory_shadow_copy 1
execute store result bossbar minecraft:memory_shadow_copy value run scoreboard players get #user memory_shadow_copy

# 动画控制 让盔甲架自行执行旋转并生成塔的粒子效果
execute as @e[tag=memory_shadow_dust] at @s if score #user memory_shadow_copy matches 50..300 run tp @s ~ ~ ~ ~10 ~
execute as @e[tag=memory_shadow_dust] at @s positioned ^ ^0.0625 ^2 if score #user memory_shadow_copy matches 50..300 run function tide_redemption:boss_extra/skill/memory_shadow/phantom/color

execute if score #user memory_shadow_copy matches 50 run function tide_redemption:boss_extra/boss_random_2
execute if score #user memory_shadow_copy matches 50 if score #user tidedcore_random matches 1 run summon armor_stand -6 60 -6 {Tags:[memory_shadow_time_1,memory_shadow_cut_1,memory_shadow_copy_armor],Invisible:true,NoGravity:true}
execute if score #user memory_shadow_copy matches 50 if score #user tidedcore_random matches 1 run summon armor_stand 6 60 -6 {Tags:[memory_shadow_time_2,memory_shadow_module_2,memory_shadow_copy_armor],Invisible:true,NoGravity:true}
execute if score #user memory_shadow_copy matches 50 if score #user tidedcore_random matches 2 run summon armor_stand -6 60 -6 {Tags:[memory_shadow_time_1,memory_shadow_module_1,memory_shadow_copy_armor],Invisible:true,NoGravity:true}
execute if score #user memory_shadow_copy matches 50 if score #user tidedcore_random matches 2 run summon armor_stand 6 60 -6 {Tags:[memory_shadow_time_2,memory_shadow_cut_2,memory_shadow_copy_armor],Invisible:true,NoGravity:true}

execute if score #user memory_shadow_copy matches 50 run function tide_redemption:boss_extra/boss_random_2
execute if score #user memory_shadow_copy matches 50 if score #user tidedcore_random matches 1 run summon armor_stand 6 60 6 {Tags:[memory_shadow_time_3,memory_shadow_cut_3,memory_shadow_copy_armor],Invisible:true,NoGravity:true}
execute if score #user memory_shadow_copy matches 50 if score #user tidedcore_random matches 1 run summon armor_stand -6 60 6 {Tags:[memory_shadow_time_4,memory_shadow_module_4,memory_shadow_copy_armor],Invisible:true,NoGravity:true}
execute if score #user memory_shadow_copy matches 50 if score #user tidedcore_random matches 2 run summon armor_stand 6 60 6 {Tags:[memory_shadow_time_3,memory_shadow_module_3,memory_shadow_copy_armor],Invisible:true,NoGravity:true}
execute if score #user memory_shadow_copy matches 50 if score #user tidedcore_random matches 2 run summon armor_stand -6 60 6 {Tags:[memory_shadow_time_4,memory_shadow_cut_4,memory_shadow_copy_armor],Invisible:true,NoGravity:true}

# 6号位动画控制
execute if score #user memory_shadow_copy matches 50 run summon armor_stand -6 60 -6 {Tags:[memory_shadow_dust],Invisible:true,NoGravity:true}
execute if score #user memory_shadow_copy matches 100 run function tide_redemption:boss_extra/skill/memory_shadow/copy/armor/armor_kill
# 判断6号位生成对应的BOSS分身
execute as @e[tag=memory_shadow_time_1,tag=memory_shadow_cut_1] at @s if score #user memory_shadow_copy matches 100 run summon armor_stand -6 60 -6 {Tags:[memory_shadow_time_1,memory_shadow_cut_1],Rotation:[-45f],NoGravity:true,Invulnerable:true,ArmorItems:[{id:"minecraft:leather_boots"},{id:"minecraft:leather_leggings"},{id:"minecraft:leather_chestplate"},{id:"minecraft:zombie_head"}]}
execute as @e[tag=memory_shadow_time_1,tag=memory_shadow_module_1] at @s if score #user memory_shadow_copy matches 100 run summon armor_stand -6 60 -6 {Tags:[memory_shadow_time_1,memory_shadow_module_1],Rotation:[-45f],NoGravity:true,Invulnerable:true,ArmorItems:[{id:"minecraft:leather_boots"},{id:"minecraft:leather_leggings"},{id:"minecraft:leather_chestplate"},{id:"minecraft:zombie_head"}]}

# 7号位动画控制
execute if score #user memory_shadow_copy matches 100 run summon armor_stand 6 60 -6 {Tags:[memory_shadow_dust],Invisible:true,NoGravity:true}
execute if score #user memory_shadow_copy matches 150 run function tide_redemption:boss_extra/skill/memory_shadow/copy/armor/armor_kill
# 判断7号位生成对应的BOSS分身
execute as @e[tag=memory_shadow_time_2,tag=memory_shadow_cut_2] at @s if score #user memory_shadow_copy matches 150 run summon armor_stand 6 60 -6 {Tags:[memory_shadow_time_2,memory_shadow_cut_2],Rotation:[45f],NoGravity:true,Invulnerable:true,ArmorItems:[{id:"minecraft:leather_boots"},{id:"minecraft:leather_leggings"},{id:"minecraft:leather_chestplate"},{id:"minecraft:zombie_head"}]}
execute as @e[tag=memory_shadow_time_2,tag=memory_shadow_module_2] at @s if score #user memory_shadow_copy matches 150 run summon armor_stand 6 60 -6 {Tags:[memory_shadow_time_2,memory_shadow_module_2],Rotation:[45f],NoGravity:true,Invulnerable:true,ArmorItems:[{id:"minecraft:leather_boots"},{id:"minecraft:leather_leggings"},{id:"minecraft:leather_chestplate"},{id:"minecraft:zombie_head"}]}

# 8号位动画控制
execute if score #user memory_shadow_copy matches 150 run summon armor_stand 6 60 6 {Tags:[memory_shadow_dust],Invisible:true,NoGravity:true}
execute if score #user memory_shadow_copy matches 200 run function tide_redemption:boss_extra/skill/memory_shadow/copy/armor/armor_kill
# 判断8号位生成对应的BOSS分身
execute as @e[tag=memory_shadow_time_3,tag=memory_shadow_cut_3] if score #user memory_shadow_copy matches 200 run summon armor_stand 6 60 6 {Tags:[memory_shadow_time_3,memory_shadow_cut_3],Rotation:[135f],NoGravity:true,Invulnerable:true,ArmorItems:[{id:"minecraft:leather_boots"},{id:"minecraft:leather_leggings"},{id:"minecraft:leather_chestplate"},{id:"minecraft:zombie_head"}]}
execute as @e[tag=memory_shadow_time_3,tag=memory_shadow_module_3] if score #user memory_shadow_copy matches 200 run summon armor_stand 6 60 6 {Tags:[memory_shadow_time_3,memory_shadow_module_3],Rotation:[135f],NoGravity:true,Invulnerable:true,ArmorItems:[{id:"minecraft:leather_boots"},{id:"minecraft:leather_leggings"},{id:"minecraft:leather_chestplate"},{id:"minecraft:zombie_head"}]}

# 5号位动画控制
execute if score #user memory_shadow_copy matches 200 run summon armor_stand -6 60 6 {Tags:[memory_shadow_dust],Invisible:true,NoGravity:true}
execute if score #user memory_shadow_copy matches 250 run function tide_redemption:boss_extra/skill/memory_shadow/copy/armor/armor_kill
# 判断8号位生成对应的BOSS分身
execute as @e[tag=memory_shadow_time_4,tag=memory_shadow_cut_4] if score #user memory_shadow_copy matches 250 run summon armor_stand -6 60 6 {Tags:[memory_shadow_time_4,memory_shadow_cut_4],Rotation:[-135f],NoGravity:true,Invulnerable:true,ArmorItems:[{id:"minecraft:leather_boots"},{id:"minecraft:leather_leggings"},{id:"minecraft:leather_chestplate"},{id:"minecraft:zombie_head"}]}
execute as @e[tag=memory_shadow_time_4,tag=memory_shadow_module_4] if score #user memory_shadow_copy matches 250 run summon armor_stand -6 60 6 {Tags:[memory_shadow_time_4,memory_shadow_module_4],Rotation:[-135f],NoGravity:true,Invulnerable:true,ArmorItems:[{id:"minecraft:leather_boots"},{id:"minecraft:leather_leggings"},{id:"minecraft:leather_chestplate"},{id:"minecraft:zombie_head"}]}

execute if score #user memory_shadow_copy matches 300 run kill @e[tag=memory_shadow_copy_armor]

# 动画控制（分摊分散、同时控制连线）
execute if score #user memory_shadow_copy matches 310 run function tide_redemption:boss_extra/skill/memory_shadow/copy/armor/armor_image

execute if score #user memory_shadow_copy matches 310 run function tide_redemption:boss_extra/skill/memory_shadow/copy/armor/armor_spawn
execute if score #user memory_shadow_copy matches 330..330 run function tide_redemption:boss_extra/skill/memory_shadow/copy/armor/armor_tp
execute if score #user memory_shadow_copy matches 330 run function tide_redemption:boss_extra/skill/memory_shadow/copy/armor/armor_kill

execute if score #user memory_shadow_copy matches 330 run function tide_redemption:boss_extra/skill/memory_shadow/copy/armor/armor_image

execute if score #user memory_shadow_copy matches 330 run function tide_redemption:boss_extra/skill/memory_shadow/copy/armor/armor_spawn
execute if score #user memory_shadow_copy matches 330..350 run function tide_redemption:boss_extra/skill/memory_shadow/copy/armor/armor_tp
execute if score #user memory_shadow_copy matches 350 run function tide_redemption:boss_extra/skill/memory_shadow/copy/armor/armor_kill

execute if score #user memory_shadow_copy matches 350 run function tide_redemption:boss_extra/skill/memory_shadow/copy/armor/armor_image

execute if score #user memory_shadow_copy matches 350 run function tide_redemption:boss_extra/skill/memory_shadow/copy/armor/armor_spawn
execute if score #user memory_shadow_copy matches 350..370 run function tide_redemption:boss_extra/skill/memory_shadow/copy/armor/armor_tp
execute if score #user memory_shadow_copy matches 370 run function tide_redemption:boss_extra/skill/memory_shadow/copy/armor/armor_kill

execute if score #user memory_shadow_copy matches 370 run function tide_redemption:boss_extra/skill/memory_shadow/copy/armor/armor_image

execute if score #user memory_shadow_copy matches 370 run function tide_redemption:boss_extra/skill/memory_shadow/copy/armor/armor_spawn
execute if score #user memory_shadow_copy matches 370..390 run function tide_redemption:boss_extra/skill/memory_shadow/copy/armor/armor_tp
execute if score #user memory_shadow_copy matches 390 run function tide_redemption:boss_extra/skill/memory_shadow/copy/armor/armor_kill

execute if score #user memory_shadow_copy matches 390 run function tide_redemption:boss_extra/skill/memory_shadow/copy/armor/armor_image

execute if score #user memory_shadow_copy matches 390 run function tide_redemption:boss_extra/skill/memory_shadow/copy/armor/armor_spawn
execute if score #user memory_shadow_copy matches 390..410 run function tide_redemption:boss_extra/skill/memory_shadow/copy/armor/armor_tp
execute if score #user memory_shadow_copy matches 410 run function tide_redemption:boss_extra/skill/memory_shadow/copy/armor/armor_kill

execute if score #user memory_shadow_copy matches 410 run function tide_redemption:boss_extra/skill/memory_shadow/copy/armor/armor_image

execute if score #user memory_shadow_copy matches 410 run function tide_redemption:boss_extra/skill/memory_shadow/copy/armor/armor_spawn
execute if score #user memory_shadow_copy matches 410..430 run function tide_redemption:boss_extra/skill/memory_shadow/copy/armor/armor_tp
execute if score #user memory_shadow_copy matches 430 run function tide_redemption:boss_extra/skill/memory_shadow/copy/armor/armor_kill

execute if score #user memory_shadow_copy matches 430 run function tide_redemption:boss_extra/skill/memory_shadow/copy/armor/armor_image

execute if score #user memory_shadow_copy matches 430 run function tide_redemption:boss_extra/skill/memory_shadow/copy/armor/armor_spawn
execute if score #user memory_shadow_copy matches 430..450 run function tide_redemption:boss_extra/skill/memory_shadow/copy/armor/armor_tp
execute if score #user memory_shadow_copy matches 450 run function tide_redemption:boss_extra/skill/memory_shadow/copy/armor/armor_kill

execute if score #user memory_shadow_copy matches 460 run function tide_redemption:boss_extra/skill/memory_shadow/copy/check
execute if score #user memory_shadow_copy matches 460 run bossbar remove memory_shadow_copy
execute if score #user memory_shadow_copy matches 460 run scoreboard objectives remove memory_shadow_copy
