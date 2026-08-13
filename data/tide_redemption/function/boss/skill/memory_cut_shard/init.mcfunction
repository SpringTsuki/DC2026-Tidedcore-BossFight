tag @a remove memory_cut_shard_A
tag @a remove memory_cut_shard_B
tag @a remove memory_cut_shard_C
tag @a remove memory_cut_shard_D

# 添加技能时间轴
scoreboard objectives add memory_cut_shard trigger

# 添加伤害判定计分板
scoreboard objectives add memory_cut_shard_A trigger
scoreboard objectives add memory_cut_shard_B trigger
scoreboard objectives add memory_cut_shard_C trigger
scoreboard objectives add memory_cut_shard_D trigger

# 添加BOSS BAR
bossbar add minecraft:memory_cut_shard {"color":"yellow","text":"「记忆分割 · 碎片化」| 「Memory Cut · Shard」"}
bossbar set minecraft:memory_cut_shard color red
bossbar set minecraft:memory_cut_shard max 140
bossbar set minecraft:memory_cut_shard players @a

# 选择四位需要进行分散伤害的玩家
execute as @r[x=-11,y=60,z=-11,dx=22,dy=7,dz=22] at @s run tag @s add memory_cut_shard_A
execute as @r[x=-11,y=60,z=-11,dx=22,dy=7,dz=22,tag=!memory_cut_shard_A] at @s run tag @s add memory_cut_shard_B
execute as @r[x=-11,y=60,z=-11,dx=22,dy=7,dz=22,tag=!memory_cut_shard_A,tag=!memory_cut_shard_B] at @s run tag @s add memory_cut_shard_C
execute as @r[x=-11,y=60,z=-11,dx=22,dy=7,dz=22,tag=!memory_cut_shard_A,tag=!memory_cut_shard_B,tag=!memory_cut_shard_C] at @s run tag @s add memory_cut_shard_D

# 添加旋转粒子特效
execute as @e[tag=memory_cut_shard_A] at @s run summon armor_stand ~ ~3 ~ {Tags:[memory_cut_shard.armor_dustA,memory_cut_shard.armor_dust],Invisible:true,NoGravity:true}
execute as @e[tag=memory_cut_shard_B] at @s run summon armor_stand ~ ~3 ~ {Tags:[memory_cut_shard.armor_dustB,memory_cut_shard.armor_dust],Invisible:true,NoGravity:true}
execute as @e[tag=memory_cut_shard_C] at @s run summon armor_stand ~ ~3 ~ {Tags:[memory_cut_shard.armor_dustC,memory_cut_shard.armor_dust],Invisible:true,NoGravity:true}
execute as @e[tag=memory_cut_shard_D] at @s run summon armor_stand ~ ~3 ~ {Tags:[memory_cut_shard.armor_dustD,memory_cut_shard.armor_dust],Invisible:true,NoGravity:true}
