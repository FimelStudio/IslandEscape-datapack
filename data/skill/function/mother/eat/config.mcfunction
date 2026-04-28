# 吞噬编辑参数入口。
scoreboard players set #min_health skill.mother_eat 6
scoreboard players set #max_health skill.mother_eat 40
scoreboard players set #tiny_max skill.mother_eat 10
scoreboard players set #small_max skill.mother_eat 15
scoreboard players set #normal_max skill.mother_eat 25
scoreboard players set #large_max skill.mother_eat 32
scoreboard players set #release_side skill.mother_eat 0
scoreboard players set #release_up skill.mother_eat 180
scoreboard players set #release_forward skill.mother_eat 1200

data modify storage zombie:eated config_min_health set value 6
data modify storage zombie:eated config_max_health set value 40

# 按血量档位调整体型和速度。
data modify storage zombie:eated tiny_scale set value 0.75
data modify storage zombie:eated tiny_speed set value 0.13
data modify storage zombie:eated small_scale set value 0.9
data modify storage zombie:eated small_speed set value 0.115
data modify storage zombie:eated normal_scale set value 1.0
data modify storage zombie:eated normal_speed set value 0.1
data modify storage zombie:eated large_scale set value 1.18
data modify storage zombie:eated large_speed set value 0.085
data modify storage zombie:eated huge_scale set value 1.35
data modify storage zombie:eated huge_speed set value 0.07
