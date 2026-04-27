# 病毒学家被动: 8格内母体/感染者可见粒子
# Context: @s = virologist

# 5–8格: 偶发金色微粒 at mother's position
execute as @a[tag=role.mother,tag=!state.disguised,distance=5..8] at @s run particle minecraft:dust{color:[1.0,0.84,0.0],scale:0.5} ~ ~1 ~ 0 0 0 0 5 force @s

# 1–4格: 持续金色粒子 + 低频嗡鸣
execute as @a[tag=role.mother,tag=!state.disguised,distance=..4] at @s run particle minecraft:dust{color:[1.0,0.84,0.0],scale:1.0} ~ ~1 ~ 0 0 0 0 12 force @s
execute if entity @a[tag=role.mother,tag=!state.disguised,distance=..4] run playsound minecraft:block.beacon.ambient player @s ~ ~ ~ 0.3 0.5
