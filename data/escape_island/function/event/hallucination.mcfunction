tellraw @a {"text":"§5[事件] 你看到了不该存在的东西……","color":"dark_purple","italic":true}
playsound minecraft:entity.warden.nearby_close master @a ~ ~ ~ 0.4 0.3
execute as @r[tag=team.human] run effect give @s minecraft:nausea 8 0 true
execute as @r[tag=team.human] run title @s actionbar {"text":"§4有什么东西在看着你……","italic":true}
execute at @r[tag=team.human] run particle minecraft:dust{color:[0.5,0.0,0.5],scale:4} ~ ~2 ~ 2 1 2 0.02 20 force @a
