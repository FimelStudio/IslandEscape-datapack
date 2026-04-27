# escape_island:infection/_sporify_start  —  player is downed, 15s before turning
execute if entity @s[tag=state.sporifying] run return 0
tag @s add state.sporifying
scoreboard players operation @s sporify_timer = Tunable tunable.death_sporify_seconds

# Incapacitated: lock at the downed spot, adventure mode, zero movement speed, dark screen.
execute at @s run summon minecraft:marker ~ ~ ~ {Tags:["entity.downed_anchor"]}
gamemode adventure @s
attribute @s minecraft:movement_speed base set 0
effect give @s minecraft:slowness 999 127 true
effect give @s minecraft:darkness 999 0 true
effect give @s minecraft:resistance 999 255 true

tellraw @s {"text":"§c你已倒下，身体无法移动。15秒后将转化为感染者……","color":"dark_red"}
title @s title {"text":"§4倒下","bold":true}
title @s subtitle [{"text":"孢化倒计时: ","color":"red"},{"score":{"name":"@s","objective":"sporify_timer"}},{"text":"秒","color":"red"}]
playsound minecraft:entity.warden.heartbeat player @s ~ ~ ~ 1 0.6 1
