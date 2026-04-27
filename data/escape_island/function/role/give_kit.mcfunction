# escape_island:role/give_kit  —  run as each player to give their role kit
# Called as @a after roles are assigned.

# All survivors: iron axe + M-7 pistol + 8 ammo + 3 food
execute if entity @s[tag=role.survivor] run function escape_island:role/_give_base_survivor

# Role-specific kits (mutually exclusive)
execute if entity @s[tag=role.doctor] run function escape_island:role/kit_doctor
execute if entity @s[tag=role.captain] run function escape_island:role/kit_captain
execute if entity @s[tag=role.engineer] run function escape_island:role/kit_engineer
execute if entity @s[tag=role.marine] run function escape_island:role/kit_marine
execute if entity @s[tag=role.chef] run function escape_island:role/kit_chef
execute if entity @s[tag=role.radio] run function escape_island:role/kit_radio
execute if entity @s[tag=role.virologist] run function escape_island:role/kit_virologist
execute if entity @s[tag=role.mechanic] run function escape_island:role/kit_mechanic
execute if entity @s[tag=role.sailor] run function escape_island:role/kit_sailor
execute if entity @s[tag=role.priest] run function escape_island:role/kit_priest

# Reveal role via private title
execute if entity @s[tag=role.doctor] run title @s title {"text":"§b船医","bold":true}
execute if entity @s[tag=role.captain] run title @s title {"text":"§e船长","bold":true}
execute if entity @s[tag=role.engineer] run title @s title {"text":"§6工程师","bold":true}
execute if entity @s[tag=role.marine] run title @s title {"text":"§c海军陆战队员","bold":true}
execute if entity @s[tag=role.chef] run title @s title {"text":"§a厨师","bold":true}
execute if entity @s[tag=role.radio] run title @s title {"text":"§3通讯员","bold":true}
execute if entity @s[tag=role.virologist] run title @s title {"text":"§2病毒学家","bold":true}
execute if entity @s[tag=role.mechanic] run title @s title {"text":"§7机修工","bold":true}
execute if entity @s[tag=role.sailor] run title @s title {"text":"§f水手","bold":true}
execute if entity @s[tag=role.priest] run title @s title {"text":"§f§l神父","bold":true}
