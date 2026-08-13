scoreboard players add #user memory_torrent_bleeding 1
execute store result bossbar minecraft:memory_torrent_bleeding value run scoreboard players get #user memory_torrent_bleeding

# TP BOSS
execute if score #user memory_torrent_bleeding matches 1.. run function tide_redemption:boss/boss_tp

# 生成全局判定BOSS
execute if score #user memory_torrent_bleeding matches 1 run summon armor_stand 0 63 0 {NoGravity:true,Invisible:true,Tags:[memory_torrent_bleeding.armor_boss]}

# 地面粒子特效控制
execute as @e[tag=memory_torrent_bleeding.armor_boss] at @s positioned as @a[sort=nearest,limit=1] run tp @e[tag=memory_torrent_bleeding.armor_dust] ~ ~2 ~
execute as @e[tag=memory_torrent_bleeding.armor_dust] at @s run tp @s ~ ~ ~ ~10 ~
execute as @e[tag=memory_torrent_bleeding.armor_dust] at @s positioned ^ ^-1.9375 ^1.5 run function tide_redemption:boss/lib/dust/dust_red

# 动画控制
execute if score #user memory_torrent_bleeding matches 1 run function tide_redemption:boss/skill/memory_torrent_bleeding/armor_image/armor_spawn
execute if score #user memory_torrent_bleeding matches 1..20 run function tide_redemption:boss/skill/memory_torrent_bleeding/armor_image/armor_tp_orange
execute if score #user memory_torrent_bleeding matches 20 run function tide_redemption:boss/skill/memory_torrent_bleeding/armor_image/armor_kill

execute if score #user memory_torrent_bleeding matches 20 run function tide_redemption:boss/skill/memory_torrent_bleeding/armor_image/armor_spawn
execute if score #user memory_torrent_bleeding matches 20..40 run function tide_redemption:boss/skill/memory_torrent_bleeding/armor_image/armor_tp_orange
execute if score #user memory_torrent_bleeding matches 40 run function tide_redemption:boss/skill/memory_torrent_bleeding/armor_image/armor_kill

execute if score #user memory_torrent_bleeding matches 40 run function tide_redemption:boss/skill/memory_torrent_bleeding/armor_image/armor_spawn
execute if score #user memory_torrent_bleeding matches 40..60 run function tide_redemption:boss/skill/memory_torrent_bleeding/armor_image/armor_tp_orange
execute if score #user memory_torrent_bleeding matches 60 run function tide_redemption:boss/skill/memory_torrent_bleeding/armor_image/armor_kill

execute if score #user memory_torrent_bleeding matches 60 run function tide_redemption:boss/skill/memory_torrent_bleeding/armor_image/armor_spawn
execute if score #user memory_torrent_bleeding matches 60..80 run function tide_redemption:boss/skill/memory_torrent_bleeding/armor_image/armor_tp_red
execute if score #user memory_torrent_bleeding matches 80 run function tide_redemption:boss/skill/memory_torrent_bleeding/armor_image/armor_kill

execute if score #user memory_torrent_bleeding matches 80 run function tide_redemption:boss/skill/memory_torrent_bleeding/check
execute if score #user memory_torrent_bleeding matches 81 run bossbar remove memory_torrent_bleeding
execute if score #user memory_torrent_bleeding matches 81 run function tide_redemption:boss/skill/memory_torrent_bleeding/end
