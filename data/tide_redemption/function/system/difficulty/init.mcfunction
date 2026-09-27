scoreboard objectives add difficulty_boss trigger

execute unless score #user difficulty_boss matches 1..2 run tellraw @a {"text": "System：请选择游玩难度", "color": "aqua"}
execute if score #user difficulty_boss matches 1 run function tide_redemption:system/inventory/normal
execute if score #user difficulty_boss matches 2 run function tide_redemption:system/inventory/hard
execute if score #user difficulty_boss matches 1 run function tide_redemption:boss/boss_fight
execute if score #user difficulty_boss matches 2 run function tide_redemption:boss_extra/boss_fight_start

scoreboard players set #user difficulty_boss 0
