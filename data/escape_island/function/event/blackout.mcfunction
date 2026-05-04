tag @a add event.blackout
effect give @a minecraft:darkness 60 0 true
tellraw @a {"text":"§8[事件] 断电！全岛陷入黑暗 60 秒。","color":"dark_gray"}
playsound minecraft:block.beacon.deactivate master @a ~ ~ ~ 1 0.5
schedule function escape_island:event/_blackout_end 1200t
