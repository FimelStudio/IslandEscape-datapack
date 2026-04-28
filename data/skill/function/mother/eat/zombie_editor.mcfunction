advancement revoke @s only skill:mother/eat/use_zombie_editor
execute unless entity @s[tag=role.mother] run return 0
execute unless entity @s[tag=mother_eating] run title @s actionbar {"text":"当前没有吞噬的感染体。","color":"gray"}
execute unless entity @s[tag=mother_eating] run return 0
execute unless entity @a[tag=eaten_zombie,limit=1] run title @s actionbar {"text":"吞噬目标丢失。","color":"red"}
execute unless entity @a[tag=eaten_zombie,limit=1] run return 0

function skill:mother/eat/config
execute store result storage zombie:eated target_health int 1 run attribute @a[tag=eaten_zombie,limit=1] minecraft:max_health base get 1
function skill:mother/eat/zombie_editor_dialog
