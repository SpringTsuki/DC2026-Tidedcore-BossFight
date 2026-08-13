# TP盔甲架的面向
execute as @e[tag=memory_shadow_dust1] at @s facing entity @a[sort=nearest,limit=1] feet run tp @s ^ ^ ^0.5
execute as @e[tag=memory_shadow_dust2] at @s facing entity @a[sort=nearest,limit=1] feet run tp @s ^ ^ ^0.5
execute as @e[tag=memory_shadow_dust3] at @s facing entity @a[sort=nearest,limit=1] feet run tp @s ^ ^ ^0.5
execute as @e[tag=memory_shadow_dust4] at @s facing entity @a[sort=nearest,limit=1] feet run tp @s ^ ^ ^0.5

# 在盔甲架脚底生成粒子特效
execute as @e[tag=memory_shadow_dust] at @s positioned ^ ^0.0625 ^ run function tide_redemption:boss/lib/dust/dust_aqua