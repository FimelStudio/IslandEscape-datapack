scoreboard players remove @a[scores={skill.pistol_fire_cd=1..}] skill.pistol_fire_cd 1
scoreboard players remove @a[tag=skill.pistol_reloading,scores={skill.pistol_reload=1..}] skill.pistol_reload 1

execute as @a[tag=skill.pistol_reloading,scores={skill.pistol_reload=0}] run function skill:weapon/pistol/reload_finish
execute as @a[scores={skill.pistol_swap=1..}] run function skill:weapon/pistol/swap_reload
execute as @a unless entity @s[tag=skill.pistol_reloading] if items entity @s weapon.offhand minecraft:sugar[minecraft:custom_data~{weapon:"pistol"}] run function skill:weapon/pistol/swap_reload

tag @a remove skill.pistol_holding
execute as @a if items entity @s weapon.mainhand minecraft:sugar[minecraft:custom_data~{weapon:"pistol"}] run tag @s add skill.pistol_holding
execute as @a[tag=skill.pistol_holding,tag=!skill.pistol_update] run function skill:weapon/pistol/sync_held
execute as @a[tag=skill.pistol_holding] run function skill:weapon/pistol/render_xp
execute as @a[tag=!skill.pistol_holding,tag=skill.pistol_xp] run function skill:weapon/pistol/clear_xp

execute as @a[tag=skill.pistol_reloading] run title @s actionbar [{"text":"换弹中 ","color":"yellow"},{"score":{"name":"@s","objective":"skill.pistol_reload"}},{"text":"t","color":"dark_gray"}]

execute as @a[tag=skill.pistol_update] run function skill:weapon/pistol/update_item_sync
tag @a remove skill.pistol_update
