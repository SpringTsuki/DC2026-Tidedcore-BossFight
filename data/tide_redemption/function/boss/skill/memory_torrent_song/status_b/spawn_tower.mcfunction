# 此为斜点塔的生成
# 6 60 8
# -8 60 0
# 0 60 -8
# 8 60 0

# 音符特效生成
# 6 68 8
# -8 68 0
# 943 155 2025
# 943 155 2037

summon armor_stand 6 60 8 {Tags:[torrent_song_A,torrent_song,torrent_song_tower],Invisible:true}
summon armor_stand -8 60 0 {Tags:[torrent_song_B,torrent_song,torrent_song_tower],Invisible:true}
summon armor_stand 0 60 -8 {Tags:[torrent_song_C,torrent_song,torrent_song_tower],Invisible:true}
summon armor_stand 8 60 0 {Tags:[torrent_song_D,torrent_song,torrent_song_tower],Invisible:true}

summon armor_stand 6 68 8 {Tags:[torrent_song_note,torrent_song],Invisible:true}
summon armor_stand -8 68 0 {Tags:[torrent_song_note,torrent_song],Invisible:true}
summon armor_stand 0 68 -8 {Tags:[torrent_song_note,torrent_song],Invisible:true}
summon armor_stand 8 68 0 {Tags:[torrent_song_note,torrent_song],Invisible:true}