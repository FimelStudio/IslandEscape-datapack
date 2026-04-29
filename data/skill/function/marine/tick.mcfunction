function skill:marine/suppress/tick
function skill:marine/gun_mastery/tick
execute as @a[tag=!marine] run function skill:marine/cleanup_non_marine
