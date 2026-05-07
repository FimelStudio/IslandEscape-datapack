execute unless entity @s[tag=infected.mother,tag=skill.mother.eating] run title @s actionbar {"text":"当前没有可转化的吞噬目标。","color":"gray"}
execute unless entity @s[tag=infected.mother,tag=skill.mother.eating] run return 0
execute unless entity @a[tag=skill.mother.eat.target,limit=1] run title @s actionbar {"text":"吞噬目标丢失。","color":"red"}
execute unless entity @a[tag=skill.mother.eat.target,limit=1] run return 0
execute if entity @a[tag=skill.mother.eat.target,tag=infected.clicker,limit=1] run function skill:mother/eat/update_target_type
execute if entity @a[tag=skill.mother.eat.target,tag=infected.clicker,limit=1] run title @s actionbar {"text":"这个感染体已经是循声者。","color":"yellow"}
execute if entity @a[tag=skill.mother.eat.target,tag=infected.clicker,limit=1] run function skill:mother/eat/item_release with storage zombie:eated
execute if entity @a[tag=skill.mother.eat.target,tag=infected.clicker,limit=1] run function skill:mother/eat/item_editor
execute if entity @a[tag=skill.mother.eat.target,tag=infected.clicker,limit=1] run return 0

execute as @a[tag=skill.mother.eat.target,limit=1] run function skill:mother/eat/apply_clicker
function skill:mother/eat/item_release with storage zombie:eated
function skill:mother/eat/item_editor
title @s actionbar {"text":"已将吞噬目标转化为循声者。","color":"dark_green"}
