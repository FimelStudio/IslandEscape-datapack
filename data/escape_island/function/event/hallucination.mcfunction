# 幻觉事件: 随机玩家看到假阴影（名牌闪烁）
execute as @r[tag=role.survivor,limit=1] run effect give @s minecraft:nausea 10 0 true
execute as @r[tag=role.survivor,limit=1] run title @s actionbar {"text":"§4你看到什么了……","italic":true}
