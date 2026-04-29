execute if entity @e[tag=skill.radio_inspect_target,tag=role.doctor,limit=1] run title @s actionbar {"text":"职业: 船医","color":"aqua"}
execute if entity @e[tag=skill.radio_inspect_target,tag=role.doctor,limit=1] run tag @s add skill.radio_role_found
execute if entity @e[tag=skill.radio_inspect_target,tag=role.captain,limit=1] run title @s actionbar {"text":"职业: 船长","color":"yellow"}
execute if entity @e[tag=skill.radio_inspect_target,tag=role.captain,limit=1] run tag @s add skill.radio_role_found
execute if entity @e[tag=skill.radio_inspect_target,tag=role.engineer,limit=1] run title @s actionbar {"text":"职业: 工程师","color":"gold"}
execute if entity @e[tag=skill.radio_inspect_target,tag=role.engineer,limit=1] run tag @s add skill.radio_role_found
execute if entity @e[tag=skill.radio_inspect_target,tag=role.marine,limit=1] run title @s actionbar {"text":"职业: 海军陆战队员","color":"red"}
execute if entity @e[tag=skill.radio_inspect_target,tag=role.marine,limit=1] run tag @s add skill.radio_role_found
execute if entity @e[tag=skill.radio_inspect_target,tag=role.chef,limit=1] run title @s actionbar {"text":"职业: 厨师","color":"green"}
execute if entity @e[tag=skill.radio_inspect_target,tag=role.chef,limit=1] run tag @s add skill.radio_role_found
execute if entity @e[tag=skill.radio_inspect_target,tag=role.radio,limit=1] run title @s actionbar {"text":"职业: 通讯员","color":"dark_aqua"}
execute if entity @e[tag=skill.radio_inspect_target,tag=role.radio,limit=1] run tag @s add skill.radio_role_found
execute if entity @e[tag=skill.radio_inspect_target,tag=role.virologist,limit=1] run title @s actionbar {"text":"职业: 病毒学家","color":"dark_green"}
execute if entity @e[tag=skill.radio_inspect_target,tag=role.virologist,limit=1] run tag @s add skill.radio_role_found
execute if entity @e[tag=skill.radio_inspect_target,tag=role.mechanic,limit=1] run title @s actionbar {"text":"职业: 机修工","color":"gray"}
execute if entity @e[tag=skill.radio_inspect_target,tag=role.mechanic,limit=1] run tag @s add skill.radio_role_found
execute if entity @e[tag=skill.radio_inspect_target,tag=role.sailor,limit=1] run title @s actionbar {"text":"职业: 水手","color":"white"}
execute if entity @e[tag=skill.radio_inspect_target,tag=role.sailor,limit=1] run tag @s add skill.radio_role_found
execute if entity @e[tag=skill.radio_inspect_target,tag=role.athlete,limit=1] run title @s actionbar {"text":"职业: 运动员","color":"white"}
execute if entity @e[tag=skill.radio_inspect_target,tag=role.athlete,limit=1] run tag @s add skill.radio_role_found
execute if entity @e[tag=skill.radio_inspect_target,tag=role.priest,limit=1] run title @s actionbar {"text":"职业: 神父","color":"white"}
execute if entity @e[tag=skill.radio_inspect_target,tag=role.priest,limit=1] run tag @s add skill.radio_role_found

execute unless entity @s[tag=skill.radio_role_found] if entity @e[tag=skill.radio_inspect_target,tag=role.mother,team=mother_hidden,limit=1] run title @s actionbar {"text":"职业: 幸存者","color":"green"}
execute unless entity @s[tag=skill.radio_role_found] if entity @e[tag=skill.radio_inspect_target,tag=role.mother,team=mother_hidden,limit=1] run tag @s add skill.radio_role_found
execute unless entity @s[tag=skill.radio_role_found] if entity @e[tag=skill.radio_inspect_target,tag=role.mother,tag=state.disguised,limit=1] run title @s actionbar {"text":"职业: 幸存者","color":"green"}
execute unless entity @s[tag=skill.radio_role_found] if entity @e[tag=skill.radio_inspect_target,tag=role.mother,tag=state.disguised,limit=1] run tag @s add skill.radio_role_found

execute unless entity @s[tag=skill.radio_role_found] if entity @e[tag=skill.radio_inspect_target,tag=role.mother,limit=1] run title @s actionbar {"text":"信号异常","color":"red"}
execute unless entity @s[tag=skill.radio_role_found] if entity @e[tag=skill.radio_inspect_target,tag=role.mother,limit=1] run tag @s add skill.radio_role_found
execute unless entity @s[tag=skill.radio_role_found] if entity @e[tag=skill.radio_inspect_target,tag=role.infected,limit=1] run title @s actionbar {"text":"信号异常","color":"red"}
execute unless entity @s[tag=skill.radio_role_found] if entity @e[tag=skill.radio_inspect_target,tag=role.infected,limit=1] run tag @s add skill.radio_role_found
execute unless entity @s[tag=skill.radio_role_found] if entity @e[tag=skill.radio_inspect_target,tag=state.infected_period,limit=1] run title @s actionbar {"text":"信号异常","color":"red"}
execute unless entity @s[tag=skill.radio_role_found] if entity @e[tag=skill.radio_inspect_target,tag=state.infected_period,limit=1] run tag @s add skill.radio_role_found

execute unless entity @s[tag=skill.radio_role_found] if entity @e[tag=skill.radio_inspect_target,tag=role.survivor,limit=1] run title @s actionbar {"text":"职业: 幸存者","color":"green"}
execute unless entity @s[tag=skill.radio_role_found] if entity @e[tag=skill.radio_inspect_target,limit=1] run title @s actionbar {"text":"信号未登记","color":"gray"}
