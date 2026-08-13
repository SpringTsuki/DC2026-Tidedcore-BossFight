# execute as @e[tag=tidedcore] at @s positioned as @a[sort=nearest,limit=1] run tag @a[sort=nearest,limit=1] add memory_torrent_bleeding
# execute as @e[tag=tidedcore] at @s positioned as @a[sort=nearest,limit=1] run effect give @a[sort=nearest,limit=1] instant_damage 1 5

execute as @e[tag=memory_torrent_bleeding.armor_boss] at @s if entity @a[sort=nearest,limit=1] run effect give @a[sort=nearest,limit=1] instant_damage 1 0
execute as @e[tag=memory_torrent_bleeding.armor_boss] at @s if entity @a[sort=nearest,limit=1] run effect give @a[sort=nearest,limit=1] weakness 10 0
execute as @e[tag=memory_torrent_bleeding.armor_boss] at @s if entity @a[sort=nearest,limit=1] if entity @a[tag=memory_torrent_bleeding] run effect give @a[sort=nearest,limit=1] instant_damage 1 5
execute as @e[tag=memory_torrent_bleeding.armor_boss] at @s if entity @a[sort=nearest,limit=1] run tag @a[sort=nearest,limit=1] add memory_torrent_bleeding