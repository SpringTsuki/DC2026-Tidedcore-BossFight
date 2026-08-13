tellraw @a {"translate":"game.boss_fight.success_extra.1"}
tellraw @a {"translate":"game.boss_fight.success_extra.2"}

# 播放龙死亡音效
execute as @a at @s run playsound minecraft:entity.ender_dragon.death master @s ~ ~ ~ 0.2

# 执行各个技能结束
function tide_redemption:boss_extra/boss_fight_end