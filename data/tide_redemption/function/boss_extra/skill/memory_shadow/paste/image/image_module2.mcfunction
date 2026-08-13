execute as @a[tag=memory_shadow_time_3,tag=memory_shadow_module_3] at @s run summon minecraft:armor_stand ~ ~2.5 ~ {Invisible:true,NoGravity:true,Tags:[memory_shadow_module,memory_shadow_dust]}
execute as @a[tag=memory_shadow_time_4,tag=memory_shadow_module_4] at @s run summon minecraft:armor_stand ~ ~2.5 ~ {Invisible:true,NoGravity:true,Tags:[memory_shadow_module,memory_shadow_dust]}
execute as @e[tag=memory_shadow_module,tag=memory_shadow_dust] at @s run function tide_redemption:boss/lib/image/cut_module

kill @e[tag=memory_shadow_module,tag=memory_shadow_dust]