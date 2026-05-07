function skill:radio/signal_scan/tick
function skill:radio/jam/tick
execute as @a[tag=role.radio] at @s run function skill:radio/inspect/tick
execute as @a[tag=!role.radio] run function skill:radio/cleanup_non_radio
