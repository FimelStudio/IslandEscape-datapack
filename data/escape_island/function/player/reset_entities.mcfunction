# 仅清理 @s 创建的设备，避免单人训练退出删除其他人的实体。
function escape_island:player/ensure_actor_id
scoreboard players operation $owner ie.actor = @s ie.actor
execute as @e[tag=ie.owned] if score @s ie.owner = $owner ie.actor run kill @s
