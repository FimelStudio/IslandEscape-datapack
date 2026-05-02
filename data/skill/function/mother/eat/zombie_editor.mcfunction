advancement revoke @s only skill:mother/eat/use_zombie_editor
clear @s minecraft:sugar[minecraft:custom_data={skill:"mother/zombie_editor_used"}]
execute unless entity @s[tag=infected.mother] run return 0
execute unless entity @s[tag=skill.mother.eating] run title @s actionbar {"text":"当前没有吞噬的感染体。","color":"gray"}
execute unless entity @s[tag=skill.mother.eating] run return 0
execute unless entity @a[tag=skill.mother.eat.target,limit=1] run title @s actionbar {"text":"吞噬目标丢失。","color":"red"}
execute unless entity @a[tag=skill.mother.eat.target,limit=1] run return 0

function skill:mother/eat/config
execute store result storage zombie:eated target_health int 1 run attribute @a[tag=skill.mother.eat.target,limit=1] minecraft:max_health base get 1
data modify storage zombie:eated config_health set value "$(config_health)"
function skill:mother/eat/zombie_editor_dialog with storage zombie:eated
function skill:mother/eat/item_editor
