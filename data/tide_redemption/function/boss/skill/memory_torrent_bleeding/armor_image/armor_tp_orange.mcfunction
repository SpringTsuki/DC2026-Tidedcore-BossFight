# TP盔甲架的面向
execute as @e[tag=memory_torrent_bleeding.armor_stand] at @s facing entity @a[sort=nearest] feet run tp @e[tag=memory_torrent_bleeding.armor_stand] ^ ^ ^0.5

# 在盔甲架脚底生成粒子特效
execute as @e[tag=memory_torrent_bleeding.armor_stand] at @s positioned ^ ^0.0625 ^ run function tide_redemption:boss/lib/dust/dust_orange