# @s 是玩家；kind 为 downed 或 dead，按实体归属而不是距离锁定位置。
scoreboard players operation $anchor_owner ie.actor = @s ie.actor
$execute as @e[type=minecraft:marker,tag=entity.$(kind)_anchor] if score @s ie.owner = $anchor_owner ie.actor at @s as @a[tag=ie.active] if score @s ie.actor = $anchor_owner ie.actor run tp @s ~ ~ ~
