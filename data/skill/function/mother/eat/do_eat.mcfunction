advancement revoke @s only skill:mother/eat/eat_entity
clear @s minecraft:sugar[minecraft:custom_data={skill:"mother/eat_used"}]
execute unless entity @s[tag=infected.mother] run return 0
execute if entity @s[tag=skill.mother.eating] run title @s actionbar {"text":"已吞噬一个感染体","color":"red"}
execute if entity @s[tag=skill.mother.eating] run return 0

execute unless predicate skill:facing_zombie run function skill:mother/eat/eat_0
execute if predicate skill:facing_zombie run function skill:mother/eat/eat_1
