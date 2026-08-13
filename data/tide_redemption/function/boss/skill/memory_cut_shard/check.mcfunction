# 分别将每位玩家的分散范围内的玩家数量分别导入计分板
execute store result score #player_number memory_cut_shard_A run execute as @e[tag=memory_cut_shard_A] at @s if entity @a[distance=..2]
execute store result score #player_number memory_cut_shard_B run execute as @e[tag=memory_cut_shard_B] at @s if entity @a[distance=..2]
execute store result score #player_number memory_cut_shard_C run execute as @e[tag=memory_cut_shard_C] at @s if entity @a[distance=..2]
execute store result score #player_number memory_cut_shard_D run execute as @e[tag=memory_cut_shard_D] at @s if entity @a[distance=..2]

# 若玩家数量等于1，范围内的玩家承受低伤害
execute as @e[tag=memory_cut_shard_A] at @s if score #player_number memory_cut_shard_A matches 1 run effect give @a[distance=..2] minecraft:instant_damage 1 0
execute as @e[tag=memory_cut_shard_B] at @s if score #player_number memory_cut_shard_B matches 1 run effect give @a[distance=..2] minecraft:instant_damage 1 0
execute as @e[tag=memory_cut_shard_C] at @s if score #player_number memory_cut_shard_C matches 1 run effect give @a[distance=..2] minecraft:instant_damage 1 0
execute as @e[tag=memory_cut_shard_D] at @s if score #player_number memory_cut_shard_D matches 1 run effect give @a[distance=..2] minecraft:instant_damage 1 0

# 若玩家数量大于1，范围内的玩家承受高伤害
execute as @e[tag=memory_cut_shard_A] at @s if score #player_number memory_cut_shard_A matches 2.. run effect give @a[distance=..2] minecraft:instant_damage 1 5
execute as @e[tag=memory_cut_shard_B] at @s if score #player_number memory_cut_shard_B matches 2.. run effect give @a[distance=..2] minecraft:instant_damage 1 5
execute as @e[tag=memory_cut_shard_C] at @s if score #player_number memory_cut_shard_C matches 2.. run effect give @a[distance=..2] minecraft:instant_damage 1 5
execute as @e[tag=memory_cut_shard_D] at @s if score #player_number memory_cut_shard_D matches 2.. run effect give @a[distance=..2] minecraft:instant_damage 1 5
