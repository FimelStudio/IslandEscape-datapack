execute as @e[tag=range.target.moving] at @s run tp @s ~0.08 ~ ~
execute as @a[tag=range.active] run title @s actionbar [{"text":"训练场 得分 ","color":"aqua"},{"score":{"name":"@s","objective":"range_score"}},{"text":" 连击 "},{"score":{"name":"@s","objective":"range_combo"}}]
