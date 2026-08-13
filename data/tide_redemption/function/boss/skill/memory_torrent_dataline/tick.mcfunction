# 技能BOSS BAR轴
scoreboard players add #user memory_torrent_dataline 1
# 技能时间轴
scoreboard players add #user memory_torrent_dataline.timeline 1
# 技能组读条
execute store result bossbar minecraft:memory_torrent_dataline value run scoreboard players get #user memory_torrent_dataline

execute if score #user memory_torrent_dataline.timeline matches 1 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/miniboss_spawn
execute if score #user memory_torrent_dataline.timeline matches 1 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/aoe_orange

execute if score #user memory_torrent_dataline.timeline matches 20 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/aoe_orange
execute if score #user memory_torrent_dataline.timeline matches 40 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/aoe_orange
execute if score #user memory_torrent_dataline.timeline matches 60 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/aoe_orange
execute if score #user memory_torrent_dataline.timeline matches 80 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/aoe_orange
execute if score #user memory_torrent_dataline.timeline matches 100 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/aoe_orange
execute if score #user memory_torrent_dataline.timeline matches 120 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/aoe_orange
execute if score #user memory_torrent_dataline.timeline matches 140 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/aoe_orange
execute if score #user memory_torrent_dataline.timeline matches 160 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/aoe_orange

execute if score #user memory_torrent_dataline.timeline matches 180 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/aoe_red
execute if score #user memory_torrent_dataline.timeline matches 180 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/miniboss_damage

execute if score #user memory_torrent_dataline.timeline matches 200 run bossbar remove memory_torrent_dataline

execute if score #user memory_torrent_dataline.timeline matches 200 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/miniboss_move
execute if score #user memory_torrent_dataline.timeline matches 200 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/aoe_red
execute if score #user memory_torrent_dataline.timeline matches 200 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/miniboss_damage

execute if score #user memory_torrent_dataline.timeline matches 220 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/miniboss_move
execute if score #user memory_torrent_dataline.timeline matches 220 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/aoe_red
execute if score #user memory_torrent_dataline.timeline matches 220 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/miniboss_damage

execute if score #user memory_torrent_dataline.timeline matches 240 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/miniboss_move
execute if score #user memory_torrent_dataline.timeline matches 240 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/aoe_red
execute if score #user memory_torrent_dataline.timeline matches 240 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/miniboss_damage

execute if score #user memory_torrent_dataline.timeline matches 260 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/miniboss_move
execute if score #user memory_torrent_dataline.timeline matches 260 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/aoe_red
execute if score #user memory_torrent_dataline.timeline matches 260 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/miniboss_damage

execute if score #user memory_torrent_dataline.timeline matches 280 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/miniboss_move
execute if score #user memory_torrent_dataline.timeline matches 280 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/aoe_red
execute if score #user memory_torrent_dataline.timeline matches 280 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/miniboss_damage

execute if score #user memory_torrent_dataline.timeline matches 300 run kill @e[tag=distant_1]
execute if score #user memory_torrent_dataline.timeline matches 300 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/miniboss_move
execute if score #user memory_torrent_dataline.timeline matches 300 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/aoe_red
execute if score #user memory_torrent_dataline.timeline matches 300 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/miniboss_damage

execute if score #user memory_torrent_dataline.timeline matches 320 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/miniboss_move
execute if score #user memory_torrent_dataline.timeline matches 320 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/aoe_red
execute if score #user memory_torrent_dataline.timeline matches 320 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/miniboss_damage

execute if score #user memory_torrent_dataline.timeline matches 340 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/miniboss_move
execute if score #user memory_torrent_dataline.timeline matches 340 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/aoe_red
execute if score #user memory_torrent_dataline.timeline matches 340 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/miniboss_damage

execute if score #user memory_torrent_dataline.timeline matches 360 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/miniboss_move
execute if score #user memory_torrent_dataline.timeline matches 360 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/aoe_red
execute if score #user memory_torrent_dataline.timeline matches 360 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/miniboss_damage

execute if score #user memory_torrent_dataline.timeline matches 380 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/miniboss_move
execute if score #user memory_torrent_dataline.timeline matches 380 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/aoe_red
execute if score #user memory_torrent_dataline.timeline matches 380 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/miniboss_damage

execute if score #user memory_torrent_dataline.timeline matches 400 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/miniboss_move
execute if score #user memory_torrent_dataline.timeline matches 400 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/aoe_red
execute if score #user memory_torrent_dataline.timeline matches 400 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/miniboss_damage

execute if score #user memory_torrent_dataline.timeline matches 420 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/miniboss_move
execute if score #user memory_torrent_dataline.timeline matches 420 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/aoe_red
execute if score #user memory_torrent_dataline.timeline matches 420 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/miniboss_damage

execute if score #user memory_torrent_dataline.timeline matches 440 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/miniboss_move
execute if score #user memory_torrent_dataline.timeline matches 440 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/aoe_red
execute if score #user memory_torrent_dataline.timeline matches 440 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/miniboss_damage

execute if score #user memory_torrent_dataline.timeline matches 460 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/miniboss_move
execute if score #user memory_torrent_dataline.timeline matches 460 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/aoe_red
execute if score #user memory_torrent_dataline.timeline matches 460 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/miniboss_damage

execute if score #user memory_torrent_dataline.timeline matches 480 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/miniboss_move
execute if score #user memory_torrent_dataline.timeline matches 480 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/aoe_red
execute if score #user memory_torrent_dataline.timeline matches 480 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/miniboss_damage

execute if score #user memory_torrent_dataline.timeline matches 500 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/miniboss_move
execute if score #user memory_torrent_dataline.timeline matches 500 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/aoe_red
execute if score #user memory_torrent_dataline.timeline matches 500 run function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/miniboss_damage

execute if score #user memory_torrent_dataline.timeline matches 1..500 run function tide_redemption:boss/boss_tp
execute if score #user memory_torrent_dataline.timeline matches 500 run function tide_redemption:boss/skill/memory_torrent_dataline/end

