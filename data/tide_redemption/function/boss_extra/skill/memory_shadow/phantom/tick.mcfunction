scoreboard players add #user memory_shadow_phantom 1
execute store result bossbar minecraft:memory_shadow_phantom value run scoreboard players get #user memory_shadow_phantom

# 动画控制 让盔甲架自行执行旋转并生成塔的粒子效果
execute as @e[tag=memory_shadow_dust] at @s if score #user memory_shadow_phantom matches 50..250 run tp @s ~ ~ ~ ~10 ~
execute as @e[tag=memory_shadow_dust] at @s positioned ^ ^0.0625 ^2 if score #user memory_shadow_phantom matches 50..250 run function tide_redemption:boss_extra/skill/memory_shadow/phantom/color

# 创建假人3、1
# 动画
execute if score #user memory_shadow_phantom matches 50 run summon armor_stand 0 60 -8 {Tags:[memory_shadow_dust],Invisible:true,NoGravity:true}
execute if score #user memory_shadow_phantom matches 50 run summon armor_stand 0 60 8 {Tags:[memory_shadow_dust],Invisible:true,NoGravity:true}

# 创建
execute if score #user memory_shadow_phantom matches 110 run kill @e[tag=memory_shadow_dust]
execute if score #user memory_shadow_phantom matches 110 run summon armor_stand 0 60 -8 {Tags:[memory_shadow_a,memory_shadow_armor],Invisible:false,NoGravity:true,Invulnerable:true,ArmorItems:[{id:"minecraft:leather_boots"},{id:"minecraft:leather_leggings"},{id:"minecraft:leather_chestplate"},{id:"minecraft:player_head",components:{"minecraft:profile":{}}}],Rotation:[0f]}
execute if score #user memory_shadow_phantom matches 110 run summon armor_stand 0 60 8 {Tags:[memory_shadow_b,memory_shadow_armor],Invisible:false,NoGravity:true,Invulnerable:true,ArmorItems:[{id:"minecraft:leather_boots"},{id:"minecraft:leather_leggings"},{id:"minecraft:leather_chestplate"},{id:"minecraft:player_head",components:{"minecraft:profile":{}}}],Rotation:[180f]}

# 创建假人2、4
# 动画
execute if score #user memory_shadow_phantom matches 150 run summon armor_stand -8 60 0 {Tags:[memory_shadow_dust],Invisible:true,NoGravity:true}
execute if score #user memory_shadow_phantom matches 150 run summon armor_stand 8 60 0 {Tags:[memory_shadow_dust],Invisible:true,NoGravity:true}

# 创建
execute if score #user memory_shadow_phantom matches 210 run kill @e[tag=memory_shadow_dust]
execute if score #user memory_shadow_phantom matches 210 run summon armor_stand -8 60 0 {Tags:[memory_shadow_c,memory_shadow_armor],Invisible:false,NoGravity:true,Invulnerable:true,ArmorItems:[{id:"minecraft:leather_boots"},{id:"minecraft:leather_leggings"},{id:"minecraft:leather_chestplate"},{id:"minecraft:player_head",components:{"minecraft:profile":{}}}],Rotation:[-90f]}
execute if score #user memory_shadow_phantom matches 210 run summon armor_stand 8 60 0 {Tags:[memory_shadow_d,memory_shadow_armor],Invisible:false,NoGravity:true,Invulnerable:true,ArmorItems:[{id:"minecraft:leather_boots"},{id:"minecraft:leather_leggings"},{id:"minecraft:leather_chestplate"},{id:"minecraft:player_head",components:{"minecraft:profile":{}}}],Rotation:[90f]}

# 赋予玩家Tag
# execute if entity @a[name=SpringAurora] if score #user memory_shadow_phantom matches 300 run tag SpringAurora add memory_shadow_a
execute unless entity @a[tag=memory_shadow_a] if score #user memory_shadow_phantom matches 300 run tag @r[x=-11,y=60,z=-11,dx=22,dy=7,dz=22] add memory_shadow_a

# execute if entity @a[name=CastorVow] if score #user memory_shadow_phantom matches 300 run tag CastorVow add memory_shadow_b
execute unless entity @a[tag=memory_shadow_b] if score #user memory_shadow_phantom matches 300 run tag @r[tag=!memory_shadow_a,x=-11,y=60,z=-11,dx=22,dy=7,dz=22] add memory_shadow_b

# execute if entity @a[name=Starry_Mika] if score #user memory_shadow_phantom matches 300 run tag Starry_Mika add memory_shadow_c
execute unless entity @a[tag=memory_shadow_c] if score #user memory_shadow_phantom matches 300 run tag @r[tag=!memory_shadow_a,tag=!memory_shadow_b,x=-11,y=60,z=-11,dx=22,dy=7,dz=22] add memory_shadow_c

