execute as @a[tag=state.disguise_scanning,tag=state.disguised,scores={ie.scan_left=0}] run function escape_island:game/end_disguise
tag @a remove state.disguise_scanning
