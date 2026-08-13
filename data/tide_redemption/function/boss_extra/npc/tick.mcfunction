# 检测玩家距离NPC的距离
execute as @e[tag=tided_npc_bossextra] at @s as @a[distance=..3] run scoreboard players add @s tided_npc_bossextra_chat 1
execute as @e[tag=tided_npc_bossextra] at @s as @a[distance=..3] run scoreboard players enable @s tided_npc_bossextra_trigger
execute as @e[tag=tided_npc_bossextra] at @s as @a[distance=3..] run scoreboard players set @s tided_npc_bossextra_chat 0

# 触发后续对话
execute as @a at @s if score @s tided_npc_bossextra_chat matches 2 run tellraw @s {"translate":"game.boss.extra.npc.chat1"}
execute as @a at @s if score @s tided_npc_bossextra_chat matches 20 run tellraw @s {"text":"","extra":[{"translate":"game.boss.extra.npc.question1"}],"clickEvent":{"action": "run_command","value": "/trigger tided_npc_bossextra_trigger set 1"}}

# 触发后续问题对话
execute as @a at @s if score @s tided_npc_bossextra_trigger matches 1 run tellraw @s {"translate":"game.boss.extra.npc.question1.1"}
execute as @a at @s if score @s tided_npc_bossextra_trigger matches 1 run tellraw @s {"translate":"game.boss.extra.npc.question1.2"}
execute as @a at @s if score @s tided_npc_bossextra_trigger matches 1 run tellraw @s {"translate":"game.boss.extra.npc.question1.3"}
execute as @a at @s if score @s tided_npc_bossextra_trigger matches 1 run tellraw @s {"translate":"game.boss.extra.npc.question1.4"}
execute as @a at @s if score @s tided_npc_bossextra_trigger matches 1 run tellraw @s {"translate":"game.boss.extra.npc.question1.5"}
execute as @a at @s if score @s tided_npc_bossextra_trigger matches 1 run tellraw @s {"translate":"game.boss.extra.npc.question2","clickEvent":{"action": "run_command","value": "/trigger tided_npc_bossextra_trigger set 2"}}

execute as @a at @s if score @s tided_npc_bossextra_trigger matches 2 run tellraw @s {"translate":"game.boss.extra.npc.question2.1"}
execute as @a at @s if score @s tided_npc_bossextra_trigger matches 2 run tellraw @s {"translate":"game.boss.extra.npc.question3","clickEvent":{"action": "run_command","value": "/trigger tided_npc_bossextra_trigger set 3"}}

execute as @a at @s if score @s tided_npc_bossextra_trigger matches 3 run function tide_redemption:boss_extra/npc/checkboss

# 后续对话初始化
execute as @a at @s if score @s tided_npc_bossextra_trigger matches 0.. run scoreboard players set @s tided_npc_bossextra_trigger 0
