execute store result score #player_number tidedcore_fight_player run execute if entity @a[x=-11,y=60,z=-11,dx=22,dy=7,dz=22]
execute if score #player_number tidedcore_fight_player matches 0 run function tide_redemption:boss/boss_failed
# 检测场内是否有存活玩家，若没有则Boss战失败