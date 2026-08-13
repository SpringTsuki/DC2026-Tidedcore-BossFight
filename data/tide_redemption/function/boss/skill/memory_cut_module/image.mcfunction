execute as @e[tag=cut_module_A] at @s run summon minecraft:armor_stand ~ ~2.5 ~ {Invisible:true,NoGravity:true,Tags:[cut_module_A_armor]}
execute as @e[tag=cut_module_A_armor] at @s run function tide_redemption:boss/lib/image/cut_module

execute as @e[tag=cut_module_B] at @s run summon minecraft:armor_stand ~ ~2.5 ~ {Invisible:true,NoGravity:true,Tags:[cut_module_B_armor]}
execute as @e[tag=cut_module_B_armor] at @s run function tide_redemption:boss/lib/image/cut_module

kill @e[tag=cut_module_A_armor]
kill @e[tag=cut_module_B_armor]