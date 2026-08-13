# TP盔甲架的面向
execute as @e[tag=memory_shadow_a,tag=memory_shadow_dust] at @s facing entity @a[sort=nearest,tag=memory_shadow_a] feet run tp @e[tag=memory_shadow_a,tag=memory_shadow_dust] ^ ^ ^0.5
execute as @e[tag=memory_shadow_b,tag=memory_shadow_dust] at @s facing entity @a[sort=nearest,tag=memory_shadow_b] feet run tp @e[tag=memory_shadow_b,tag=memory_shadow_dust] ^ ^ ^0.5
execute as @e[tag=memory_shadow_c,tag=memory_shadow_dust] at @s facing entity @a[sort=nearest,tag=memory_shadow_c] feet run tp @e[tag=memory_shadow_c,tag=memory_shadow_dust] ^ ^ ^0.5
execute as @e[tag=memory_shadow_d,tag=memory_shadow_dust] at @s facing entity @a[sort=nearest,tag=memory_shadow_d] feet run tp @e[tag=memory_shadow_d,tag=memory_shadow_dust] ^ ^ ^0.5

# 在盔甲架脚底生成粒子特效
execute as @e[tag=memory_shadow_dust] at @s positioned ^ ^0.0625 ^ run function tide_redemption:boss/lib/dust/dust_aqua