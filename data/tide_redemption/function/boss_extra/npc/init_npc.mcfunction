kill @e[tag=tided_npc_bossextra,tag=tided_npc]

# 初始化对话计分板
scoreboard objectives add tided_npc_bossextra_chat trigger
scoreboard objectives add tided_npc_bossextra_trigger trigger

# 召唤异国的诗人
summon minecraft:armor_stand 924.5 102 2091 {Tags:[tided_npc,tided_npc_bossextra],ArmorItems:[{id:"minecraft:leather_boots"},{id:"minecraft:leather_leggings"},{id:"minecraft:leather_chestplate"},{id:"minecraft:player_head",components:{profile:SpringAurora}}],Invisible:true,DisabledSlots:16191,CustomName:'{"translate":"game.boss.extra.npc"}',CustomNameVisible:true}