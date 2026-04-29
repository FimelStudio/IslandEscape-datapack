tag @s remove skill.pistol_reloading
scoreboard players set @s skill.pistol_reload 0
scoreboard players operation #before skill.pistol_tmp = @s skill.pistol_mag

function skill:weapon/pistol/reload_load_one
function skill:weapon/pistol/reload_load_one
function skill:weapon/pistol/reload_load_one
function skill:weapon/pistol/reload_load_one
function skill:weapon/pistol/reload_load_one
function skill:weapon/pistol/reload_load_one
function skill:weapon/pistol/reload_load_one
function skill:weapon/pistol/reload_load_one

execute if score @s skill.pistol_mag = #before skill.pistol_tmp run title @s actionbar {"text":"没有 9mm 弹药","color":"red"}
execute if score @s skill.pistol_mag = #before skill.pistol_tmp run playsound minecraft:block.lever.click player @s ~ ~ ~ 0.5 1.6
execute unless score @s skill.pistol_mag = #before skill.pistol_tmp run title @s actionbar [{"text":"换弹完成: ","color":"green"},{"score":{"name":"@s","objective":"skill.pistol_mag"}},{"text":"/8","color":"green"}]
execute unless score @s skill.pistol_mag = #before skill.pistol_tmp run playsound minecraft:item.crossbow.loading_end player @s ~ ~ ~ 0.8 1.4
function skill:weapon/pistol/update_item
