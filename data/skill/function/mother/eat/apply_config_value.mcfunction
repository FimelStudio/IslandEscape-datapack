execute if score #health skill.mother_eat < #min_health skill.mother_eat run scoreboard players operation #health skill.mother_eat = #min_health skill.mother_eat
execute if score #health skill.mother_eat > #max_health skill.mother_eat run scoreboard players operation #health skill.mother_eat = #max_health skill.mother_eat

execute store result storage zombie:eated target_health int 1 run scoreboard players get #health skill.mother_eat
execute as @a[tag=skill.mother.eat.target,limit=1] run function skill:mother/eat/apply_health_value with storage zombie:eated

execute if score #health skill.mother_eat <= #tiny_max skill.mother_eat as @a[tag=skill.mother.eat.target,limit=1] run function skill:mother/eat/apply_preset_tiny with storage zombie:eated
execute if score #health skill.mother_eat > #tiny_max skill.mother_eat if score #health skill.mother_eat <= #small_max skill.mother_eat as @a[tag=skill.mother.eat.target,limit=1] run function skill:mother/eat/apply_preset_small with storage zombie:eated
execute if score #health skill.mother_eat > #small_max skill.mother_eat if score #health skill.mother_eat <= #normal_max skill.mother_eat as @a[tag=skill.mother.eat.target,limit=1] run function skill:mother/eat/apply_preset_normal with storage zombie:eated
execute if score #health skill.mother_eat > #normal_max skill.mother_eat if score #health skill.mother_eat <= #large_max skill.mother_eat as @a[tag=skill.mother.eat.target,limit=1] run function skill:mother/eat/apply_preset_large with storage zombie:eated
execute if score #health skill.mother_eat > #large_max skill.mother_eat as @a[tag=skill.mother.eat.target,limit=1] run function skill:mother/eat/apply_preset_huge with storage zombie:eated

execute as @a[tag=skill.mother.eating,limit=1] run function skill:mother/eat/item_release with storage zombie:eated
title @s actionbar {"text":"已更新感染体血量、体型和速度。","color":"dark_red"}
