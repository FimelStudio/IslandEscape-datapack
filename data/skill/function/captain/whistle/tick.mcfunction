
execute if score $tick ie.hygiene matches 0 as @a[tag=ie.active,tag=!role.captain] run function skill:captain/whistle/cleanup_non_captain

scoreboard players remove @a[tag=ie.active,tag=role.captain,scores={skill.whistle_cd=1..}] skill.whistle_cd 1

execute as @a[tag=ie.active,tag=role.captain,scores={skill.whistle_cd=0,skill.whistle_state=2}] run function skill:captain/whistle/update_item
execute as @a[tag=ie.active,tag=role.captain,scores={skill.whistle_cd=1..}] run function skill:captain/whistle/cooldown_tick
execute as @a[tag=ie.active,tag=role.captain] run function skill:captain/whistle/ensure_item
