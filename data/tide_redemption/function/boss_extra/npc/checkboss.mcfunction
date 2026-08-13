execute if score #user bossfight_tidedcore matches 1 run tellraw @a {"translate": "game.boss.extra.npc.startcheck"}
execute if score #user bossfight_tidedcore matches 1 run return 0
execute if score #user bossfight_extra_tidedcore matches 1 run tellraw @a {"translate": "game.boss.extra.npc.startcheck"}
execute if score #user bossfight_extra_tidedcore matches 1 run return 0

function tide_redemption:boss_extra/boss_fight_start