tellraw @a {"text":"§2[事件] 孢子浓度异常！区域孢子爆发。","color":"green"}
playsound minecraft:block.sculk_sensor.clicking master @a ~ ~ ~ 1 0.4
execute at @r[tag=team.human] run particle minecraft:dust{color:[0.0,0.8,0.25],scale:4} ~ ~3 ~ 3 1.5 3 0.01 60 force @a
execute at @r[tag=team.human] as @a[tag=team.human,distance=..5] run function escape_island:infection/add_spore_load {amount:15}
