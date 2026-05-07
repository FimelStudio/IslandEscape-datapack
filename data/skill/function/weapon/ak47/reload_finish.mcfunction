tag @s remove skill.ak47.reloading
scoreboard players set @s skill.ak47_reload 0
scoreboard players set @s skill.ak47_reload_sec 0
scoreboard players set @s skill.ak47_reload_cs 0
scoreboard players set @s skill.ak47_reload_frac 0
scoreboard players operation #before skill.ak47_tmp = @s skill.ak47_mag

function skill:weapon/ak47/reload_load_all

execute if score @s skill.ak47_mag = #before skill.ak47_tmp run title @s actionbar {"text":"没有 7.62 弹药","color":"red"}
execute if score @s skill.ak47_mag = #before skill.ak47_tmp run playsound minecraft:block.lever.click player @s ~ ~ ~ 0.5 1.6
execute unless score @s skill.ak47_mag = #before skill.ak47_tmp run title @s actionbar [{"text":"换弹完成: ","color":"green"},{"score":{"name":"@s","objective":"skill.ak47_mag"}},{"text":"/30","color":"green"}]
execute unless score @s skill.ak47_mag = #before skill.ak47_tmp run playsound minecraft:item.crossbow.loading_end player @s ~ ~ ~ 0.8 1.4
function skill:weapon/ak47/update_item
