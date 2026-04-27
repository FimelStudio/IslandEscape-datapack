
execute unless entity @a[tag=role.doctor] as @r[tag=candidate,tag=!role.mother] run function escape_island:role/_tag_doctor
execute as @r[tag=candidate,tag=!role.mother] run function escape_island:role/_tag_captain
execute as @r[tag=candidate,tag=!role.mother] run function escape_island:role/_tag_engineer
execute as @r[tag=candidate,tag=!role.mother] run function escape_island:role/_tag_marine
execute as @r[tag=candidate,tag=!role.mother] run function escape_island:role/_tag_chef
execute as @r[tag=candidate,tag=!role.mother] run function escape_island:role/_tag_radio
execute as @r[tag=candidate,tag=!role.mother] run function escape_island:role/_tag_virologist
execute as @r[tag=candidate,tag=!role.mother] run function escape_island:role/_tag_mechanic
execute as @r[tag=candidate,tag=!role.mother] run function escape_island:role/_tag_sailor
execute as @r[tag=candidate,tag=!role.mother] run function escape_island:role/_tag_priest
