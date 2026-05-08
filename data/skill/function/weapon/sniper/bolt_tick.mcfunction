execute as @a[scores={skill.sniper_bolt=1..}] run title @s actionbar {"text":"SP-1 拉栓中","color":"aqua"}
scoreboard players remove @a[tag=skill.sniper.reloading,scores={skill.sniper_reload=1..}] skill.sniper_reload 1
execute as @a[tag=skill.sniper.reloading,scores={skill.sniper_reload=0}] run function skill:weapon/sniper/reload_finish
