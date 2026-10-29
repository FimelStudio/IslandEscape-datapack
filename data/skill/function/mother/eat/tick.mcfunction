
execute if score $tick ie.hygiene matches 0 as @a[tag=ie.active,tag=!infected.mother] run function skill:mother/eat/cleanup_non_mother
execute if score $tick ie.hygiene matches 0 as @a[tag=ie.active,tag=infected.mother,tag=!state.hunting] run function skill:mother/eat/cleanup_non_mother
execute as @a[tag=ie.active,tag=infected.mother,tag=state.hunting,tag=!skill.mother.eating] run function skill:mother/eat/ensure_ready
execute as @a[tag=ie.active,tag=infected.mother,tag=skill.mother.eating] unless entity @a[tag=skill.mother.eat.target,limit=1] run function skill:mother/eat/reset_state
execute as @a[tag=ie.active,tag=skill.mother.eat.target,tag=skill.mother.eat.absorbing] at @s run function skill:mother/eat/absorb_tick
execute as @a[tag=ie.active,tag=infected.mother,tag=skill.mother.eating] unless entity @a[tag=skill.mother.eat.target,tag=skill.mother.eat.absorbing,limit=1] run function skill:mother/eat/ensure_eating_items
