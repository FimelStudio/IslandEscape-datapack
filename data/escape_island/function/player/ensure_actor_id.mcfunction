# 稳定玩家编号用于临时实体归属；不与每局临时状态一起归零。
execute if score @s ie.actor matches 1.. run return 0
execute unless score $allocator ie.actor matches 0.. run scoreboard players set $allocator ie.actor 0
scoreboard players add $allocator ie.actor 1
scoreboard players operation @s ie.actor = $allocator ie.actor
