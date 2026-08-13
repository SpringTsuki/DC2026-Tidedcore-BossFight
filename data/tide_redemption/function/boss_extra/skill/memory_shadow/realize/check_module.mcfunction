# 创建检查计分板
scoreboard objectives add memory_shadow_module trigger

# 分别将分摊范围内的玩家数量导入计分板
execute store result score #player_number memory_shadow_module run execute if entity @a[distance=..2]

# 若玩家数量大于1，则为低伤害，否则分摊玩家收到致死级伤害
execute if score #player_number memory_shadow_module matches 1.. run effect give @a[distance=..3] minecraft:instant_damage 1 0
execute unless score #player_number memory_shadow_module matches 1.. run effect give @a[x=-11,y=60,z=-11,dx=22,dy=7,dz=22] minecraft:instant_damage 1 5

# 回收检查计分板
scoreboard objectives remove memory_shadow_module