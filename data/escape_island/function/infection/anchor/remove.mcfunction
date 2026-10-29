# @s 是玩家；只清理自己的倒地或死亡锚点。
scoreboard players operation $anchor_owner ie.actor = @s ie.actor
$execute as @e[type=minecraft:marker,tag=entity.$(kind)_anchor] if score @s ie.owner = $anchor_owner ie.actor run kill @s
