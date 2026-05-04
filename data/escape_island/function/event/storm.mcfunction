weather thunder 1800
tag @a add event.storm
tellraw @a {"text":"§9[事件] 风暴来袭！户外持续掉血，寻找室内掩蔽。","color":"blue"}
playsound minecraft:entity.lightning_bolt.thunder master @a ~ ~ ~ 1 0.6
schedule function escape_island:event/_storm_end 1800t
