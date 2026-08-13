# 判定动画
execute as @e[tag=delay_memory_forget_far.armor_stand] at @s run function tide_redemption:boss_extra/skill/delay_memory_forget_far/image_red

# 半径4格内安全
execute as @e[tag=delay_memory_forget_far.armor_stand] at @s if entity @a[distance=4.1..12] run effect give @a[distance=4.1..12] instant_damage 1 1

# 删除标记
kill @e[tag=delay_memory_forget_far.armor_stand]