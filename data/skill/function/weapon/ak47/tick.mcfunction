kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:paper",components:{"minecraft:custom_data":{weapon:"ak47_used"}}}}]
execute as @a[tag=skill.ak47.update] run function skill:weapon/ak47/update_item_sync
tag @a remove skill.ak47.update
tag @a remove skill.ak47.holding
execute as @a if items entity @s weapon.mainhand minecraft:sugar[minecraft:custom_data~{weapon:"ak47"}] run tag @s add skill.ak47.holding

execute as @a[tag=skill.ak47.reloading,tag=!skill.ak47.holding] run title @s actionbar {"text":"换弹中断","color":"red"}
execute as @a[tag=skill.ak47.reloading,tag=!skill.ak47.holding] run tag @s remove skill.ak47.reloading
execute as @a[tag=!skill.ak47.holding] run scoreboard players set @s skill.ak47_reload 0

execute as @a[tag=skill.ak47.holding,tag=!skill.ak47.reloading] if items entity @s weapon.mainhand minecraft:sugar[minecraft:custom_data~{weapon:"ak47",reloading:1b}] run function skill:weapon/ak47/update_item

scoreboard players remove @a[scores={skill.ak47_fire_cd=1..}] skill.ak47_fire_cd 1
scoreboard players remove @a[tag=skill.ak47.reloading,scores={skill.ak47_reload=1..}] skill.ak47_reload 1

execute as @a[tag=skill.ak47.reloading,scores={skill.ak47_reload=0}] run function skill:weapon/ak47/reload_finish

execute as @a[scores={skill.ak47_swap=1..}] run function skill:weapon/ak47/swap_reload
execute as @a unless entity @s[tag=skill.ak47.reloading] if items entity @s weapon.offhand minecraft:sugar[minecraft:custom_data~{weapon:"ak47"}] run function skill:weapon/ak47/swap_reload

execute as @a[tag=skill.ak47.holding,tag=!skill.ak47.update] run function skill:weapon/ak47/sync_held
execute as @a[tag=skill.ak47.holding] run function skill:weapon/ak47/render_xp
execute as @a[tag=!skill.ak47.holding,tag=!skill.pistol.holding,tag=skill.ak47.xp] run function skill:weapon/ak47/clear_xp

execute as @a[tag=skill.ak47.reloading] run scoreboard players operation @s skill.ak47_reload_cs = @s skill.ak47_reload
execute as @a[tag=skill.ak47.reloading] run scoreboard players operation @s skill.ak47_reload_cs *= #five skill.ak47_tmp
execute as @a[tag=skill.ak47.reloading] run scoreboard players operation @s skill.ak47_reload_sec = @s skill.ak47_reload_cs
execute as @a[tag=skill.ak47.reloading] run scoreboard players operation @s skill.ak47_reload_sec /= #hundred skill.ak47_tmp
execute as @a[tag=skill.ak47.reloading] run scoreboard players operation @s skill.ak47_reload_frac = @s skill.ak47_reload_cs
execute as @a[tag=skill.ak47.reloading] run scoreboard players operation @s skill.ak47_reload_frac %= #hundred skill.ak47_tmp
execute as @a[tag=skill.ak47.reloading,scores={skill.ak47_reload_frac=0}] run title @s actionbar [{"text":"换弹中 ","color":"yellow"},{"score":{"name":"@s","objective":"skill.ak47_reload_sec"}},{"text":".00s","color":"dark_gray"}]
execute as @a[tag=skill.ak47.reloading,scores={skill.ak47_reload_frac=1..9}] run title @s actionbar [{"text":"换弹中 ","color":"yellow"},{"score":{"name":"@s","objective":"skill.ak47_reload_sec"}},{"text":".0","color":"dark_gray"},{"score":{"name":"@s","objective":"skill.ak47_reload_frac"}},{"text":"s","color":"dark_gray"}]
execute as @a[tag=skill.ak47.reloading,scores={skill.ak47_reload_frac=10..99}] run title @s actionbar [{"text":"换弹中 ","color":"yellow"},{"score":{"name":"@s","objective":"skill.ak47_reload_sec"}},{"text":".","color":"dark_gray"},{"score":{"name":"@s","objective":"skill.ak47_reload_frac"}},{"text":"s","color":"dark_gray"}]