# execute if entity @a[name=Yuan_Ye] if score #user memory_shadow_phantom matches 300 run tag Yuan_Ye add memory_shadow_d
execute unless entity @a[tag=memory_shadow_d] if score #user memory_shadow_phantom matches 300 run tag @r[tag=!memory_shadow_a,tag=!memory_shadow_b,tag=!memory_shadow_c,x=-11,y=60,z=-11,dx=22,dy=7,dz=22] add memory_shadow_d

# 复制被选中玩家的皮肤到分身头像
execute if score #user memory_shadow_phantom matches 300 as @a[tag=memory_shadow_a,limit=1] run data modify entity @e[tag=memory_shadow_a,tag=memory_shadow_armor,limit=1] ArmorItems[3].components.minecraft:profile.id set from entity @s UUID
execute if score #user memory_shadow_phantom matches 300 as @a[tag=memory_shadow_b,limit=1] run data modify entity @e[tag=memory_shadow_b,tag=memory_shadow_armor,limit=1] ArmorItems[3].components.minecraft:profile.id set from entity @s UUID
execute if score #user memory_shadow_phantom matches 300 as @a[tag=memory_shadow_c,limit=1] run data modify entity @e[tag=memory_shadow_c,tag=memory_shadow_armor,limit=1] ArmorItems[3].components.minecraft:profile.id set from entity @s UUID
execute if score #user memory_shadow_phantom matches 300 as @a[tag=memory_shadow_d,limit=1] run data modify entity @e[tag=memory_shadow_d,tag=memory_shadow_armor,limit=1] ArmorItems[3].components.minecraft:profile.id set from entity @s UUID

# 连线动画
execute if score #user memory_shadow_phantom matches 300 run function tide_redemption:boss_extra/skill/memory_shadow/phantom/armor/armor_spawn
execute if score #user memory_shadow_phantom matches 300..320 run function tide_redemption:boss_extra/skill/memory_shadow/phantom/armor/armor_tp
execute if score #user memory_shadow_phantom matches 320 run function tide_redemption:boss_extra/skill/memory_shadow/phantom/armor/armor_kill

execute if score #user memory_shadow_phantom matches 320 run function tide_redemption:boss_extra/skill/memory_shadow/phantom/armor/armor_spawn
execute if score #user memory_shadow_phantom matches 320..340 run function tide_redemption:boss_extra/skill/memory_shadow/phantom/armor/armor_tp
execute if score #user memory_shadow_phantom matches 340 run function tide_redemption:boss_extra/skill/memory_shadow/phantom/armor/armor_kill

execute if score #user memory_shadow_phantom matches 340 run function tide_redemption:boss_extra/skill/memory_shadow/phantom/armor/armor_spawn
execute if score #user memory_shadow_phantom matches 340..360 run function tide_redemption:boss_extra/skill/memory_shadow/phantom/armor/armor_tp
execute if score #user memory_shadow_phantom matches 360 run function tide_redemption:boss_extra/skill/memory_shadow/phantom/armor/armor_kill

execute if score #user memory_shadow_phantom matches 380 run function tide_redemption:boss_extra/skill/memory_shadow/phantom/armor/armor_spawn
execute if score #user memory_shadow_phantom matches 380..400 run function tide_redemption:boss_extra/skill/memory_shadow/phantom/armor/armor_tp
execute if score #user memory_shadow_phantom matches 400 run function tide_redemption:boss_extra/skill/memory_shadow/phantom/armor/armor_kill

execute if score #user memory_shadow_phantom matches 400 run function tide_redemption:boss_extra/skill/memory_shadow/phantom/armor/armor_spawn
execute if score #user memory_shadow_phantom matches 400..420 run function tide_redemption:boss_extra/skill/memory_shadow/phantom/armor/armor_tp
execute if score #user memory_shadow_phantom matches 420 run function tide_redemption:boss_extra/skill/memory_shadow/phantom/armor/armor_kill

execute if score #user memory_shadow_phantom matches 420 run function tide_redemption:boss_extra/skill/memory_shadow/phantom/armor/armor_spawn
execute if score #user memory_shadow_phantom matches 420..440 run function tide_redemption:boss_extra/skill/memory_shadow/phantom/armor/armor_tp
execute if score #user memory_shadow_phantom matches 440 run function tide_redemption:boss_extra/skill/memory_shadow/phantom/armor/armor_kill

# execute if score #user memory_shadow_phantom matches 440 run function tide_redemption:boss_extra/skill/memory_shadow/copy/init
execute if score #user memory_shadow_phantom matches 440 run bossbar remove memory_shadow_phantom
execute if score #user memory_shadow_phantom matches 440 run scoreboard objectives remove memory_shadow_phantom