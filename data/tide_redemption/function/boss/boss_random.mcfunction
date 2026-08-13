setblock 0 58 0 minecraft:chest
loot insert 0 58 0 loot tide_redemption:boss/boss_random
execute if data block 0 58 0 {Items:[{Slot:0b,id:"minecraft:coal_block"}]} run scoreboard players set #user tidedcore_random 1
execute if data block 0 58 0 {Items:[{Slot:0b,id:"minecraft:lapis_block"}]} run scoreboard players set #user tidedcore_random 2
data merge block 0 58 0 {Items:[]}
setblock 0 58 0 minecraft:air