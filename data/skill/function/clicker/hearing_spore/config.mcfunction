# 循声孢子参数入口。
# range：探测半径，默认 50 格。
data modify storage skill:clicker.hearing_spore config.range set value 50
# speed / wall_speed：孢子追踪速度；进入方块时使用 wall_speed。
data modify storage skill:clicker.hearing_spore config.speed set value "0.38"
data modify storage skill:clicker.hearing_spore config.wall_speed set value "0.13"
# spore_value：命中人类时增加的孢子感染值。
data modify storage skill:clicker.hearing_spore config.spore_value set value 20

scoreboard players set #cooldown skill.clicker_cfg 2400
scoreboard players set #miss_cooldown skill.clicker_cfg 400
scoreboard players set #release_delay skill.clicker_cfg 40
scoreboard players set #spore_health skill.clicker_cfg 6
scoreboard players set #spore_life skill.clicker_cfg 240
scoreboard players set #gun_damage skill.clicker_cfg 6
scoreboard players set #twenty skill.clicker_cfg 20
