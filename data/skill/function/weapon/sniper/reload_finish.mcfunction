tag @s remove skill.sniper.reloading
scoreboard players set @s skill.sniper_reload 0
scoreboard players operation #before skill.sniper_cd = @s skill.sniper_mag
function skill:weapon/sniper/reload_load_one
function skill:weapon/sniper/reload_load_one
function skill:weapon/sniper/reload_load_one
function skill:weapon/sniper/reload_load_one
function skill:weapon/sniper/reload_load_one
execute if score @s skill.sniper_mag = #before skill.sniper_cd run title @s actionbar {"text":"没有狙击弹","color":"red"}
execute unless score @s skill.sniper_mag = #before skill.sniper_cd run title @s actionbar [{"text":"SP-1 换弹完成 [","color":"aqua"},{"score":{"name":"@s","objective":"skill.sniper_mag"}},{"text":"/5]","color":"aqua"}]
execute unless score @s skill.sniper_mag = #before skill.sniper_cd run playsound minecraft:item.spyglass.stop_using player @s ~ ~ ~ 0.8 1.2
