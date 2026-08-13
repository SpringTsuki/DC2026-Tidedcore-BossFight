# 假人终点坐标 937 147 2031
# 假人生成坐标依次为：
# 946 157 2040
# 949 157 2031
# 946 157 2022
# 928 157 2040
# 925 157 2031
# 928 157 2022
# 937 157 2019

# 生成特效命令方块
execute if score #user tidedcore_fight matches 1 run setblock 0 60 0 minecraft:command_block

# 移除特效命令方块
execute if score #user tidedcore_fight matches 359 run setblock 0 60 0 minecraft:air

# 移动盔甲架至BOSS
execute if score #user tidedcore_fight matches 40..360 run function tide_redemption:boss/skill/boss_spawn/dust_move

# 盔甲架脚下生成粒子特效
execute as @e[tag=tidedcore_spawn] at @s positioned ^ ^0.0625 ^ run function tide_redemption:boss/lib/dust/dust_tidedcore_spawn

# 生成盔甲架
execute if score #user tidedcore_fight matches 40 run summon armor_stand 9.5 68 9.5 {Tags:["tidedcore_spawn"],Invisible:true}
execute if score #user tidedcore_fight matches 78 run summon armor_stand -9.5 68 -9.5 {Tags:["tidedcore_spawn"],Invisible:true}
execute if score #user tidedcore_fight matches 116 run summon armor_stand 12.5 68 0 {Tags:["tidedcore_spawn"],Invisible:true}
execute if score #user tidedcore_fight matches 154 run summon armor_stand -12.5 68 0 {Tags:["tidedcore_spawn"],Invisible:true}
execute if score #user tidedcore_fight matches 192 run summon armor_stand 9.5 68 -8.5 {Tags:["tidedcore_spawn"],Invisible:true}
execute if score #user tidedcore_fight matches 230 run summon armor_stand -8.5 68 -8.5 {Tags:["tidedcore_spawn"],Invisible:true}
execute if score #user tidedcore_fight matches 258 run summon armor_stand 0 70 -11.5 {Tags:["tidedcore_spawn"],Invisible:true}

# 移除盔甲架
# execute if score #user tidedcore_fight matches 359 run function tide_redemption:boss/skill/boss_spawn/end
execute if score #user tidedcore_fight matches 359 run kill @e[type=armor_stand,tag=tidedcore_spawn]