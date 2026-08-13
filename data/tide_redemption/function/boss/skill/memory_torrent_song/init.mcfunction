function tide_redemption:boss/boss_tp

# 添加技能时间轴
scoreboard objectives add memory_torrent_song.timeline trigger
scoreboard players set #user memory_torrent_song.timeline 0

# 添加伤害判定计分板
scoreboard objectives add memory_torrent_song_tower_A trigger
scoreboard players set #player_number memory_torrent_song_tower_A 0
scoreboard objectives add memory_torrent_song_tower_B trigger
scoreboard players set #player_number memory_torrent_song_tower_B 0
scoreboard objectives add memory_torrent_song_tower_C trigger
scoreboard players set #player_number memory_torrent_song_tower_C 0
scoreboard objectives add memory_torrent_song_tower_D trigger
scoreboard players set #player_number memory_torrent_song_tower_D 0

# 添加BOSS BAR
bossbar add minecraft:memory_torrent_song {"color":"yellow","text":"「记忆洪流 · 终末曲」| 「Memory Torrent · EndSinger」"}
bossbar set minecraft:memory_torrent_song color red
bossbar set minecraft:memory_torrent_song max 160
bossbar set minecraft:memory_torrent_song players @a

# 随机数判断正点/斜点塔
function tide_redemption:boss/boss_random

execute if score #user tidedcore_random matches 1 run function tide_redemption:boss/skill/memory_torrent_song/status_a/spawn_tower
execute if score #user tidedcore_random matches 2 run function tide_redemption:boss/skill/memory_torrent_song/status_b/spawn_tower