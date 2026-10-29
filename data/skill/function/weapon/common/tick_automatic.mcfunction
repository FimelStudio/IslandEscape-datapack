# 共享手枪与自动步枪的计时、持枪状态和换弹显示；weapon / other 为固定入口参数。
$execute as @a[tag=ie.active,tag=skill.$(weapon).update] run function skill:weapon/$(weapon)/update_item_sync
$tag @a[tag=ie.active] remove skill.$(weapon).update
$tag @a[tag=ie.active] remove skill.$(weapon).holding
$execute as @a[tag=ie.active] if items entity @s weapon.mainhand minecraft:sugar[minecraft:custom_data~{weapon:"$(weapon)"}] run tag @s add skill.$(weapon).holding

$execute as @a[tag=ie.active,tag=skill.$(weapon).reloading,tag=!skill.$(weapon).holding] run title @s actionbar {"text":"换弹中断","color":"red"}
$execute as @a[tag=ie.active,tag=skill.$(weapon).reloading,tag=!skill.$(weapon).holding] run tag @s remove skill.$(weapon).reloading
$execute as @a[tag=ie.active,tag=!skill.$(weapon).holding] run scoreboard players set @s skill.$(weapon)_reload 0

$execute as @a[tag=ie.active,tag=skill.$(weapon).holding,tag=!skill.$(weapon).reloading] if items entity @s weapon.mainhand minecraft:sugar[minecraft:custom_data~{weapon:"$(weapon)",reloading:1b}] run function skill:weapon/$(weapon)/update_item

$scoreboard players remove @a[tag=ie.active,scores={skill.$(weapon)_fire_cd=1..}] skill.$(weapon)_fire_cd 1
$scoreboard players remove @a[tag=ie.active,tag=skill.$(weapon).reloading,scores={skill.$(weapon)_reload=1..}] skill.$(weapon)_reload 1

$execute as @a[tag=ie.active,tag=skill.$(weapon).reloading,scores={skill.$(weapon)_reload=0}] run function skill:weapon/$(weapon)/reload_finish

$execute as @a[tag=ie.active,scores={skill.$(weapon)_swap=1..}] run function skill:weapon/$(weapon)/swap_reload
$execute as @a[tag=ie.active] unless entity @s[tag=skill.$(weapon).reloading] if items entity @s weapon.offhand minecraft:sugar[minecraft:custom_data~{weapon:"$(weapon)"}] run function skill:weapon/$(weapon)/swap_reload

$execute as @a[tag=ie.active,tag=skill.$(weapon).holding,tag=!skill.$(weapon).update] run function skill:weapon/$(weapon)/sync_held
$execute as @a[tag=ie.active,tag=skill.$(weapon).holding] run function skill:weapon/$(weapon)/render_xp
$execute as @a[tag=ie.active,tag=!skill.$(weapon).holding,tag=!skill.$(other).holding,tag=skill.$(weapon).xp] run function skill:weapon/$(weapon)/clear_xp

$execute as @a[tag=ie.active,tag=skill.$(weapon).reloading] run scoreboard players operation @s skill.$(weapon)_reload_cs = @s skill.$(weapon)_reload
$execute as @a[tag=ie.active,tag=skill.$(weapon).reloading] run scoreboard players operation @s skill.$(weapon)_reload_cs *= #five skill.$(weapon)_tmp
$execute as @a[tag=ie.active,tag=skill.$(weapon).reloading] run scoreboard players operation @s skill.$(weapon)_reload_sec = @s skill.$(weapon)_reload_cs
$execute as @a[tag=ie.active,tag=skill.$(weapon).reloading] run scoreboard players operation @s skill.$(weapon)_reload_sec /= #hundred skill.$(weapon)_tmp
$execute as @a[tag=ie.active,tag=skill.$(weapon).reloading] run scoreboard players operation @s skill.$(weapon)_reload_frac = @s skill.$(weapon)_reload_cs
$execute as @a[tag=ie.active,tag=skill.$(weapon).reloading] run scoreboard players operation @s skill.$(weapon)_reload_frac %= #hundred skill.$(weapon)_tmp
$execute as @a[tag=ie.active,tag=skill.$(weapon).reloading,scores={skill.$(weapon)_reload_frac=0}] run title @s actionbar [{"text":"换弹中 ","color":"yellow"},{"score":{"name":"@s","objective":"skill.$(weapon)_reload_sec"}},{"text":".00s","color":"dark_gray"}]
$execute as @a[tag=ie.active,tag=skill.$(weapon).reloading,scores={skill.$(weapon)_reload_frac=1..9}] run title @s actionbar [{"text":"换弹中 ","color":"yellow"},{"score":{"name":"@s","objective":"skill.$(weapon)_reload_sec"}},{"text":".0","color":"dark_gray"},{"score":{"name":"@s","objective":"skill.$(weapon)_reload_frac"}},{"text":"s","color":"dark_gray"}]
$execute as @a[tag=ie.active,tag=skill.$(weapon).reloading,scores={skill.$(weapon)_reload_frac=10..99}] run title @s actionbar [{"text":"换弹中 ","color":"yellow"},{"score":{"name":"@s","objective":"skill.$(weapon)_reload_sec"}},{"text":".","color":"dark_gray"},{"score":{"name":"@s","objective":"skill.$(weapon)_reload_frac"}},{"text":"s","color":"dark_gray"}]
