# 无线电杂讯: 30s 通讯干扰（假冒扫描提示）
tellraw @a {"text":"§k▓▒░ 信号干扰中 ░▒▓","color":"gray","obfuscated":true}
playsound minecraft:block.note_block.pling master @a ~ ~ ~ 0.3 0.3
schedule function escape_island:event/_static_end 600t
