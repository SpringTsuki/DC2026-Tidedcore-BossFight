# 判定动画
execute as @e[tag=delay_memory_forget_near.armor_stand] at @s run function tide_redemption:boss_extra/skill/delay_memory_forget_near/image_red

# 半径8格外安全
execute as @e[tag=delay_memory_forget_near.armor_stand] at @s if entity @a[distance=..8] run effect give @a[distance=..8] instant_damage 1 1

# 删除标记
kill @e[tag=delay_memory_forget_near.armor_stand]