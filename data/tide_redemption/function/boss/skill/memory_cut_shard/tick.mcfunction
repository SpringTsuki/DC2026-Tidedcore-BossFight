# 技能组读条
scoreboard players add #user memory_cut_shard 1
execute store result bossbar minecraft:memory_cut_shard value run scoreboard players get #user memory_cut_shard

# 地面粒子特效控制
execute as @e[tag=memory_cut_shard.armor_dustA] at @s positioned as @p[tag=memory_cut_shard_A] run tp @s ~ ~3 ~
execute as @e[tag=memory_cut_shard.armor_dustA] at @s run tp @s ~ ~ ~ ~10 ~
execute as @e[tag=memory_cut_shard.armor_dustA] at @s positioned ^ ^-2.9375 ^2 run function tide_redemption:boss/lib/dust/dust_red

execute as @e[tag=memory_cut_shard.armor_dustB] at @s positioned as @p[tag=memory_cut_shard_B] run tp @s ~ ~3 ~
execute as @e[tag=memory_cut_shard.armor_dustB] at @s run tp @s ~ ~ ~ ~10 ~
execute as @e[tag=memory_cut_shard.armor_dustB] at @s positioned ^ ^-2.9375 ^2 run function tide_redemption:boss/lib/dust/dust_red

execute as @e[tag=memory_cut_shard.armor_dustC] at @s positioned as @p[tag=memory_cut_shard_C] run tp @s ~ ~3 ~
execute as @e[tag=memory_cut_shard.armor_dustC] at @s run tp @s ~ ~ ~ ~10 ~
execute as @e[tag=memory_cut_shard.armor_dustC] at @s positioned ^ ^-2.9375 ^2 run function tide_redemption:boss/lib/dust/dust_red

execute as @e[tag=memory_cut_shard.armor_dustD] at @s positioned as @p[tag=memory_cut_shard_D] run tp @s ~ ~3 ~
execute as @e[tag=memory_cut_shard.armor_dustD] at @s run tp @s ~ ~ ~ ~10 ~
execute as @e[tag=memory_cut_shard.armor_dustD] at @s positioned ^ ^-2.9375 ^2 run function tide_redemption:boss/lib/dust/dust_red

# 动画控制
execute if score #user memory_cut_shard matches 20 run function tide_redemption:boss/skill/memory_cut_shard/image
execute if score #user memory_cut_shard matches 40 run function tide_redemption:boss/skill/memory_cut_shard/image
execute if score #user memory_cut_shard matches 60 run function tide_redemption:boss/skill/memory_cut_shard/image
execute if score #user memory_cut_shard matches 80 run function tide_redemption:boss/skill/memory_cut_shard/image
execute if score #user memory_cut_shard matches 100 run function tide_redemption:boss/skill/memory_cut_shard/image
execute if score #user memory_cut_shard matches 120 run function tide_redemption:boss/skill/memory_cut_shard/image

# 伤害判定
execute if score #user memory_cut_shard matches 139 run function tide_redemption:boss/skill/memory_cut_shard/check

# 技能结束
execute if score #user memory_cut_shard matches 140 run function tide_redemption:boss/skill/memory_cut_shard/end

execute if score #user memory_cut_shard matches 1..140 run function tide_redemption:boss/boss_tp_ground