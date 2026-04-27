# Reagent detected a threat — screen flash + bell (no direction info)
effect give @s minecraft:nausea 1 1 true
playsound minecraft:block.bell.use master @s ~ ~ ~ 1 0.5
title @s actionbar {"text":"§c[ 检测到异常 ]","bold":true}
