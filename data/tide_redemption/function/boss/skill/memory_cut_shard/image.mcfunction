execute as @e[tag=memory_cut_shard_A] at @s run summon minecraft:armor_stand ~ ~2.5 ~ {Invisible:true,NoGravity:true,Tags:["memory_cut_shard.armor_stand"]}
execute as @e[tag=memory_cut_shard_B] at @s run summon minecraft:armor_stand ~ ~2.5 ~ {Invisible:true,NoGravity:true,Tags:["memory_cut_shard.armor_stand"]}
execute as @e[tag=memory_cut_shard_C] at @s run summon minecraft:armor_stand ~ ~2.5 ~ {Invisible:true,NoGravity:true,Tags:["memory_cut_shard.armor_stand"]}
execute as @e[tag=memory_cut_shard_D] at @s run summon minecraft:armor_stand ~ ~2.5 ~ {Invisible:true,NoGravity:true,Tags:["memory_cut_shard.armor_stand"]}

execute as @e[tag=memory_cut_shard.armor_stand] at @s run function tide_redemption:boss/lib/image/cut_shard
kill @e[tag=memory_cut_shard.armor_stand]