advancement revoke @s only skill:radio/sweep
execute if score @s cd_radio matches 1.. run return 0

scoreboard players set @s cd_radio 120
effect give @a[tag=role.survivor] minecraft:glowing 5 0 true
effect give @a[tag=role.mother,tag=state.disguised] minecraft:glowing 5 0 true
playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 1.5
tellraw @a {"text":"§3[通讯员] 信号扫描启动——所有幸存者信号已锁定 5 秒。","color":"aqua"}
