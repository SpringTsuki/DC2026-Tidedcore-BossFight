function tide_redemption:boss_extra/skill/memory_shadow/phantom/end
function tide_redemption:boss_extra/skill/memory_shadow/copy/end
function tide_redemption:boss_extra/skill/memory_shadow/paste/end

scoreboard objectives remove memory_shadow_timeline

tag @a remove memory_shadow_a
tag @a remove memory_shadow_b
tag @a remove memory_shadow_c
tag @a remove memory_shadow_d

tag @a remove memory_shadow_cut_1
tag @a remove memory_shadow_cut_2
tag @a remove memory_shadow_cut_3
tag @a remove memory_shadow_cut_4

tag @a remove memory_shadow_module_1
tag @a remove memory_shadow_module_2
tag @a remove memory_shadow_module_3
tag @a remove memory_shadow_module_4

tag @a remove memory_shadow_time_1
tag @a remove memory_shadow_time_2
tag @a remove memory_shadow_time_3
tag @a remove memory_shadow_time_4

kill @e[tag=memory_shadow_cut,type=!player]
kill @e[tag=memory_shadow_module,type=!player]

kill @e[tag=memory_shadow_cut_1,type=!player]
kill @e[tag=memory_shadow_cut_2,type=!player]
kill @e[tag=memory_shadow_cut_3,type=!player]
kill @e[tag=memory_shadow_cut_4,type=!player]

kill @e[tag=memory_shadow_module_1,type=!player]
kill @e[tag=memory_shadow_module_2,type=!player]
kill @e[tag=memory_shadow_module_3,type=!player]
kill @e[tag=memory_shadow_module_4,type=!player]

kill @e[tag=memory_shadow_armor,type=!player]
kill @e[tag=memory_shadow_dust]