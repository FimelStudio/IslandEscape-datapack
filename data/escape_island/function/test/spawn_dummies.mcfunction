# escape_island:test/spawn_dummies  —  spawn dummy armor stands for skill testing
execute at @s run summon minecraft:armor_stand ~3 ~ ~0 {Tags:["test.dummy","role.survivor"],CustomName:{"text":"测试人偶(幸存者)"},CustomNameVisible:1b}
execute at @s run summon minecraft:armor_stand ~-3 ~ ~0 {Tags:["test.dummy","role.infected"],CustomName:{"text":"测试人偶(感染者)"},CustomNameVisible:1b}
execute at @s run summon minecraft:armor_stand ~0 ~ ~3 {Tags:["test.dummy","role.mother"],CustomName:{"text":"测试人偶(母体)"},CustomNameVisible:1b}
