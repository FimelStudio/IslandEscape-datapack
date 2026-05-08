kill @e[tag=range.target]
function escape_island:range/targets/static_target
function escape_island:range/targets/moving_target
function escape_island:range/targets/reaction_target
function escape_island:range/targets/sequence_targets
tellraw @a[tag=range.active] {"text":"[训练场] 靶标已重置。","color":"aqua"}
