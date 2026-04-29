function skill:weapon/pistol/sync_offhand
item replace entity @s weapon.mainhand from entity @s weapon.offhand
item replace entity @s weapon.offhand with minecraft:air
function skill:weapon/pistol/reload_start
