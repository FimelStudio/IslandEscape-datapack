tag @s remove skill.mother.eat.absorbing
scoreboard players reset @s skill.mother_eat_anim
gamemode spectator @s
spectate @a[tag=skill.mother.eating,limit=1] @s
execute as @a[tag=skill.mother.eating,limit=1] run function skill:mother/eat/item_release with storage zombie:eated
execute as @a[tag=skill.mother.eating,limit=1] run function skill:mother/eat/item_editor
execute as @a[tag=skill.mother.eating,limit=1] run title @s actionbar {"text":"已吞噬感染体，可编辑后直接吐出。","color":"dark_red"}

