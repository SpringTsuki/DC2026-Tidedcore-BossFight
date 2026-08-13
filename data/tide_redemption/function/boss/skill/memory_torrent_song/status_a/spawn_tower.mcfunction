# 此为正点塔的生成
# 0 60 8 - 南
# -8 60 0 - 西
# 0 60 -8 - 北
# 8 60 0 - 东

# 音符特效生成 - +8
# 0 68 8
# -8 68 0
# 0 68 -8
# 8 68 0

summon armor_stand 0 60 8 {Tags:[torrent_song_A,torrent_song,torrent_song_tower],Invisible:true}
summon armor_stand -8 60 0 {Tags:[torrent_song_B,torrent_song,torrent_song_tower],Invisible:true}
summon armor_stand 0 60 -8 {Tags:[torrent_song_C,torrent_song,torrent_song_tower],Invisible:true}
summon armor_stand 8 60 0 {Tags:[torrent_song_D,torrent_song,torrent_song_tower],Invisible:true}

summon armor_stand 0 68 8 {Tags:[torrent_song_note,torrent_song],Invisible:true}
summon armor_stand -8 68 0 {Tags:[torrent_song_note,torrent_song],Invisible:true}
summon armor_stand 0 68 -8 {Tags:[torrent_song_note,torrent_song],Invisible:true}
summon armor_stand 8 68 0 {Tags:[torrent_song_note,torrent_song],Invisible:true}

