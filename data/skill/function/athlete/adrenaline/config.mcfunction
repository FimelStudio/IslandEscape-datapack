# 持续时间，二百游戏刻等于十秒。
scoreboard players set #duration skill.adren_cfg 200

# 冷却时间，二千四百游戏刻等于一百二十秒。
scoreboard players set #cooldown skill.adren_cfg 2400

# 玩家速度效果等级，零表示速度一，约等于一点二倍移动速度。
scoreboard players set #speed_amp skill.adren_cfg 0

# 肾上腺素期间滑铲体力消耗百分比，五十表示消耗减半。
scoreboard players set #slide_cost_percent skill.adren_cfg 50
scoreboard players set #hundred skill.adren_cfg 100
scoreboard players set #nineteen skill.adren_cfg 19
scoreboard players set #twenty skill.adren_cfg 20

# 肾上腺素期间的三段滑铲速度，默认是普通滑铲速度的一点二倍。
data modify storage skill:athlete.adrenaline slide_speed.fast set value {speed:"0.726"}
data modify storage skill:athlete.adrenaline slide_speed.mid set value {speed:"0.5016"}
data modify storage skill:athlete.adrenaline slide_speed.slow set value {speed:"0.2904"}
