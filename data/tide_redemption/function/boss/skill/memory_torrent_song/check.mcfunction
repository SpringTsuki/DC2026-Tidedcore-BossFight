# 分别将踩塔范围内的玩家数量分别导入计分板
execute store result score #player_number memory_torrent_song_tower_A run execute as @e[tag=torrent_song_A] at @s if entity @a[distance=..2]
execute store result score #player_number memory_torrent_song_tower_B run execute as @e[tag=torrent_song_B] at @s if entity @a[distance=..2]
execute store result score #player_number memory_torrent_song_tower_C run execute as @e[tag=torrent_song_C] at @s if entity @a[distance=..2]
execute store result score #player_number memory_torrent_song_tower_D run execute as @e[tag=torrent_song_D] at @s if entity @a[distance=..2]

# 若玩家数量大于1，则该玩家承受低伤害
execute as @e[tag=torrent_song_A] at @s if score #player_number memory_torrent_song_tower_A matches 1.. run effect give @a[distance=..2] minecraft:instant_damage 1 0
execute as @e[tag=torrent_song_B] at @s if score #player_number memory_torrent_song_tower_B matches 1.. run effect give @a[distance=..2] minecraft:instant_damage 1 0
execute as @e[tag=torrent_song_C] at @s if score #player_number memory_torrent_song_tower_C matches 1.. run effect give @a[distance=..2] minecraft:instant_damage 1 0
execute as @e[tag=torrent_song_D] at @s if score #player_number memory_torrent_song_tower_D matches 1.. run effect give @a[distance=..2] minecraft:instant_damage 1 0

# 如果其中一塔内无人则全员受到致死级伤害
execute as @e[tag=torrent_song_A] at @s unless score #player_number memory_torrent_song_tower_A matches 1.. run effect give @a[distance=..30] minecraft:instant_damage 1 5
execute as @e[tag=torrent_song_B] at @s unless score #player_number memory_torrent_song_tower_B matches 1.. run effect give @a[distance=..30] minecraft:instant_damage 1 5
execute as @e[tag=torrent_song_C] at @s unless score #player_number memory_torrent_song_tower_C matches 1.. run effect give @a[distance=..30] minecraft:instant_damage 1 5
execute as @e[tag=torrent_song_D] at @s unless score #player_number memory_torrent_song_tower_D matches 1.. run effect give @a[distance=..30] minecraft:instant_damage 1 5
