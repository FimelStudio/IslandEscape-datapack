function skill:weapon/pistol/tick
function skill:weapon/ak47/tick
function skill:weapon/shotgun/tick
execute as @a[tag=ie.active] if items entity @s weapon.mainhand minecraft:spyglass[minecraft:custom_data~{weapon:"sniper"}] run function skill:weapon/sniper/state_tick
function skill:weapon/sniper/bolt_tick
