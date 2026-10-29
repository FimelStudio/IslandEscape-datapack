tag @a[tag=ie.participant] remove mvp.survivor
scoreboard players set $mvp_survivor mvp_score 0
execute as @a[tag=ie.participant,tag=team.human] if score @s mvp_score > $mvp_survivor mvp_score run scoreboard players operation $mvp_survivor mvp_score = @s mvp_score
execute as @a[tag=ie.participant,tag=team.human] if score @s mvp_score = $mvp_survivor mvp_score if score @s mvp_score matches 1.. run tag @s add mvp.survivor
