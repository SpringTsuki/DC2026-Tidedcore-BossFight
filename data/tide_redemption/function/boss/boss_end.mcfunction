kill @a[x=-11,y=60,z=-11,dx=22,dy=7,dz=22]

tellraw @a {"translate":"game.boss_fight.failed.end"}
tellraw @a {"translate":"game.boss_fight.failed.1"}

function tide_redemption:boss/boss_fight_end