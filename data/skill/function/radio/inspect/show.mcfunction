execute if entity @e[tag=skill.radio.inspect.target,tag=role.doctor,limit=1] run title @s actionbar {"text":"职业: 船医","color":"aqua"}
execute if entity @e[tag=skill.radio.inspect.target,tag=role.doctor,limit=1] run tag @s add skill.radio.role.found
execute if entity @e[tag=skill.radio.inspect.target,tag=role.captain,limit=1] run title @s actionbar {"text":"职业: 船长","color":"yellow"}
execute if entity @e[tag=skill.radio.inspect.target,tag=role.captain,limit=1] run tag @s add skill.radio.role.found
execute if entity @e[tag=skill.radio.inspect.target,tag=role.engineer,limit=1] run title @s actionbar {"text":"职业: 工程师","color":"gold"}
execute if entity @e[tag=skill.radio.inspect.target,tag=role.engineer,limit=1] run tag @s add skill.radio.role.found
execute if entity @e[tag=skill.radio.inspect.target,tag=role.marine,limit=1] run title @s actionbar {"text":"职业: 海军陆战队员","color":"red"}
execute if entity @e[tag=skill.radio.inspect.target,tag=role.marine,limit=1] run tag @s add skill.radio.role.found
execute if entity @e[tag=skill.radio.inspect.target,tag=role.chef,limit=1] run title @s actionbar {"text":"职业: 厨师","color":"green"}
execute if entity @e[tag=skill.radio.inspect.target,tag=role.chef,limit=1] run tag @s add skill.radio.role.found
execute if entity @e[tag=skill.radio.inspect.target,tag=role.radio,limit=1] run title @s actionbar {"text":"职业: 通讯员","color":"dark_aqua"}
execute if entity @e[tag=skill.radio.inspect.target,tag=role.radio,limit=1] run tag @s add skill.radio.role.found
execute if entity @e[tag=skill.radio.inspect.target,tag=role.virologist,limit=1] run title @s actionbar {"text":"职业: 病毒学家","color":"dark_green"}
execute if entity @e[tag=skill.radio.inspect.target,tag=role.virologist,limit=1] run tag @s add skill.radio.role.found
execute if entity @e[tag=skill.radio.inspect.target,tag=role.mechanic,limit=1] run title @s actionbar {"text":"职业: 机修工","color":"gray"}
execute if entity @e[tag=skill.radio.inspect.target,tag=role.mechanic,limit=1] run tag @s add skill.radio.role.found
execute if entity @e[tag=skill.radio.inspect.target,tag=role.athlete,limit=1] run title @s actionbar {"text":"职业: 运动员","color":"white"}
execute if entity @e[tag=skill.radio.inspect.target,tag=role.athlete,limit=1] run tag @s add skill.radio.role.found
execute if entity @e[tag=skill.radio.inspect.target,tag=role.priest,limit=1] run title @s actionbar {"text":"职业: 神父","color":"white"}
execute if entity @e[tag=skill.radio.inspect.target,tag=role.priest,limit=1] run tag @s add skill.radio.role.found

execute unless entity @s[tag=skill.radio.role.found] if entity @e[tag=skill.radio.inspect.target,tag=infected.mother,tag=!state.hunting,limit=1] run title @s actionbar {"text":"职业: 幸存者","color":"green"}
execute unless entity @s[tag=skill.radio.role.found] if entity @e[tag=skill.radio.inspect.target,tag=infected.mother,tag=!state.hunting,limit=1] run tag @s add skill.radio.role.found

execute unless entity @s[tag=skill.radio.role.found] if entity @e[tag=skill.radio.inspect.target,tag=infected.mother,tag=state.hunting,limit=1] run title @s actionbar {"text":"信号异常","color":"red"}
execute unless entity @s[tag=skill.radio.role.found] if entity @e[tag=skill.radio.inspect.target,tag=infected.mother,tag=state.hunting,limit=1] run tag @s add skill.radio.role.found
execute unless entity @s[tag=skill.radio.role.found] if entity @e[tag=skill.radio.inspect.target,tag=infected.common,limit=1] run title @s actionbar {"text":"信号异常","color":"red"}
execute unless entity @s[tag=skill.radio.role.found] if entity @e[tag=skill.radio.inspect.target,tag=infected.common,limit=1] run tag @s add skill.radio.role.found
execute unless entity @s[tag=skill.radio.role.found] if entity @e[tag=skill.radio.inspect.target,tag=state.infected_period,limit=1] run title @s actionbar {"text":"信号异常","color":"red"}
execute unless entity @s[tag=skill.radio.role.found] if entity @e[tag=skill.radio.inspect.target,tag=state.infected_period,limit=1] run tag @s add skill.radio.role.found

execute unless entity @s[tag=skill.radio.role.found] if entity @e[tag=skill.radio.inspect.target,tag=team.human,limit=1] run title @s actionbar {"text":"职业: 幸存者","color":"green"}
execute unless entity @s[tag=skill.radio.role.found] if entity @e[tag=skill.radio.inspect.target,limit=1] run title @s actionbar {"text":"信号未登记","color":"gray"}
