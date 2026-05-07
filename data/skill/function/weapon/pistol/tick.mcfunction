kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:paper",components:{"minecraft:custom_data":{weapon:"pistol_used"}}}}]
execute as @a[tag=skill.pistol.update] run function skill:weapon/pistol/update_item_sync
tag @a remove skill.pistol.update
tag @a remove skill.pistol.holding
execute as @a if items entity @s weapon.mainhand minecraft:sugar[minecraft:custom_data~{weapon:"pistol"}] run tag @s add skill.pistol.holding

execute as @a[tag=skill.pistol.reloading,tag=!skill.pistol.holding] run title @s actionbar {"text":"换弹中断","color":"red"}
execute as @a[tag=skill.pistol.reloading,tag=!skill.pistol.holding] run tag @s remove skill.pistol.reloading
execute as @a[tag=!skill.pistol.holding] run scoreboard players set @s skill.pistol_reload 0

execute as @a[tag=skill.pistol.holding,tag=!skill.pistol.reloading] if items entity @s weapon.mainhand minecraft:sugar[minecraft:custom_data~{weapon:"pistol",reloading:1b}] run function skill:weapon/pistol/update_item

scoreboard players remove @a[scores={skill.pistol_fire_cd=1..}] skill.pistol_fire_cd 1
scoreboard players remove @a[tag=skill.pistol.reloading,scores={skill.pistol_reload=1..}] skill.pistol_reload 1

execute as @a[tag=skill.pistol.reloading,scores={skill.pistol_reload=0}] run function skill:weapon/pistol/reload_finish

execute as @a[scores={skill.pistol_swap=1..}] run function skill:weapon/pistol/swap_reload
execute as @a unless entity @s[tag=skill.pistol.reloading] if items entity @s weapon.offhand minecraft:sugar[minecraft:custom_data~{weapon:"pistol"}] run function skill:weapon/pistol/swap_reload

execute as @a[tag=skill.pistol.holding,tag=!skill.pistol.update] run function skill:weapon/pistol/sync_held
execute as @a[tag=skill.pistol.holding] run function skill:weapon/pistol/render_xp
execute as @a[tag=!skill.pistol.holding,tag=skill.pistol.xp] run function skill:weapon/pistol/clear_xp

execute as @a[tag=skill.pistol.reloading] run scoreboard players operation @s skill.pistol_reload_sec = @s skill.pistol_reload
execute as @a[tag=skill.pistol.reloading] run scoreboard players operation @s skill.pistol_reload_sec += #reload_round skill.pistol_tmp
execute as @a[tag=skill.pistol.reloading] run scoreboard players operation @s skill.pistol_reload_sec /= #twenty skill.pistol_tmp
execute as @a[tag=skill.pistol.reloading] run title @s actionbar [{"text":"换弹中 ","color":"yellow"},{"score":{"name":"@s","objective":"skill.pistol_reload_sec"}},{"text":"s","color":"dark_gray"}]
