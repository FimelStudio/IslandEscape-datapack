execute as @a[tag=state.disguise_scanning,tag=state.disguised] run function escape_island:game/end_disguise
tag @a remove state.disguise_scanning
