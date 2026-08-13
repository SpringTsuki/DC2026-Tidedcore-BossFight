function tide_redemption:boss/boss_tp_ground
function tide_redemption:boss/skill/memory_torrent_dataline/miniboss/miniboss_spawn

# 添加BOSS BAR
bossbar add minecraft:memory_torrent_dataline {"color":"yellow","text":"「记忆洪流 · 数据流」| 「Memory Torrent · Dataline」"}
bossbar set minecraft:memory_torrent_dataline color red
bossbar set minecraft:memory_torrent_dataline max 160
bossbar set minecraft:memory_torrent_dataline players @a

# 添加此技能计分板
scoreboard objectives add memory_torrent_dataline trigger
scoreboard players set #user memory_torrent_dataline 0

scoreboard objectives add memory_torrent_dataline.timeline trigger
scoreboard players set #user memory_torrent_dataline.timeline 0