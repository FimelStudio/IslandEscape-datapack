# 8-second scan passed — disguise succeeded, trigger ending 5
execute as @a[tag=state.disguise_scanning,tag=state.disguised] run function escape_island:game/end_disguise
# If disguise was broken during scan (virologist), player stays
tag @a remove state.disguise_scanning
