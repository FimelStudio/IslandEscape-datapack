scoreboard players set @s skill.shotgun_reload 0
scoreboard players set @s skill.shotgun_cd 0
tag @s remove skill.shotgun.reloading
scoreboard players operation #shotgun_before skill.shotgun_cd = @s skill.shotgun_mag
function skill:weapon/shotgun/reload_load_one
function skill:weapon/shotgun/reload_load_one
function skill:weapon/shotgun/reload_load_one
function skill:weapon/shotgun/reload_load_one
function skill:weapon/shotgun/reload_load_one
function skill:weapon/shotgun/reload_load_one
execute if score @s skill.shotgun_mag = #shotgun_before skill.shotgun_cd run title @s actionbar {"text":"没有 9mm 弹药","color":"red"}
execute unless score @s skill.shotgun_mag = #shotgun_before skill.shotgun_cd run title @s actionbar [{"text":"SG-5 装填完成 [","color":"gold"},{"score":{"name":"@s","objective":"skill.shotgun_mag"}},{"text":"/6]","color":"gold"}]
execute unless score @s skill.shotgun_mag = #shotgun_before skill.shotgun_cd run playsound minecraft:item.crossbow.loading_end player @s ~ ~ ~ 0.8 1.2
