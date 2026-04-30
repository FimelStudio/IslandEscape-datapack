
execute if entity @s[tag=team.human] run function escape_island:role/_give_base_survivor

execute if entity @s[tag=role.doctor] run function escape_island:role/kit_doctor
execute if entity @s[tag=role.captain] run function escape_island:role/kit_captain
execute if entity @s[tag=role.engineer] run function escape_island:role/kit_engineer
execute if entity @s[tag=role.marine] run function escape_island:role/kit_marine
execute if entity @s[tag=role.chef] run function escape_island:role/kit_chef
execute if entity @s[tag=role.radio] run function escape_island:role/kit_radio
execute if entity @s[tag=role.virologist] run function escape_island:role/kit_virologist
execute if entity @s[tag=role.mechanic] run function escape_island:role/kit_mechanic
execute if entity @s[tag=role.athlete] run function escape_island:role/kit_athlete
execute if entity @s[tag=role.priest] run function escape_island:role/kit_priest

execute if entity @s[tag=role.doctor] run title @s title {"text":"§b船医","bold":true}
execute if entity @s[tag=role.captain] run title @s title {"text":"§e船长","bold":true}
execute if entity @s[tag=role.engineer] run title @s title {"text":"§6工程师","bold":true}
execute if entity @s[tag=role.marine] run title @s title {"text":"§c海军陆战队员","bold":true}
execute if entity @s[tag=role.chef] run title @s title {"text":"§a厨师","bold":true}
execute if entity @s[tag=role.radio] run title @s title {"text":"§3通讯员","bold":true}
execute if entity @s[tag=role.virologist] run title @s title {"text":"§2病毒学家","bold":true}
execute if entity @s[tag=role.mechanic] run title @s title {"text":"§7机修工","bold":true}
execute if entity @s[tag=role.athlete] run title @s title {"text":"§f运动员","bold":true}
execute if entity @s[tag=role.priest] run title @s title {"text":"§f§l神父","bold":true}
