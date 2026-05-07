
scoreboard players remove @a[tag=retained.radio,tag=infected.common,tag=!state.dead,scores={skill.radio_jam_cd=1..}] skill.radio_jam_cd 1
execute as @a[tag=retained.radio,tag=infected.common,tag=!state.dead,scores={skill.radio_jam_cd=0,skill.radio_jam_state=2}] run function skill:radio/jam/update_item
execute as @a[tag=retained.radio,tag=infected.common,tag=!state.dead,scores={skill.radio_jam_cd=1..}] run function skill:radio/jam/update_item
execute as @a[tag=retained.radio,tag=infected.common,tag=!state.dead] run function skill:radio/jam/ensure_item
