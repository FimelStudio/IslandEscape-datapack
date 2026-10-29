scoreboard players set $blackout ie.event 1
effect give @a[tag=ie.active] minecraft:darkness 2 0 true
tellraw @a {"text":"§8[事件] 断电！全岛陷入黑暗 60 秒。","color":"dark_gray"}
playsound minecraft:block.beacon.deactivate master @a ~ ~ ~ 1 0.5
schedule function escape_island:event/_blackout_end 1200t
