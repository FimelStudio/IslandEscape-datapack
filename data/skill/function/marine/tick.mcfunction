function skill:marine/suppress/tick
function skill:marine/gun_mastery/tick
execute if score $tick ie.hygiene matches 0 as @a[tag=ie.active,tag=!role.marine] run function skill:marine/cleanup_non_marine
