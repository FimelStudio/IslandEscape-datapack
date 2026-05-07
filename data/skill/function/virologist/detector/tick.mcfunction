
scoreboard players remove @a[tag=role.virologist,scores={skill.detector_cd=1..}] skill.detector_cd 1
execute as @a[tag=role.virologist,scores={skill.detector_cd=0,skill.detector_state=2}] run function skill:virologist/detector/update_item
execute as @a[tag=role.virologist,scores={skill.detector_cd=1..}] run function skill:virologist/detector/cooldown_tick
execute as @a[tag=role.virologist] run function skill:virologist/detector/ensure_item
