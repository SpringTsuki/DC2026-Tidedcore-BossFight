function tide_redemption:boss/boss_tp

# 添加技能时间轴
scoreboard objectives add memory_torrent_songplus.timeline trigger
scoreboard players set #user memory_torrent_songplus.timeline 0

# 添加伤害判定计分板
scoreboard objectives add memory_torrent_song_tower_A trigger
scoreboard players set #player_number memory_torrent_song_tower_A 0
scoreboard objectives add memory_torrent_song_tower_B trigger
scoreboard players set #player_number memory_torrent_song_tower_B 0
scoreboard objectives add memory_torrent_song_tower_C trigger
scoreboard players set #player_number memory_torrent_song_tower_C 0
scoreboard objectives add memory_torrent_song_tower_D trigger
scoreboard players set #player_number memory_torrent_song_tower_D 0
scoreboard objectives add memory_torrent_song_tower_E trigger
scoreboard players set #player_number memory_torrent_song_tower_E 0
scoreboard objectives add memory_torrent_song_tower_F trigger
scoreboard players set #player_number memory_torrent_song_tower_F 0
scoreboard objectives add memory_torrent_song_tower_G trigger
scoreboard players set #player_number memory_torrent_song_tower_G 0
scoreboard objectives add memory_torrent_song_tower_H trigger
scoreboard players set #player_number memory_torrent_song_tower_H 0

# 添加BOSS BAR
bossbar add minecraft:memory_torrent_songplus {"color":"yellow","text":"「记忆洪流 · 终末歌」| 「Memory Torrent · EndSong」"}
bossbar set minecraft:memory_torrent_songplus color red
bossbar set minecraft:memory_torrent_songplus max 160
bossbar set minecraft:memory_torrent_songplus players @a

# 随机数判断正点/斜点塔
function tide_redemption:boss_extra/boss_random_2
execute if score #user tidedcore_random matches 1 run function tide_redemption:boss_extra/skill/memory_torrent_songplus/tower/spawn_tower_3
execute if score #user tidedcore_random matches 2 run function tide_redemption:boss_extra/skill/memory_torrent_songplus/tower/spawn_tower_7

function tide_redemption:boss_extra/boss_random_2
execute if score #user tidedcore_random matches 1 run function tide_redemption:boss_extra/skill/memory_torrent_songplus/tower/spawn_tower_4
execute if score #user tidedcore_random matches 2 run function tide_redemption:boss_extra/skill/memory_torrent_songplus/tower/spawn_tower_8

function tide_redemption:boss_extra/boss_random_2
execute if score #user tidedcore_random matches 1 run function tide_redemption:boss_extra/skill/memory_torrent_songplus/tower/spawn_tower_1
execute if score #user tidedcore_random matches 2 run function tide_redemption:boss_extra/skill/memory_torrent_songplus/tower/spawn_tower_5

function tide_redemption:boss_extra/boss_random_2
execute if score #user tidedcore_random matches 1 run function tide_redemption:boss_extra/skill/memory_torrent_songplus/tower/spawn_tower_2
execute if score #user tidedcore_random matches 2 run function tide_redemption:boss_extra/skill/memory_torrent_songplus/tower/spawn_tower_6