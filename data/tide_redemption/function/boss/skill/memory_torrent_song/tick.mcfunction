scoreboard players add #user memory_torrent_song.timeline 1

# 让盔甲架自行执行旋转并生成塔的粒子效果
execute as @e[tag=torrent_song_tower] at @s run tp @s ~ ~ ~ ~10 ~
function tide_redemption:boss/skill/memory_torrent_song/color

# 音符需要每一格走0.05高度
execute as @e[tag=torrent_song_note] at @s run tp @s ~ ~-0.05 ~
# 生成音符
execute as @e[tag=torrent_song_note] at @s positioned ^ ^0.0625 ^ run function tide_redemption:boss/lib/dust/dust_note

# 时间轴

# 技能读条
execute store result bossbar minecraft:memory_torrent_song value run scoreboard players get #user memory_torrent_song.timeline

execute if score #user memory_torrent_song.timeline matches 160 run function tide_redemption:boss/skill/memory_torrent_song/check
execute if score #user memory_torrent_song.timeline matches 161 run function tide_redemption:boss/skill/memory_torrent_song/end

execute if score #user memory_torrent_song.timeline matches 1..161 run function tide_redemption:boss/boss_tp_ground