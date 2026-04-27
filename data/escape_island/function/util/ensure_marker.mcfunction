execute unless entity @e[tag=marker.spawn_island] run tellraw @a[scores={in_game=0}] {"text":"[警告] 未找到 marker.spawn_island，请放置地图标记。","color":"red"}
execute unless entity @e[tag=marker.signal_tower] run tellraw @a[scores={in_game=0}] {"text":"[警告] 未找到 marker.signal_tower","color":"red"}
execute unless entity @e[tag=marker.heli_pad] run tellraw @a[scores={in_game=0}] {"text":"[警告] 未找到 marker.heli_pad","color":"red"}
execute unless entity @e[tag=marker.spore_spot] run tellraw @a[scores={in_game=0}] {"text":"[警告] 未找到 marker.spore_spot","color":"red"}
