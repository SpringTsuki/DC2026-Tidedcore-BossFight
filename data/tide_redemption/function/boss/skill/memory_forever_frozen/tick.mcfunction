scoreboard players add #user memory_forever_frozen 1
execute store result bossbar minecraft:memory_forever_frozen value run scoreboard players get #user memory_forever_frozen

execute as @e[tag=memory_forever_frozen] at @s run function tide_redemption:boss/lib/end/memory_forever_frozen
execute as @e[tag=memory_forever_frozen] at @s run tp @s ~ ~ ~ ~0.5 ~

execute if score #user memory_forever_frozen matches 200 run give @a[x=-11,y=60,z=-11,dx=22,dy=7,dz=22] enchanted_golden_apple 1
execute if score #user memory_forever_frozen matches 320 run function tide_redemption:boss/skill/memory_forever_frozen/check
execute if score #user memory_forever_frozen matches 321 run function tide_redemption:boss/skill/memory_forever_frozen/end

execute if score #user memory_forever_frozen matches 1..321 run function tide_redemption:boss/boss_tp