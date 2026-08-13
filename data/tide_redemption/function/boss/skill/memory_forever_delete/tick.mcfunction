scoreboard players add #user memory_forever_delete 1
execute store result bossbar minecraft:memory_forever_delete value run scoreboard players get #user memory_forever_delete

execute as @e[tag=memory_forever_delete1] at @s run function tide_redemption:boss/lib/end/memory_forever_delete_1
execute as @e[tag=memory_forever_delete1] at @s run tp @s ~ ~ ~ ~0.5 ~

execute as @e[tag=memory_forever_delete2] at @s run function tide_redemption:boss/lib/end/memory_forever_delete_2
execute as @e[tag=memory_forever_delete2] at @s run tp @s ~ ~ ~ ~-0.5 ~

execute as @e[tag=memory_forever_delete3] at @s run function tide_redemption:boss/lib/end/memory_forever_delete_3
execute as @e[tag=memory_forever_delete3] at @s run tp @s ~ ~ ~ ~0.5 ~

execute as @e[tag=memory_forever_delete11] at @s positioned ^ ^7 ^ run function tide_redemption:boss/lib/end/memory_forever_delete_3
execute as @e[tag=memory_forever_delete11] at @s run tp @s ~ ~ ~ ~0.5 ~

execute as @e[tag=memory_forever_delete12] at @s positioned ^ ^7 ^ run function tide_redemption:boss/lib/end/memory_forever_delete_2
execute as @e[tag=memory_forever_delete12] at @s run tp @s ~ ~ ~ ~-0.5 ~

execute as @e[tag=memory_forever_delete13] at @s positioned ^ ^7 ^ run function tide_redemption:boss/lib/end/memory_forever_delete_1
execute as @e[tag=memory_forever_delete13] at @s run tp @s ~ ~ ~ ~0.5 ~

execute as @e[tag=memory_forever_delete4] at @s positioned ^ ^1 ^ run function tide_redemption:boss/lib/circle/aqua/13.0
execute as @e[tag=memory_forever_delete5] at @s positioned ^ ^2 ^ run function tide_redemption:boss/lib/circle/aqua/13.0
execute as @e[tag=memory_forever_delete6] at @s positioned ^ ^3 ^ run function tide_redemption:boss/lib/circle/aqua/13.0
execute as @e[tag=memory_forever_delete7] at @s positioned ^ ^4 ^ run function tide_redemption:boss/lib/circle/aqua/13.0
execute as @e[tag=memory_forever_delete8] at @s positioned ^ ^5 ^ run function tide_redemption:boss/lib/circle/aqua/13.0
execute as @e[tag=memory_forever_delete9] at @s positioned ^ ^6 ^ run function tide_redemption:boss/lib/circle/aqua/13.0
execute as @e[tag=memory_forever_delete10] at @s positioned ^ ^7 ^ run function tide_redemption:boss/lib/circle/aqua/13.0

execute if score #user memory_forever_delete matches 1 run summon armor_stand 0 60 0 {NoGravity:true,Invisible:true,Tags:[memory_forever_delete1,memory_forever_delete]}
execute if score #user memory_forever_delete matches 41 run summon armor_stand 0 60 0 {NoGravity:true,Invisible:true,Tags:[memory_forever_delete2,memory_forever_delete]}
execute if score #user memory_forever_delete matches 81 run summon armor_stand 0 60 0 {NoGravity:true,Invisible:true,Tags:[memory_forever_delete3,memory_forever_delete]}

execute if score #user memory_forever_delete matches 81 run summon armor_stand 0 60 0 {NoGravity:true,Invisible:true,Tags:[memory_forever_delete4,memory_forever_delete]}
execute if score #user memory_forever_delete matches 101 run summon armor_stand 0 60 0 {NoGravity:true,Invisible:true,Tags:[memory_forever_delete5,memory_forever_delete]}
execute if score #user memory_forever_delete matches 121 run summon armor_stand 0 60 0 {NoGravity:true,Invisible:true,Tags:[memory_forever_delete6,memory_forever_delete]}
execute if score #user memory_forever_delete matches 141 run summon armor_stand 0 60 0 {NoGravity:true,Invisible:true,Tags:[memory_forever_delete7,memory_forever_delete]}
execute if score #user memory_forever_delete matches 161 run summon armor_stand 0 60 0 {NoGravity:true,Invisible:true,Tags:[memory_forever_delete8,memory_forever_delete]}
execute if score #user memory_forever_delete matches 181 run summon armor_stand 0 60 0 {NoGravity:true,Invisible:true,Tags:[memory_forever_delete9,memory_forever_delete]}
execute if score #user memory_forever_delete matches 201 run summon armor_stand 0 60 0 {NoGravity:true,Invisible:true,Tags:[memory_forever_delete10,memory_forever_delete]}

execute if score #user memory_forever_delete matches 221 run summon armor_stand 0 60 0 {NoGravity:true,Invisible:true,Tags:[memory_forever_delete11,memory_forever_delete]}
execute if score #user memory_forever_delete matches 241 run summon armor_stand 0 60 0 {NoGravity:true,Invisible:true,Tags:[memory_forever_delete12,memory_forever_delete]}
execute if score #user memory_forever_delete matches 261 run summon armor_stand 0 60 0 {NoGravity:true,Invisible:true,Tags:[memory_forever_delete13,memory_forever_delete]}

execute if score #user memory_forever_delete matches 501 run function tide_redemption:boss/skill/memory_forever_delete/end
execute if score #user memory_forever_delete matches 1..501 run function tide_redemption:boss/boss_tp

