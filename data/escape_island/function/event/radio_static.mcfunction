tellraw @a {"text":"§k▓▒░ 信号干扰中 ░▒▓","color":"gray","obfuscated":true}
playsound minecraft:block.note_block.pling master @a ~ ~ ~ 0.3 0.3
title @a times 5 20 5
title @a title {"text":"§k███████","color":"gray"}
title @a subtitle {"text":"§7信号干扰……","color":"gray","italic":true}
schedule function escape_island:event/_static_end 600t
