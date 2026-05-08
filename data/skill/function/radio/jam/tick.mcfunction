
scoreboard players remove @a[tag=retained.radio,tag=infected.common,tag=!state.dead,scores={skill.radio_jam_cd=1..}] skill.radio_jam_cd 1
execute as @a[tag=retained.radio,tag=infected.common,tag=!state.dead,scores={skill.radio_jam_cd=0,skill.radio_jam_state=2}] run function skill:radio/jam/update_item
execute as @a[tag=retained.radio,tag=infected.common,tag=!state.dead,scores={skill.radio_jam_cd=1..}] run function skill:radio/jam/update_item
execute as @a[tag=retained.radio,tag=infected.common,tag=!state.dead,scores={skill.forger_uses=..1}] run function skill:radio/jam/ensure_item

execute if score $forger signal_forger_active matches 1.. run scoreboard players remove $forger signal_forger_active 1
execute as @a[tag=retained.radio,tag=infected.common,tag=!state.dead,scores={skill.forger_passive_cd=1..}] run scoreboard players remove @s skill.forger_passive_cd 1
execute as @a[tag=retained.radio,tag=infected.common,tag=!state.dead,scores={skill.forger_passive_cd=..0}] run function skill:radio/forger/passive_trigger
