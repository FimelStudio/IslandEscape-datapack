execute as @a[tag=role.survivor] if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{item:"sub_pass"}] at @s if entity @e[tag=marker.lab_sub,distance=..5] run function escape_island:escape/boarding_check
function escape_island:util/recount_escaped
function escape_island:game/end_lab
