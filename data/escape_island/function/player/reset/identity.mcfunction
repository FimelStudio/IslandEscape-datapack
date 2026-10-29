# 自动生成：tools/state_contract.json；请通过 python tools/generate_state.py 更新。
# 执行者 @s 是待重置玩家；只清理本模块拥有的临时状态。
tag @s remove gs.dead
tag @s remove gs.player
tag @s remove gs.ready
tag @s remove ie.active
tag @s remove ie.joined
tag @s remove ie.participant
tag @s remove infected.clicker
tag @s remove infected.common
tag @s remove infected.licker
tag @s remove infected.mother
tag @s remove infected.runner
tag @s remove infected.secondary_mother
tag @s remove infected.special
tag @s remove infected.spitter
tag @s remove infected.tank
tag @s remove range.active
tag @s remove retained.athlete
tag @s remove retained.captain
tag @s remove retained.chef
tag @s remove retained.doctor
tag @s remove retained.engineer
tag @s remove retained.marine
tag @s remove retained.mechanic
tag @s remove retained.priest
tag @s remove retained.radio
tag @s remove retained.virologist
tag @s remove role.athlete
tag @s remove role.captain
tag @s remove role.chef
tag @s remove role.doctor
tag @s remove role.engineer
tag @s remove role.marine
tag @s remove role.mechanic
tag @s remove role.priest
tag @s remove role.radio
tag @s remove role.virologist
tag @s remove state.role_candidate
tag @s remove state.training
tag @s remove team.human
tag @s remove team.infected
scoreboard players set @s ie.session 0
scoreboard players set @s is_mother 0
scoreboard players set @s role 0
