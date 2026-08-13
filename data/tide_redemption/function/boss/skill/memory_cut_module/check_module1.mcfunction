# 分别将分摊范围内的玩家数量导入计分板
execute store result score #player_number memory_cut_module_A run execute if entity @a[distance=..2]

# 若玩家数量大于2，则为低伤害，否则分摊玩家收到致死级伤害
execute if score #player_number memory_cut_module_A matches 2.. run effect give @a[distance=..3] minecraft:instant_damage 1 0
execute unless score #player_number memory_cut_module_A matches 2.. run effect give @a[distance=..3] minecraft:instant_damage 1 5

# 如果分摊重叠则范围内玩家直接去世
execute as @e[tag=cut_module_A] at @s if entity @e[tag=cut_module_B, distance=..3] run effect give @a[distance=..3] minecraft:instant_damage 1 5