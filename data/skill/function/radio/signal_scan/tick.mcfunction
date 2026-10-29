
scoreboard players remove @a[tag=ie.active,tag=role.radio,scores={skill.signal_scan_cd=1..}] skill.signal_scan_cd 1
scoreboard players remove @a[tag=ie.active,tag=role.radio,scores={skill.signal_scan_time=1..}] skill.signal_scan_time 1

execute as @a[tag=ie.active,tag=role.radio,scores={skill.signal_scan_cd=0,skill.signal_scan_state=2}] run function skill:radio/signal_scan/update_item
execute as @a[tag=ie.active,tag=role.radio,scores={skill.signal_scan_cd=1..}] run function skill:radio/signal_scan/cooldown_tick
execute as @a[tag=ie.active,tag=role.radio] run function skill:radio/signal_scan/ensure_item
