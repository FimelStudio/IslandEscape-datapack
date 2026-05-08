scoreboard players set $mvp mvp_score 0
tag @a remove mvp.global
execute as @a if score @s mvp_score > $mvp mvp_score run scoreboard players operation $mvp mvp_score = @s mvp_score
execute as @a if score @s mvp_score = $mvp mvp_score if score @s mvp_score matches 1.. run tag @s add mvp.global
tellraw @a [{"text":"[MVP] ","color":"gold","bold":true},{"selector":"@a[tag=mvp.global,limit=1]"},{"text":" 本局综合贡献最高。","color":"gold"}]
